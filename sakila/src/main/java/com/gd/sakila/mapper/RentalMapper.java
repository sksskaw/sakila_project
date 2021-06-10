package com.gd.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.sakila.vo.Rental;

@Mapper
public interface RentalMapper {
	List<Rental> selectReturnNullList(int beginRow, int rowPerPage, Integer searchNum);
	int selectReturnNullTotal();
	void updateReturnDate(int rentalId);
	int selectOverdueFeeByKey(int rentalId); // 반납시 연체료 계산을 위한 쿼리
	void updateAmountByKey(Map<String,Object> map);
}