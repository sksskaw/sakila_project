package com.gd.sakila.restapi;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gd.sakila.service.SalesService;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class SalesRestController {
	@Autowired SalesService salesService;
	
	@GetMapping("/getSalesByCategoryList")
	public List<Map<String, Object>> getSalesByCategoryList() {
		
		log.debug("getSalesByCategoryList RestAip 요청");
		
		return salesService.getSalesByCategoryList();
	}
	
	@GetMapping("/getmonthlySalesList")
	public List<Map<String, Object>> getmonthlySalesList() {
		
		log.debug("getmonthlySalesList RestAip 요청");
		
		return salesService.getmonthlySalesList();
	}
}
