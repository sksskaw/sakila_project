package com.gd.sakila.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gd.sakila.vo.Language;

@Mapper
public interface LanguageMapper {
	List<Language> selectLanguageList(); // 영화 추가 시 언어 리스트 드롭박스 출력을 위한
}