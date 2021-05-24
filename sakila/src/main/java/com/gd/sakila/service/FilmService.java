package com.gd.sakila.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.mapper.FilmListViewMapper;
import com.gd.sakila.mapper.FilmMapper;
import com.gd.sakila.vo.FilmListView;
import com.gd.sakila.vo.PageParam;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class FilmService {
		@Autowired FilmMapper filmMapper;
		@Autowired FilmListViewMapper filmListViewMapper;

		// 매장별 영화 재고 검색
		public Map<String, Object> getFilmOne(int filmId, int storeId) {
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("filmId", filmId);
			paramMap.put("storeId", storeId);
			int filmCount = 0;
			paramMap.put("filmCount", filmCount);
			List<Integer> list = filmMapper.selectFilmInStock(paramMap);
			log.debug("★★★★★ filmCount :"+paramMap.get("filmCount"));
			log.debug("★★★★★ x :"+list);
			
			Map<String, Object> returnMap = new HashMap<String, Object>();
			return returnMap;
		}
		
		// 영화 리스트 출력 film_list VIEW 사용
		public Map<String, Object> getFilmList(int currentPage, int rowPerPage, String searchWord, String category, double price){
			
			int filmTotal = filmListViewMapper.selectFilmTotal(searchWord);
			int lastPage = (int)Math.ceil((double)filmTotal / rowPerPage);
			
			PageParam page = new PageParam();
			page.setBeginRow((currentPage-1)*rowPerPage); // 시작페이지
			page.setRowPerPage(rowPerPage);
			page.setSearchWord(searchWord);
			
			// 리스트 출력 쿼리 파라미터 전송을 위한 map
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("beginRow", page.getBeginRow());
			paramMap.put("rowPerPage", page.getRowPerPage());
			paramMap.put("searchWord", page.getSearchWord());
			paramMap.put("category", category);
			paramMap.put("price", price);
			
			List<FilmListView> filmList = filmListViewMapper.selectFilmList(paramMap);
			
			Map<String, Object> map = new HashMap<>(); // 영화 리스트와 마지막 페이지를 정보를 같이 보내기 위해 map사용
			map.put("lastPage", lastPage);
			map.put("filmList", filmList);
			
			return map;
		}
		
		// 영화 카테고리 출력
		public List<String> getCategory(){
			return filmListViewMapper.selectCategory();
		}
		
		// 영화 카테고리 출력
		public List<Double> getPrice(){
			return filmListViewMapper.selectPrice();
		}
}
