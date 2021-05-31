package com.gd.sakila.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.mapper.CustomerMapper;
import com.gd.sakila.vo.CustomerList;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class CustomerService {
	@Autowired CustomerMapper customerMapper;
	
	public void modifyCustomerActiveByScheduler() {
		log.debug("▶▶▶▶▶ modifyCustomerActiveByScheduler() 실행");
		int row = customerMapper.updateCustomerActiveByScheduler();
		log.debug("▶▶▶▶▶ 휴먼고객 처리 행수 :"+row);
	}
	
	// 고객 리스트 출력
	public List<CustomerList> getCustomerList(Map<String,Object> map){
		return customerMapper.selectCustomerList(map);
	}
	
	// 블랙 리스트 출력
	public List<Map<String, Object>> getBlackCustomerList(Map<String,Object> map){
		return customerMapper.selectBlackCustomerList(map);
	}
	
	// 고객 리스트 페이징을 위한 total 수
	public int getCustomerListTotal(String searchWord){
		return customerMapper.selectCustomerTotal(searchWord);
	}
}
