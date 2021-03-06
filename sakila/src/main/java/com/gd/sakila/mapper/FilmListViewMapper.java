package com.gd.sakila.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gd.sakila.vo.FilmListView;

@Mapper
public interface FilmListViewMapper {
	List<FilmListView> selectFilmList(HashMap<String, Object> map);
	int selectFilmTotal(HashMap<String, Object> map); // 페이징 처리를 위한 총 리스트 수
	List<String> selectCategory(); // 전체 카테고리 출력
	List<Double> selectPrice(); // 가격별 검색을 위한 출력
	List<String> selectRating(); // 등급별 검색을 위한 출력
}