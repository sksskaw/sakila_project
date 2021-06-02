package com.gd.sakila.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.sakila.mapper.ActorMapper;
import com.gd.sakila.vo.Actor;

@Service
public class ActorService {
	@Autowired ActorMapper actorMapper;
	
	// 배우 리스트
	public List<Map<String, Object>> getActorInfoList(Map<String, Object> map){
		return actorMapper.selectActorInfoList(map);
	}
	
	// 리스트 페이징처리 마지막페이지
	public int getActorInfoListTotal(Map<String, Object> map){
		return actorMapper.selectActorInfoTotal(map);
	}
	
	public int addActor(Actor actor) {
		return this.actorMapper.insertActor(actor);
	}
}
