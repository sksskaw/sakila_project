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
	
	// 대여 가능한 재고 리스트
	public List<Map<String, Object>> getCanRentalList(int filmId){
		return inventoryMapper.selectCanRentalList(filmId);
	}
	
	// 재고 추가
	public void addInventory(Map<String, Object> map) {
		inventoryMapper.insertInventory(map);
	}
	
	// 재고 추가
	public void removeInventory(int inventoryId) {
		inventoryMapper.deleteInventory(inventoryId);
	}
}
