package com.gd.sakila.restapi;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.gd.sakila.service.InventoryService;

@RestController
public class InventoryRestController {
	@Autowired InventoryService inventoryService;
	
	// 해당 영화의 대여 가능 재고 리스트 출력
	@GetMapping("/getCanRentalList")
	public List<Map<String, Object>> getFilmList(@RequestParam(value="filmId", required = true)int filmId) {
		List<Map<String, Object>> canRentalList= inventoryService.getCanRentalList(filmId);
		return canRentalList;
	}
}