package com.gd.sakila.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.mapper.RentalMapper;
import com.gd.sakila.vo.Rental;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class RentalService {
	@Autowired RentalMapper rentalMapper;
	
	// 미반납 리스트
	public List<Rental> getReturnNullList(int beginRow, int rowperPage, Integer searchNum){
		return rentalMapper.selectReturnNullList(beginRow, rowperPage, searchNum);
	}
	
	// 리스트 total
	public int getReturnNullTotal(){
		return rentalMapper.selectReturnNullTotal();
	}
	
	// 반납 처리
	public int modifyReturn(List<Integer> returnArray) {
		int cnt = 0;
		log.debug("RentalService - modifyReturn returnArray SIZE : " + returnArray.size());
		for(Integer i : returnArray) {
			rentalMapper.updateReturnDate(i);
			log.debug("rentalId : " + i +" return complete");
			cnt++;
		}
		
		return cnt;
	}
}