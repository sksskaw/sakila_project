package com.gd.sakila.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.sakila.service.StaffService;
import com.gd.sakila.vo.StaffListView;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class StaffController {
	@Autowired StaffService staffService;
	
	@GetMapping("/getStaffList")
	public String getStaffList(Model model,
			@RequestParam(value="currentPage", defaultValue = "1") int currentPage,
			@RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage,
			@RequestParam(value="searchWord", required = false)String searchWord) {
		
		log.debug("currentPage: "+ currentPage);
		log.debug("rowPerPage: "+ rowPerPage);
		log.debug("searchWord: "+ searchWord);
		
		
		List<StaffListView> StaffList = staffService.getStaffList(currentPage, rowPerPage, searchWord);
		
		log.debug("StaffController - getStaffList StaffList Size : "+StaffList.size());
		
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("currentPage", currentPage);
		//model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("StaffList", StaffList);
		
		return "getStaffList";
	}
}
