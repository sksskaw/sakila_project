package com.gd.sakila.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.sakila.service.RentalService;
import com.gd.sakila.vo.Rental;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class RentalController {

	@Autowired RentalService rentalService;
	
	@GetMapping("/addRental")
	public String addRental() {
		
		return "rental/addRental";
	}
	
	@GetMapping("/addReturn")
	public String addReturn(Model model,
			 @RequestParam(value="currentPage", defaultValue = "1") int currentPage,
	         @RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage,
	         @RequestParam(value="searchNum", required = false)Integer searchNum) {
		
		if(searchNum != null && searchNum == 0) {
			searchNum = null;
		}
		
		int beginRow = (currentPage-1)*rowPerPage;
		List<Rental> returnNullList = rentalService.getReturnNullList(beginRow, rowPerPage, searchNum);
		
		int lastPage = rentalService.getReturnNullTotal();
		
		model.addAttribute("returnNullList",returnNullList);
		model.addAttribute("lastPage",lastPage);
		model.addAttribute("currentPage",currentPage);
		return "rental/addReturn";
	}
	
	@PostMapping("/modifyReturn")
	public String modifyReturn(Model model,
			@RequestParam(value="returnArray", required = true) List<Integer> returnArray) {
		
		
		
		int cnt = rentalService.modifyReturn(returnArray);
		log.debug("RentalController - modifyReturn 총 : " +cnt+ "건 반납 처리완료");
		
		return "redirect:/admin/addReturn";
	}
}