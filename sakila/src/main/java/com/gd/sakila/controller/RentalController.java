package com.gd.sakila.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	@GetMapping("/getRentalList")
	public String getRentalList(Model model,
			 @RequestParam(value="currentPage", defaultValue = "1") int currentPage,
	         @RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage,
	         @RequestParam(value = "returnDateOption", defaultValue = "0") int returnDateOption,
	         @RequestParam(value="searchNum", required = false)Integer searchNum) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("beginRow", (currentPage-1)*rowPerPage);
		map.put("rowPerPage", rowPerPage);
		map.put("returnDateOption", returnDateOption);
		map.put("searchNum", searchNum);
		
		List<Rental> rentalList = rentalService.getRentalList(map);
		
		int rentalTotal = rentalService.getRentalListTotal(map);
		
		int lastPage = (int)Math.ceil((double)rentalTotal / rowPerPage);
		log.debug("RentalController - getRentalList lastPage : " + lastPage);
		
		model.addAttribute("rentalList",rentalList);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("lastPage",lastPage);
		model.addAttribute("returnDateOption",returnDateOption);
		model.addAttribute("searchNum",searchNum);
		
		return "rental/getRentalList";
	}
	
	@GetMapping("/addRental")
	public String addRental() {
		return "rental/addRental";
	}
	
	@PostMapping("/addRental")
	public String addRental(
			 @RequestParam(value="customerId", required = true) int customerId,
	         @RequestParam(value = "inventoryId", required = true) int inventoryId,
	         @RequestParam(value="staffId", required = true)Integer staffId) {
		
		log.debug("RentalController - addRental customerId : " + customerId);
		log.debug("RentalController - addRental inventoryId : " + inventoryId);
		log.debug("RentalController - addRental staffId : " + staffId);
		
		Map<String, Object> map = new HashMap<>(); 
		map.put("customerId", customerId);
		map.put("inventoryId", inventoryId);
		map.put("staffId", staffId);
		
		rentalService.addRental(map);
		
		return "redirect:/admin/getSalesList"; // 추후 rentalList로 이동해야함
	}
	
	// 반납 처리 목록, 현재 대여중인 목록
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
	
	// 반납처리 메소드
	@PostMapping("/addReturn")
	public String addReturn(Model model,
			@RequestParam(value="returnArray", required = true) List<Integer> returnArray) {

		int cnt = rentalService.returnTransaction(returnArray);
		log.debug("RentalController - addReturn 총 : " +cnt+ "건 반납 처리완료");
		
		return "redirect:/admin/addReturn";
	}
}