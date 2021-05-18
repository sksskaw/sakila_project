package com.gd.sakila.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.sakila.service.CommentService;
import com.gd.sakila.vo.Comment;

import lombok.extern.slf4j.Slf4j;
@Slf4j//log 각체 생성
@Controller //spring이 스캔 -> 객체생성
public class CommentController {
	@Autowired // 의존 객체 주입(DI)
	CommentService commentService;
	
	@GetMapping("/removeComment")
	public String removeComment(@RequestParam(value = "commentId", required = true)int commentId,
								@RequestParam(value = "boardId", required = true)int boardId) {
		//required = true --> 필수 입력 사항
		log.debug("▶▶▶▶▶▶ removeComment comentId param: "+commentId);
		log.debug("▶▶▶▶▶▶ removeComment boardId param: "+boardId);
		
		//댓글 삭제 서비스 호출
		int row = commentService.removeCommet(commentId);
		log.debug("▶▶▶▶▶▶ removeComment row: "+row);
		
		return "redirect:/getBoardOne?boardId="+boardId;
	}
	
	@PostMapping("/addComment")
	public String addComment(Comment comment) {
		log.debug("▶▶▶▶▶▶ addComment() param: "+comment.toString());
		//댓글 입력 서비스 호출
		int row = commentService.addComment(comment);
		log.debug("▶▶▶▶▶▶ addComment() row: "+row);
		
		return "redirect:/getBoardOne?boardId="+comment.getBoardId();
	}
}