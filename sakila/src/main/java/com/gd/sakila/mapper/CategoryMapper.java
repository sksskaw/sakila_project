package com.gd.sakila.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gd.sakila.vo.Category;

@Mapper
public interface CategoryMapper {
	List<Category> selectCategoryList(); // 영화 추가 시 카테고리 리스트 드롭박스 출력을 위한
}
