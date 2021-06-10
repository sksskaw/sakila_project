package com.gd.sakila.restapi;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.gd.sakila.service.CustomerService;

@RestController
public class CustomerRestController {
	@Autowired CustomerService customerService;
	
	@GetMapping("/searchCustomerName")
	public List<Map<String,Object>> getCustomerSearchByName(
			@RequestParam(value="searchName", required = true)String searchName){
		return customerService.getCustomerSearchByName(searchName);
	}
}