package com.gd.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.sakila.vo.Board;
import com.gd.sakila.vo.PageParam;

@Mapper//- 자동으로 인터페이스의 서브클래스를 만들어줌...
public interface BoardMapper {
	//관리자 게시판 리스트
	List<Board> selectBoardList(PageParam page);
	//관리자 게시판 총 갯수를 구하는 쿼리
	int selectBoardTotal(String searchWord);
	//관리자 게시판 자세히 보기
	Map<String, Object> selectBoardOne(int boardId);
	//관리자 게시판 삽입
	int insertBoard(Board board);
	//관리자 게시판 삭제
	int deleteBoard(Board board);
	//관리자 게시파 업로드
	int updateBoard(Board board);
 }