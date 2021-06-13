package com.gd.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.sakila.vo.Film;

@Mapper
public interface FilmMapper {
	List<Integer> selectFilmInStock(Map<String, Object> map);
	Film selectFilmOneByKey(int film_id);
	List<Map<String, Object>> selectFilmActorInFilmByKey(int filmId);
	String selectActorsInfo(int filmId); // 영화에 출연한 배우 정보 가져오기 VIEW테이블 이용
	void deleteActorsInfoByKey(int filmId);
	void insertFilmActorByKey(int actorId, int filmId);
	void insertFilm (Film film);
	void insertFilmCategory(int filmId, int categoryId);
	List<Map<String, Object>> selectFilmTitleList();
	double selectRentalRate(int filmId);
}