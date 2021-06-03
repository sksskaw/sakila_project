package com.gd.sakila.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.sakila.service.SalesService;

@Controller
@RequestMapping("/admin")
public class SalesController {
	@Autowired SalesService salesService;
	
	@GetMapping("/getSalesList")
	public String getSalesList(Model model,
						@RequestParam(value="storeId", required = false)Integer storeId) {
		
		if(storeId != null && storeId == 0) {
			storeId = null;
		}
		
		List<Map<String, Object>> bestSellerList = salesService.getBestSellerTop10();
		
		List<Map<String, Object>> salesByCategoryList = salesService.getSalesByCategoryList();
		
		List<Map<String, Object>> monthlySalesListList = salesService.getmonthlySalesList(storeId);
		
		
		model.addAttribute("bestSellerList", bestSellerList);
		model.addAttribute("salesByCategoryList", salesByCategoryList);
		model.addAttribute("monthlySalesListList", monthlySalesListList);
		
		return "getSalesList";
	}
}