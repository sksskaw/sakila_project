package com.gd.sakila.mapper;

import java.util.Map;

import com.gd.sakila.vo.Actor;

public interface ActorMapper {
	Map<String, Object> selectActorInfoList();
	int insertActor(Actor actor);
}