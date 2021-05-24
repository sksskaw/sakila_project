package com.gd.sakila.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.sakila.service.FilmService;
import com.gd.sakila.vo.FilmListView;
import com.gd.sakila.vo.StaffListView;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class FilmController {
	@Autowired FilmService filmService;
	
	@GetMapping("/getFilmOne")
	public String getFilmOne() {
		filmService.getFilmOne(1, 1);
		return "getFilmOne";
	}
	
	// 영화 리스트 출력
	@GetMapping("/getFilmList")
	public String getStaffList(Model model,
			@RequestParam(value="currentPage", defaultValue = "1") int currentPage,
			@RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage,
			@RequestParam(value="searchWord", required = false)String searchWord,
			@RequestParam(value="category", required = false)String category) {
		
		log.debug("currentPage: "+ currentPage);
		log.debug("rowPerPage: "+ rowPerPage);
		log.debug("searchWord: "+ searchWord);
		log.debug("category: "+ category);
		// 영화 리스트 출력
		Map<String, Object> map = filmService.getFilmList(currentPage, rowPerPage, searchWord, category);
		
		// 영화 카테고리 출력
		List<String> categoryList = filmService.getCategory();
		
		// 가격별 출력
		List<Double> priceList = filmService.getPrice();
		
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("category", category);
		model.addAttribute("priceList", priceList);
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("filmList", map.get("filmList"));
		model.addAttribute("categoryList", categoryList);
		log.debug("▶▶▶▶▶▶▶ FilmList Size : "+((List)map.get("filmList")).size());
		
		return "/film/getFilmList";
	}
}