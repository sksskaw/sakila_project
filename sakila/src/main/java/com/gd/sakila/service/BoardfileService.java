package com.gd.sakila.service;

import java.io.File;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.gd.sakila.mapper.BoardfileMapper;
import com.gd.sakila.vo.Boardfile;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class BoardfileService {
	@Autowired BoardfileMapper boardfileMapper;
	
	public int removeBoardfileOne(Boardfile boardfile) {
		log.debug("▶▶▶▶▶▶ removeBoardfileOne param :"+boardfile);
		
		// 1) 물리적 파일 삭제
		File temp = new File("");
		String path = temp.getAbsolutePath();
		File file = new File(path + "\\src\\main\\webapp\\resource\\" + boardfile.getBoardfileName());
		if(file.exists()) {
			log.debug("▶▶▶▶▶▶ removeBoardfileOne() if문....");
			file.delete();
		}
		// 2) db삭제
		int row = boardfileMapper.deleteBoardfileOne(boardfile.getBoardfileId());
		log.debug("삭제성공(1), 삭제실패(0) :"+row);
		
		return row;
	}
	
	public int addBoardfile(MultipartFile multipartFile, int boardId) {
		// 1) 물리적 파일 저장
		File temp = new File("");
		// 프로젝트 경로
		String path = temp.getAbsolutePath();
		// 확장자
		int p = multipartFile.getOriginalFilename().lastIndexOf(".");
		String ext = multipartFile.getOriginalFilename().substring(p);
		// 확장자를 제외한 파일 이름
		String prename = UUID.randomUUID().toString().replace("-", "");
		File file = new File(path+"\\src\\main\\webapp\\resource\\"+prename+ext);
		try {
			multipartFile.transferTo(file); // multipart안에 파일을 빈file로 복사
		} catch (Exception e) {
			throw new RuntimeException();
		} 
		
		// 2) db저장
		Boardfile boardfile = new Boardfile();
		boardfile.setBoardId(boardId);
		boardfile.setBoardfileName(prename+ext);
		boardfile.setBoardfileSize(multipartFile.getSize());
		boardfile.setBoardfileType(multipartFile.getContentType());
		
		int row = boardfileMapper.insertBoardfile(boardfile);
		
		return row;
	}
}