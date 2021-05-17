package com.gd.sakila.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.sakila.service.BoardService;
import com.gd.sakila.vo.Board;

@Controller
public class BoardController {
	@Autowired
	BoardService boardService;
	
	@GetMapping("/addBoard")
	public String addBoard() {
		return "addBoard";
	}
	
	// 게시글 입력 staffId 세션에서 가져오는걸로 변경해야함
	@PostMapping("/addBoard")
	public String addBoard(Board board) { // 커맨드객체
		boardService.addBoard(board);
		return "redirect:/getBoardList";
	}
	
	
	@GetMapping("/getBoardOne")
	public String getBoardOne(Model model,
								@RequestParam(value="boardId", required = true) int boardId) {
		
		Map<String, Object> boardOneMap = boardService.getBoardOne(boardId);
		model.addAttribute("boardOneMap", boardOneMap);
		return "getBoardOne";
	}
	
	@GetMapping("/getBoardList")
	public String getBoardList(Model model,
								@RequestParam(value="currentPage", defaultValue = "1") int currentPage,
								@RequestParam(value="rowPerPage", defaultValue = "10") int rowPerPage,
								@RequestParam(value="searchWord", required = false ) String searchWord) {
		System.out.println(currentPage+"<--currentPage");
		System.out.println(rowPerPage+"<--rowPerPage");
		System.out.println(searchWord+"<--searchWord");

		Map<String, Object> map = boardService.getBoardList(currentPage, rowPerPage, searchWord);	

		model.addAttribute("currentPage", currentPage);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("boardList", map.get("boardList"));

		return "getBoardList";
	}
}