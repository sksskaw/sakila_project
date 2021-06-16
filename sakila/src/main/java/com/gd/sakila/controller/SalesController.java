package com.gd.sakila.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gd.sakila.service.SalesService;

@Controller
@RequestMapping("/admin")
public class SalesController {
	@Autowired SalesService salesService;
	
	// 매출 대시보드 데이터 출력
	@GetMapping("/getSalesList")
	public String getSalesList(Model model) {
		
		List<Map<String, Object>> bestSellerList = salesService.getBestSellerTop10();
		
		List<Map<String, Object>> salesByCategoryList = salesService.getSalesByCategoryList();
		
		List<Map<String, Object>> monthlySalesList = salesService.getmonthlySalesList();

		HashSet<Integer> yearSet = new HashSet<>();
		List<Integer> yearList = new ArrayList<>();
		
		// 년도 중복제거
		for(Map<String, Object> m : monthlySalesList) {
			yearSet.add((Integer) m.get("YEAR"));
		}
		
		// 리스트에 년도 정보 담기
		Iterator<Integer> iterSet = yearSet.iterator();
        while(iterSet.hasNext()) {
        	yearList.add(iterSet.next());
        }
        
        // 년도 오름차순 정렬
        Collections.sort(yearList);
        
        // 대시보드 기본 통계 자료
        Map<String, Object> statisticsMap = salesService.getDashboardStatistics();

        model.addAttribute("statisticsMap", statisticsMap);
		model.addAttribute("yearList", yearList);
		model.addAttribute("bestSellerList", bestSellerList);
		model.addAttribute("salesByCategoryList", salesByCategoryList);
		model.addAttribute("monthlySalesList", monthlySalesList);
		
		return "getSalesList";
	}
}