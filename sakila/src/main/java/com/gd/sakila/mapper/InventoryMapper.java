package com.gd.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface InventoryMapper {
	List<Map<String, Object>> selectInventoryList(Map<String, Object> map);
	int selectInventoryListTotal(Map<String, Object> map);
	List<Map<String, Object>> selectCanRentalList(int filmId);
}