package com.gd.sakila.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.mapper.AddressMapper;
import com.gd.sakila.vo.Address;
import com.gd.sakila.vo.City;
import com.gd.sakila.vo.Country;

@Service
@Transactional
public class AddressService {
	@Autowired AddressMapper addressMapper;
	
	// 주소정보 가져오기
	public List<Country> getCountryList(){
		return addressMapper.selectCountry();
	}
	
	public List<City> getCityList(int countryId){
		return addressMapper.selectCity(countryId);
	}
		
	public List<Address> getAddressList(int cityId){
		return addressMapper.selectAddress(cityId);
	}
}
