package com.gd.sakila.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.mapper.CategoryMapper;
import com.gd.sakila.mapper.FilmListViewMapper;
import com.gd.sakila.mapper.FilmMapper;
import com.gd.sakila.mapper.LanguageMapper;
import com.gd.sakila.vo.Category;
import com.gd.sakila.vo.Film;
import com.gd.sakila.vo.FilmListView;
import com.gd.sakila.vo.Language;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class FilmService {
		@Autowired FilmMapper filmMapper;
		@Autowired FilmListViewMapper filmListViewMapper;
		@Autowired CategoryMapper categoryMapper;
		@Autowired LanguageMapper languageMapper;
		
		// 영화 추가
		public int addFilm(Film film, int CategoryId) {
			
			filmMapper.insertFilm(film); // film 테이블에 입력
			filmMapper.insertFilmCategory(film.getFilmId(), CategoryId); // film_category 테이블에 입력
			
			return film.getFilmId(); // filmOne으로 리다이렉트 하기위한 리턴값
		}
		
		
		// 해당 영화의 출연 배우 수정
		public void modifyFilmActorInfo(List<Integer> actorId, int filmId) {

			//본래 출연진 삭제
			filmMapper.deleteActorsInfoByKey(filmId);

			//출연진 insert
			if(actorId == null) {
				return ;
			}
			
			// 채크된 배우 수 만큼 반복문을 돌면서 insert
			for(int i=0; i<actorId.size() ; i++) {
				filmMapper.insertFilmActorByKey(actorId.get(i), filmId);
			}
		}
		
		// 영화에 출연한 배우 정보
		public String getActorsInfo(int filmId) {
			return filmMapper.selectActorsInfo(filmId);
		}
		
		// 영화 상세정보 가져오기
		public Map<String, Object> getFilmOne(int filmId) {

			Film film = filmMapper.selectFilmOneByKey(filmId);
			List<Map<String, Object>> actorsCheckList = filmMapper.selectFilmActorInFilmByKey(filmId);
			
			Map<String, Object> map = new HashMap<>();
			map.put("film", film);
			map.put("actorsCheckList", actorsCheckList);
			
			return map;
		}
		
		// 매장별 영화 재고 검색
		public Map<String, Object> getFilmOneStockInStore(int filmId, int storeId) {
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("filmId", filmId);
			paramMap.put("storeId", storeId);
			int filmCount = 0;
			paramMap.put("filmCount", filmCount);
			List<Integer> list = filmMapper.selectFilmInStock(paramMap);
			log.debug("★★★★★ filmCount :"+paramMap.get("filmCount"));
			log.debug("★★★★★ x :"+list);
			
			return paramMap;
		}
		
		// 영화 리스트 출력 film_list VIEW 사용
		public Map<String, Object> getFilmList(int currentPage, int rowPerPage, String searchWord, String searchKind, String category, Double price, String rating){
			
			// 총 리스트 수를 알기위한 쿼리 파라미터 전송을 위한 map
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("searchWord", searchWord);
			paramMap.put("searchKind", searchKind);
			paramMap.put("category", category);
			paramMap.put("price", price);
			paramMap.put("rating", rating);
			
			int filmTotal = filmListViewMapper.selectFilmTotal(paramMap);
			
			// 동적 쿼리에 따른 마지막 페이지 계산
			int lastPage = (int)Math.ceil((double)filmTotal / rowPerPage);
				
			// 리스트 출력 쿼리 파라미터 전송을 위한 map
			HashMap<String, Object> paramMap2 = new HashMap<String, Object>();
			paramMap2.put("beginRow", (currentPage-1)*rowPerPage);
			paramMap2.put("rowPerPage", rowPerPage);
			paramMap2.put("searchWord", searchWord);
			paramMap2.put("searchKind", searchKind);
			paramMap2.put("category", category);
			paramMap2.put("price", price);
			paramMap2.put("rating", rating);
			
			List<FilmListView> filmList = filmListViewMapper.selectFilmList(paramMap2);
			
			Map<String, Object> map = new HashMap<>(); // 영화 리스트와 마지막 페이지를 정보를 같이 보내기 위해 map사용
			map.put("lastPage", lastPage);
			map.put("filmList", filmList);
			
			return map;
		}
		
		// 영화 카테고리 리스트 출력
		public List<Category> getCategory(){
			return categoryMapper.selectCategoryList();
		}
		
		// 영화 카테고리 리스트 출력
		public List<Language> getLanguage(){
			return languageMapper.selectLanguageList();
		}
		
		// 영화 가격 리스트 출력
		public List<Double> getPrice(){
			return filmListViewMapper.selectPrice();
		}
		
		// 영화 등급 리스트 출력
		public List<String> getRating(){
			return filmListViewMapper.selectRating();
		}
}
