package com.gd.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.sakila.vo.Film;

@Mapper
public interface FilmMapper {
	List<Integer> selectFilmInStock(Map<String, Object> map);
	Film selectFilmOneByKey(int film_id);
}