package com.gd.sakila.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gd.sakila.vo.Boardfile;

@Mapper
public interface BoardfileMapper {
	int insertBoardfile(Boardfile boardfile);
	List<Boardfile> selectBoardfileByBoardId(int boardId);
	int deleteBoardfileByBoardId(int boardId);
}
