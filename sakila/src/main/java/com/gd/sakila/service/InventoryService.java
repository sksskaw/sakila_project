package com.gd.sakila.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.sakila.mapper.InventoryMapper;

@Service
public class InventoryService {
	@Autowired InventoryMapper inventoryMapper;
	
	// 재고 리스트 출력
	public List<Map<String, Object>> getInventoryList(Map<String, Object> map){
		return inventoryMapper.selectInventoryList(map);
	}
	
	// 분기 쿼리에 따른 재고 리스트 마지막페이지 가져오기
	public int getInventoryListTotal(Map<String, Object> map) {
		return inventoryMapper.selectInventoryListTotal(map);
	}
}
