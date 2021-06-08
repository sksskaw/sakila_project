package com.gd.sakila.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gd.sakila.vo.*;

@Mapper
public interface AddressMapper {
	List<Country> selectCountry();
	List<City> selectCity(int countryId);
	List<Address> selectAddress(int cityId);
}
