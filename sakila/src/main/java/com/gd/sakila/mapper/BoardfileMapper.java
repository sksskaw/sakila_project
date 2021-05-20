package com.gd.sakila.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gd.sakila.vo.Boardfile;

@Mapper
public interface BoardfileMapper {
	int insertBoardfile(Boardfile boardfile);
}
