package com.gd.sakila.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class RentalController {

	@GetMapping("/addRental")
	public String addRental() {
		
		return "rental/addRental";
	}
	
	@GetMapping("/addReturn")
	public String addReturn() {
		
		return "rental/addReturn";
	}
}
