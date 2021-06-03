package com.gd.sakila.service;

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
	public List<Map<String,Object>> getmonthlySalesList(Integer storeId){
		return salesMapper.selectmonthlySalesList(storeId);
	}
}
