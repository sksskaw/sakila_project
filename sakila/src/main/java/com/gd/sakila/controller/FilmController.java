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
			@RequestParam(value="category", required = false)String category,
			@RequestParam(value="price", required = false)String price,
			@RequestParam(value="rating", required = false)String rating) {
		
		// null Param 처리, 값이 안들어왔을 경우 null이 아닌 공백으로 들어오기 때문
		if(searchWord != null && searchWord.equals("")) { // searchWord가 null이면 equals을 사용할 수 없음...
			searchWord = null;
		}
		
		if(category != null && category.equals("")) {
			category = null;
		}
		
		double doublePrice = 0;
		
		if(price != null && !price.equals("")) {  // 공백이 아니면, price의 값이 들어오면 문자열 price 값을 double 형태로 형변환하여 처리
			doublePrice = Double.parseDouble(price);
		}
		
		if(rating != null && rating.equals("")) {
			rating = null;
		}
		
		log.debug("currentPage: "+ currentPage);
		log.debug("rowPerPage: "+ rowPerPage);
		log.debug("searchWord: "+ searchWord);
		log.debug("category: "+ category);
		log.debug("price: "+ price);
		log.debug("rating: "+ rating);
		
		// 영화 리스트 출력
		Map<String, Object> map = filmService.getFilmList(currentPage, rowPerPage, searchWord, category, doublePrice, rating);
		
		// 영화 카테고리 출력
		List<String> categoryList = filmService.getCategory();
		
		// 가격별 출력
		List<Double> priceList = filmService.getPrice();
		
		// 등급별 출력
		List<String> ratingList = filmService.getRating();
		
		// 단일 변수 데이터
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("category", category);
		model.addAttribute("price", price);
		model.addAttribute("rating", rating);
		
		// 리스트 데이터
		model.addAttribute("priceList", priceList);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("ratingList", ratingList);
		
		// map 데이터
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("filmList", map.get("filmList"));
		log.debug("▶▶▶▶▶▶▶ FilmList Size : "+((List)map.get("filmList")).size());
		
		return "/film/getFilmList";
	}
}