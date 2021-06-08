package com.gd.sakila.restapi;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gd.sakila.service.AddressService;
import com.gd.sakila.vo.Address;
import com.gd.sakila.vo.City;
import com.gd.sakila.vo.Country;

@RestController
public class AddressRestController {
	
	@Autowired AddressService addressService;
	
	// 주소정보 가져오기
	@GetMapping("/country")
	public List<Country> getCountryList(){
		return addressService.getCountryList();
	}
	
	@GetMapping("/city")
	public List<City> getCityList(int countryId){
		return addressService.getCityList(countryId);
	}
	
	@GetMapping("/address")
	public List<Address> getAddressList(int cityId){
		return addressService.getAddressList(cityId);
	}
}
