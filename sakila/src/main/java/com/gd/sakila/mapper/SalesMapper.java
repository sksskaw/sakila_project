package com.gd.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SalesMapper {
	List<Map<String,Object>> selectBestSellerTop10();
	List<Map<String,Object>> selectSalesByCategoryList();
	List<Map<String,Object>> selectmonthlySalesList();
	double selectTodaySales();
	int selectTodayRental();
	int selectRentalsCount();
	int selectOverdueCount();
	int selectTotalSales();
}