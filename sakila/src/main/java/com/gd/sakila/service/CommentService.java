package com.gd.sakila.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.mapper.CommentMapper;
import com.gd.sakila.vo.Comment;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Transactional
public class CommentService {
	@Autowired
	CommentMapper commentMapper;
	//관리자 게시판 댓글 삭제
	public int removeCommet(int commentId) {
		log.debug("▶▶▶▶▶▶ removeCommetByCommentId() param: "+ commentId);
		
		int row = commentMapper.deleteCommentByCommentId(commentId);
		log.debug("▶▶▶▶▶▶ removeCommetByCommentId() row: " + row);
		
		return row;
	}
	
	//관리자 게시판 댓글 입력
	public int addComment(Comment comment) {
		log.debug("▶▶▶▶▶▶ addComment() param: "+ comment.toString());
		
		int row = commentMapper.insertComment(comment);
		log.debug("▶▶▶▶▶▶ addComment() row: " + row);
		
		return row;
	}
}