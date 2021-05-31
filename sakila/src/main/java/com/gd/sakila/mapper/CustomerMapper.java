package com.gd.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.sakila.vo.CustomerList;

@Mapper
public interface CustomerMapper {
	int updateCustomerActiveByScheduler();
	List<CustomerList> selectCustomerList(Map<String, Object> map);
	int selectCustomerTotal(Map<String, Object> map);
	
	List<Map<String, Object>> selectBlackCustomerList(); // 블랙리스트
}