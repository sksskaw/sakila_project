package com.gd.sakila.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.mapper.BoardMapper;
import com.gd.sakila.vo.Board;
import com.gd.sakila.vo.PageParam;

@Service
@Transactional
public class BoardService {
	@Autowired
	BoardMapper boardMapper;
	
	public void addBoard(Board board) {
		boardMapper.insertBoard(board);
	}
	
	public Map<String, Object> getBoardOne(int boardId) {
		return boardMapper.selectBoardOne(boardId);
	}
	
	public Map<String, Object> getBoardList(int currentPage, int rowPerPage, String searchWord){
		int boardTotal = boardMapper.selectBoardTotal(searchWord);
		
		int lastPage = ( boardTotal % rowPerPage !=0 ) ? 
							boardTotal/rowPerPage : (boardTotal/rowPerPage)+1;
		
		PageParam pageParam = new PageParam();
		pageParam.setBeginRow((currentPage - 1) * rowPerPage);
		pageParam.setRowPerPage(rowPerPage);
		pageParam.setSearchWord(searchWord);
		List<Board> boardList = boardMapper.selectBoardList(pageParam);
		
		Map<String, Object> map = new HashMap<>();
		map.put("lastPage", lastPage);
		map.put("boardList", boardList);
		return map;
	}
}