package com.gd.sakila.service;

import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.sakila.mapper.SalesMapper;

@Service
public class SalesService {
	@Autowired SalesMapper salesMapper;
	
	// 베스트 셀러 출력
	public List<Map<String, Object>> getBestSellerTop10(){
		return salesMapper.selectBestSellerTop10();
	}
	
	// 카테고리별 매출 리스트 출력
	public List<Map<String,Object>> getSalesByCategoryList(){
		return salesMapper.selectSalesByCategoryList();
	}
	
	// 매장별 월별 매출 리스트 출력
	public List<Map<String,Object>> getmonthlySalesList(){
		return salesMapper.selectmonthlySalesList();
	}
	
	// 대시보드 기본 통계 자료
	public Map<String, Object> getDashboardStatistics(){
		
		DecimalFormat formatter = new DecimalFormat("###,###"); // 통계 데이터 콤마넣기
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("todaySales", salesMapper.selectTodaySales());
		map.put("todayRental", salesMapper.selectTodayRental());
		map.put("rentalsCount", salesMapper.selectRentalsCount());
		map.put("overdueCount", salesMapper.selectOverdueCount());
		map.put("totalSales", formatter.format(salesMapper.selectTotalSales()));
		
		return map;
	}
}
