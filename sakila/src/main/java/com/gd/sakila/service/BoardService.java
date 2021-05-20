package com.gd.sakila.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.gd.sakila.mapper.BoardMapper;
import com.gd.sakila.mapper.BoardfileMapper;
import com.gd.sakila.mapper.CommentMapper;
import com.gd.sakila.vo.Board;
import com.gd.sakila.vo.BoardForm;
import com.gd.sakila.vo.Boardfile;
import com.gd.sakila.vo.Comment;
import com.gd.sakila.vo.PageParam;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
@Transactional
public class BoardService {
	@Autowired BoardMapper boardMapper;
	@Autowired BoardfileMapper boardfileMapper;
	@Autowired CommentMapper commentMapper;
	
	//게시글 수정 호출
	public int modifyBoard(Board board) {
		log.debug("▶▶▶▶▶ modifyBoard() param: "+board.toString());
		return boardMapper.updateBoard(board);
	}
	

	//게시물 삭제
	public int removeBoard(Board board) {
		log.debug("▶▶▶▶▶ removeBoard() param:"+ board.toString());	
		
		//2) 게시글 삭제 -- FK(외래키)를 지정하지 않거나, FK를 delete no action..
		int boardRow = boardMapper.deleteBoard(board);
		if(boardRow == 0) {//패스워드가 지정되어 있지 않으면 게시글은 삭제되지 않으면서 댓글을 삭제될 수 있다.
			log.debug("삭제된 게시물이 없음");
			return 0;
		}
		log.debug("게시물 삭제");
		//1) 댓글삭제
		int commentRow = commentMapper.deleteCommentByBoardId(board.getBoardId());
		log.debug("▶▶▶▶▶▶ remeveBoard() commentRow: " + commentRow);
		
		
		
		log.debug("▶▶▶▶▶▶ remeveBoard() boardRow: " + boardRow);
		
		return boardRow;
	}
	
	
	//게시물 추가
	public void addBoard(BoardForm boardForm) {
		//boardFrom  --> board, boardfile
		log.debug("boardForm :"+boardForm);
		
		// 1) board 분할
		Board board = boardForm.getBoard(); // boardId값이 null
		log.debug("board :"+board.getBoardId()); // 0
		boardMapper.insertBoard(board); 
		// 입력시 만들어진 key값을 리턴받아야 한다. -> 리턴받을수 없다. -> 매개변수 board의 boardId값 변경해준다.
		log.debug("board :"+board.getBoardId()); // auto increment로 입력된 값
		
		// 2) boardfile 분할
		List<MultipartFile> list = boardForm.getBoardfile();
		if(list != null) {
			for(MultipartFile f : list) {
				Boardfile boardfile = new Boardfile();
				boardfile.setBoardId(board.getBoardId()); // auto increment로 입력된 값
				// test.txt -> newname.txt
				String originalFilename = f.getOriginalFilename();
				int p = originalFilename.lastIndexOf("."); // 4
				String ext = originalFilename.substring(p).toLowerCase(); // .txt
				String prename = UUID.randomUUID().toString().replace("-", "");
				
				String filename = prename+ext;
				boardfile.setBoardfileName(filename); // 이슈>>>> 중복으로 인해 덮어쓰기 가능
				boardfile.setBoardfileSize(f.getSize());
				boardfile.setBoardfileType(f.getContentType());
				log.debug("boardfile :"+boardfile);
				// 2-1)
				boardfileMapper.insertBoardfile(boardfile);
				
				// 2-2)
				// 파일을 저장
				try {
					f.transferTo(new File("C:\\Users\\김태훈\\Desktop\\sts-4.10.0.RELEASE\\upload\\sakila_file_Upload\\"+filename));
				} catch (Exception e) {
					throw new RuntimeException();
				} 
			}
		}

	}
	
	
	//1)boardOne 상세보기 + 2)댓글목록, 수정폼
	public Map<String,Object> getBoardOne(int boardId){
		log.debug("▶▶▶▶▶▶ getBoardOne() param:"+boardId);
		//1)상세보기
		Map<String, Object> boardMap = boardMapper.selectBoardOne(boardId);
		
		//2)댓글 목록
		List<Comment> commentList = commentMapper.selectCommentListByBoard(boardId);
		log.debug("commentList size():"+ commentList.size());
		
		//3)리턴 값 정리
		Map<String, Object> map = new HashMap<>();
		map.put("boardMap", boardMap);
		map.put("commentList", commentList);
		
		return map;
	}
	//관리자 게시판 리스트
	public Map<String, Object> getBoardList(int currentPage, int rowPerPage, String searchWord){
		//1
		int boardTotal = boardMapper.selectBoardTotal(searchWord);//searchword

		int lastPage = (int)Math.ceil((double)boardTotal / rowPerPage);
		/*
		 * int lastPage = boardTotal/rowPerPage;
		if(lastPage%rowPerPage != 0) {
			lastPage ++;
		}
		*/
		//2.
		PageParam page = new PageParam();
		page.setBeginRow((currentPage-1)*rowPerPage); // 시작페이지
		page.setRowPerPage(rowPerPage);
		page.setSearchWord(searchWord);
		//3.
		List<Board> boardList = boardMapper.selectBoardList(page);//page
		
		//확장성 때문에 큰 타입으로 받음...
		Map<String, Object> map = new HashMap<>();
		
		log.debug("getBoardList: "+map.toString());
		map.put("lastPage", lastPage);
		map.put("boardList", boardList);
		
		return map;
	}
}