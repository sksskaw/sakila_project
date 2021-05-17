package com.gd.sakila.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.sakila.service.CountryService;
import com.gd.sakila.vo.Country;

@Controller
public class CountryController {
	@Autowired
	private CountryService countryService;
	
	@GetMapping("/countryList")
	public String countryList(Model model,
								@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
								@RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage) {
		List<Country> list = countryService.getCountryList(currentPage, rowPerPage);
		model.addAttribute("list",list);
		System.out.println(list.size());
		return "countryList";
	}
}