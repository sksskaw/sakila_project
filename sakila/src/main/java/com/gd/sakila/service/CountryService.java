package com.gd.sakila.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.mapper.CountryMapper;
import com.gd.sakila.vo.Country;
import com.gd.sakila.vo.PageParam;

@Service
@Transactional
public class CountryService {
	@Autowired
	private CountryMapper countryMapper;
	public List<Country> getCountryList(int currentPage, int rowPerPage){
		
		//beginRow
		int beginRow = (currentPage - 1) * rowPerPage;
		
		PageParam pageParam = new PageParam();
		pageParam.setBeginRow(beginRow);
		pageParam.setRowPerPage(rowPerPage);
		List<Country> list = countryMapper.selectCountryList(pageParam);
		return list;
	}
}