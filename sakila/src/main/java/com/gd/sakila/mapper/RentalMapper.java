package com.gd.sakila.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gd.sakila.vo.Rental;

@Mapper
public interface RentalMapper {
	List<Rental> selectReturnNullList(int beginRow, int rowPerPage, Integer searchNum);
	int selectReturnNullTotal();
	void updateReturnDate(int rentalId);
}
