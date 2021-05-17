package com.gd.sakila.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Mapper;

import com.gd.sakila.vo.Board;
import com.gd.sakila.vo.PageParam;

@Mapper
public interface BoardMapper {
	List<Board> selectBoardList(PageParam pageParam);
	int selectBoardTotal(String searchWord);
	Map<String, Object> selectBoardOne(int boardId);
	void insertBoard(Board board);
	void deleteBoard(Board board);
	void updateBoard(Board board);
}