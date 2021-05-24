package com.gd.sakila.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.gd.sakila.service.BoardfileService;
import com.gd.sakila.vo.Boardfile;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class BoardfileController {
	@Autowired BoardfileService boardfileService;
	
	@GetMapping("/removeBoardfile")
	public String removeBoardfile(Boardfile boardfile) {
		// 글쓴이가 아니라도 삭제가 가능하다
		boardfileService.removeBoardfileOne(boardfile);
		return "redirect:/admin/getBoardOne?boardId="+boardfile.getBoardId();
	}
	
	@GetMapping("/addBoardfile")
	public String addBoardfile(Model model, @RequestParam(value = "boardId", required = true) int boardId) {
		model.addAttribute("boardId", boardId);
		return "/board/addBoardfile";
	}
	@PostMapping("/addBoardfile")
	public String addBoard(MultipartFile multipartFile, @RequestParam(value = "boardId", required = true) int boardId) {
		log.debug("▶▶▶▶▶▶ boardId :"+boardId);
		log.debug("▶▶▶▶▶▶ multipartFile :"+multipartFile);
		boardfileService.addBoardfile(multipartFile, boardId);
		return "redirect:/admin/getBoardOne?boardId="+boardId;
	}
	
	
}
