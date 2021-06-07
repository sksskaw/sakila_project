package com.gd.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.sakila.vo.CustomerList;

@Mapper
public interface CustomerMapper {
	int updateCustomerActiveByScheduler();
	List<CustomerList> selectCustomerList(Map<String, Object> map);
	int selectCustomerTotal(String searchWord);
	
	List<Map<String, Object>> selectBlackCustomerList(Map<String, Object> map); // 블랙리스트
	Map<String, Object> selectCustomerOne(int customerId);
	double selectCustomerOneSales(int customerId);
	int selectCustomerOneRentals(int customerId);
}