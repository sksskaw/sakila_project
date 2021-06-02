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
import com.gd.sakila.vo.Category;
import com.gd.sakila.vo.Film;
import com.gd.sakila.vo.Language;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class FilmController {
	@Autowired FilmService filmService;
	
	// 영화 추가 입력폼
	@GetMapping("/addFilm")
	public String addFilm(Model model) {
		
		// 랭귀지 리스트
		List<Language> languageList = filmService.getLanguage();
		
		// 카테고리 리스트
		List<Category> categoryList = filmService.getCategory();
		
		model.addAttribute("languageList", languageList);
		model.addAttribute("categoryList", categoryList);
		
		return "film/addFilm";
	}
	
	// 영화 추가 form데이터 action처리
	@PostMapping("/addFilm")
	public String addFilm(Film film, @RequestParam(value="categoryId", required = true)int categoryId,
									 @RequestParam(value="specialFeatures", required = true) List<String> specialFeatures) {
					    // 위에 film은 vo와, 폼에서 넘길때 name을 같게 넘겨줘서 @RequestParam없이 바로 사용할 수 있고
						// @RequestParam이넘은 폼에서 넘길때 name이름이 다를때 붙여주고 value를 정해줄 수 있음
		
		log.debug("FilmController-/addFilm 채크된 specialFeatures 개수 :"+specialFeatures.size());
		log.debug("FilmController-/addFilm categoryId :"+categoryId);
		
		String specialFeaturesValue = "";
		
		// 체크박스에 선택된 데이터 하나의 문자열로 합치기
		for(int i=0; i<specialFeatures.size() ; i++) {
			specialFeaturesValue = specialFeaturesValue + specialFeatures.get(i);
			
			if( (i+1) <specialFeatures.size()) {
				specialFeaturesValue += ",";
			}
		}
		log.debug("FilmController-/addFilm specialFeaturesValue :"+specialFeaturesValue);
		
		film.setSpecialFeatures(specialFeaturesValue);
		log.debug("FilmController-/addFilm film :"+film.toString());
		
		int filmId = filmService.addFilm(film, categoryId); // 추가된 filmOne으로 가기위해 입력된 filmId를 가져온다.
		return "redirect:/admin/getFilmOne?filmId="+filmId;
	}
	
	// 영화에 출연한 배우 수정 폼으로 이동
	@GetMapping("/modifyFilmActorsInfo")
	public String modifyFilmActorsInfo(Model model, @RequestParam(value="filmId", required = true)int filmId) {
		
		// 영화 상세정보 가져오기
		Map<String, Object> map = filmService.getFilmOne(filmId);
		
		// 해당 영화의 배우 체크리스트 데이터
		List<Map<String, Object>> actorsCheckList = (List<Map<String, Object>>)map.get("actorsCheckList"); // 리스트로 형변환
		
		model.addAttribute("actorsCheckList", actorsCheckList);
		model.addAttribute("filmId", filmId);
		return"film/modifyFilmActorsInfo";
	}
	
	// 영화에 출연한 배우 수정 action처리
	@PostMapping("/modifyFilmActorsInfo")
	public String updateActorsInfo(
								   @RequestParam(value="filmId", required = true) int filmId,
								   @RequestParam(value="ck") List<Integer> ck) {
		
		log.debug("FilmController-/modifyFilmActorsInfo filmId :"+filmId);
		log.debug("FilmController-/modifyFilmActorsInfo ck length :"+ck.size());

		filmService.modifyFilmActorInfo(ck, filmId);
		
		return"redirect:/admin/getFilmOne?filmId="+filmId;
	}
	
	// 영화 상세정보 가져오기
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
		log.debug("actorsCheckList Size :" + actorsCheckList.size());
		
		// 해당 영화의 매장별 재고량 가져오기
		Map<String, Object> store1Stock = filmService.getFilmOneStockInStore(filmId, 1);
		Map<String, Object> store2Stock = filmService.getFilmOneStockInStore(filmId, 2);

		// controller -> view 데이터 넘겨주기
		model.addAttribute("film", film);
		model.addAttribute("actorsCheckList", actorsCheckList);
		model.addAttribute("actors", actors);
		model.addAttribute("store1Stock", store1Stock);
		model.addAttribute("store2Stock", store2Stock);
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
		List<Category> categoryList = filmService.getCategory();
		
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