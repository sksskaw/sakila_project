package com.gd.sakila.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.sakila.mapper.ActorMapper;
import com.gd.sakila.vo.Actor;

@Service
public class ActorService {
	@Autowired ActorMapper actorMapper;
	
	public Map<String, Object> getActorInfoList(int currentPage, int rowPerPage, String searchWord, String category){
		
		
		// 총 리스트 수를 알기위한 쿼리 파라미터 전송을 위한 map
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchWord", searchWord);
		paramMap.put("category", category);
		
		int filmTotal = actorMapper.selectActorInfoTotal(paramMap);
		
		// 동적 쿼리에 따른 마지막 페이지 계산
		int lastPage = (int)Math.ceil((double)filmTotal / rowPerPage);
		
		Map<String, Object> paramMap2 = new HashMap<String, Object>();
		paramMap2.put("beginRow", (currentPage-1)*rowPerPage);
		paramMap2.put("rowPerPage", rowPerPage);
		paramMap2.put("searchWord", searchWord);
		paramMap2.put("category", category);
		
		List<Map<String, Object>> actorList = actorMapper.selectActorInfoList(paramMap2);
		
		Map<String, Object> map = new HashMap<>(); // 영화 리스트와 마지막 페이지를 정보를 같이 보내기 위해 map사용
		map.put("lastPage", lastPage);
		map.put("actorList", actorList);
		
		return map;
	}
	
	public int addActor(Actor actor) {
		return this.actorMapper.insertActor(actor);
	}
}
