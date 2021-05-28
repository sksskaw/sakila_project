package com.gd.sakila.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.sakila.service.FilmService;
import com.gd.sakila.vo.Film;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class FilmController {
	@Autowired FilmService filmService;
	
	@GetMapping("/addFilm")
	public String addFilm() {
		return "film/addFilm";
	}
	
	@GetMapping("/modifyFilmActorsInfo")
	public String modifyFilmActorsInfo(Model model, @RequestParam(value="filmId", required = true)int filmId) {
		
		// 영화 상세정보 가져오기
		Map<String, Object> map = filmService.getFilmOne(filmId);
		
		// 해당 영화의 배우 체크리스트 데이터
		List<Map<String, Object>> actorsCheckList = (List<Map<String, Object>>)map.get("actorsCheckList");
		model.addAttribute("actorsCheckList", actorsCheckList);
		model.addAttribute("filmId", filmId);
		return"film/modifyFilmActorsInfo";
	}
	
	@PostMapping("/modifyFilmActorsInfo")
	public String updateActorsInfo(
								   @RequestParam(value="filmId", required = true) int filmId,
								   @RequestParam(value="ck") List<Integer> ck) {
		log.debug("filmId :"+filmId);
		log.debug("ck length :"+ck.size());
		// 1. 해당 영화와 관계된 actor 정보 모두 삭제
		
		// 2. 체크된 데이터의 actorId 만들 가져와 film_actor 테이블에 삽입    1-2 과정이 하나의 서비스 트랜젝션
		filmService.modifyFilmActorInfo(ck, filmId);
		
		// 3. 수정된 FilmOne가져오기 아 그냥 리 다이랙트 하면되겠다
		
		
		return"redirect:/admin/getFilmOne?filmId="+filmId;
	}
	
	
	
	
	
	
	
	@GetMapping("/getFilmOne")
	public String getFilmOne(Model model, @RequestParam(value="filmId", required = true)int filmId) {
		
		// 영화 상세정보 가져오기
		Map<String, Object> map = filmService.getFilmOne(filmId);
		
		// 영화에 출연한 배우정보
		String actors = filmService.getActorsInfo(filmId);
		log.debug("actors :"+actors);
		
		// 기본 영화 상세정보
		Film film = (Film)map.get("film");
		log.debug("film Set :" + film.getSpecialFeatures());
		
		
		// 해당 영화의 배우 체크리스트 데이터
		List<Map<String, Object>> actorsCheckList = (List<Map<String, Object>>)map.get("actorsCheckList");
		
		// 해당 영화의 매장별 재고량 가져오기
		Map<String, Object> store1 = filmService.getFilmOneStockInStore(filmId, 1);
		Map<String, Object> store2 = filmService.getFilmOneStockInStore(filmId, 2);

		// controller -> view 데이터 넘겨주기
		model.addAttribute("film", film);
		model.addAttribute("actorsCheckList", actorsCheckList);
		model.addAttribute("actors", actors);
		model.addAttribute("store1", store1);
		model.addAttribute("store2", store2);
		return "/film/getFilmOne";
	}
	
	// 영화 리스트 출력
	@GetMapping("/getFilmList")
	public String getStaffList(Model model,
			@RequestParam(value="currentPage", defaultValue = "1") int currentPage,
			@RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage,
			@RequestParam(value="searchWord", required = false)String searchWord,
			@RequestParam(value="searchKind", defaultValue = "title")String searchKind,
			@RequestParam(value="category", required = false)String category,
			@RequestParam(value="price", required = false)Double price,
			@RequestParam(value="rating", required = false)String rating) {
		
		// null Param 처리, 값이 안들어왔을 경우 null이 아닌 공백으로 들어오기 때문
		if(searchWord != null && searchWord.equals("")) { // searchWord가 null이면 equals을 사용할 수 없음...
			searchWord = null;
		}
		
		if(category != null && category.equals("")) {
			category = null;
		}

		if(price != null && price == 0) {
			price = null;
		}
		
		if(rating != null && rating.equals("")) {
			rating = null;
		}
		
		log.debug("currentPage: "+ currentPage);
		log.debug("rowPerPage: "+ rowPerPage);
		log.debug("searchWord: "+ searchWord);
		log.debug("searchKind: "+ searchKind);
		log.debug("category: "+ category);
		log.debug("price: "+ price);
		log.debug("rating: "+ rating);
		
		// 영화 리스트 출력
		Map<String, Object> map = filmService.getFilmList(currentPage, rowPerPage, searchWord, searchKind, category, price, rating);
		
		// 영화 카테고리 출력
		List<String> categoryList = filmService.getCategory();
		
		// 가격별 출력
		List<Double> priceList = filmService.getPrice();
		
		// 등급별 출력
		List<String> ratingList = filmService.getRating();
		
		// 단일 변수 데이터
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("searchKind", searchKind);
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
		//log.debug("▶▶▶▶▶▶▶ FilmList Size : "+((List)map.get("filmList")).size()); 리스트 수 디버그
		
		return "/film/getFilmList";
	}
}