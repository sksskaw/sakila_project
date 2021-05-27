package com.gd.sakila.restapi;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.gd.sakila.service.FilmService;

import lombok.extern.slf4j.Slf4j;

@RestController
public class FilmRestController {
	
	@Autowired FilmService filmService;
	
	@GetMapping("/getActorsCheckList")
	public List<Map<String, Object>> getFilmOne(@RequestParam(value="filmId", required = true)int filmId) {
		
		// 영화 상세정보 가져오기
		Map<String, Object> map = filmService.getFilmOne(filmId);

		// 해당 영화의 배우 체크리스트 데이터
		List<Map<String, Object>> actorsCheckList = (List<Map<String, Object>>)map.get("actorsCheckList");

		return actorsCheckList;
	}
}
