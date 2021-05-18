package com.gd.sakila.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gd.sakila.vo.Comment;

@Mapper
public interface CommentMapper {
	int deleteCommentByCommentId(int commentId);
	int insertComment(Comment comment);
	int deleteCommentByBoardId(int boardId);
	List<Comment> selectCommentListByBoard(int boardId);
}