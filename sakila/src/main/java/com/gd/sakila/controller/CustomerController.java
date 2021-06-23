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

import com.gd.sakila.service.CustomerService;
import com.gd.sakila.vo.Customer;
import com.gd.sakila.vo.CustomerList;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
public class CustomerController {
	@Autowired CustomerService customerService;
	
	@GetMapping("/addCustomer")
	public String addCustomer() {
		
		return "customer/addCustomer";
	}
	
	@PostMapping("/addCustomer")
	public String addCustomer(Customer customer) {
		
		int customerId = customerService.addCustomer(customer);
		
		log.debug("Add Customer Info : "+customer.toString());
		
		return "redirect:/admin/getCustomerOne?customerId="+customerId;
	}
	
	@GetMapping("/getCustomerOne")
	public String getCustomerOne(Model model,
			 @RequestParam(value="customerId", required = true)int customerId) {
		
		// 고객 상세정보, 고객 총 결제금액, 총 대여 횟수
		Map<String, Object> customerOneMap = customerService.getCustomerOne(customerId);
		
		// 해당 고객의 연체 중인 목록
		List<Map<String, Object>> customerOverDueList = customerService.getCustomerOneOverDueList(customerId);
		
		model.addAttribute("customerOneMap",customerOneMap);
		model.addAttribute("customerOverDueList",customerOverDueList);
		
		return "customer/getCustomerOne";
	}
	
	// 고객 정보 리스트 출력
	@GetMapping("/getCustomerList")
	public String getCustomerList(Model model,
	         @RequestParam(value="currentPage", defaultValue = "1") int currentPage,
	         @RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage,
	         @RequestParam(value="searchWord", required = false)String searchWord){
		
		if(searchWord != null && searchWord.equals("")) { // 파라미터 공백처리
			searchWord = null;
		}
		
		// 쿼리 파라미터 수집
		Map<String, Object> map = new HashMap<>();
		map.put("beginRow", (currentPage-1)*rowPerPage);
		map.put("rowPerPage", rowPerPage);
		map.put("searchWord", searchWord);
		
		// 고객 정보 리스트
		List<CustomerList> customerList = customerService.getCustomerList(map);

		// 블랙 리스트
		List<Map<String, Object>> blackCustomerList = customerService.getBlackCustomerList(map);
		
		// 동적 쿼리에 따른 마지막 페이지 계산
		int customerTotal = customerService.getCustomerListTotal(searchWord);
		int lastPage = (int)Math.ceil((double)customerTotal / rowPerPage);
		int pageSet = (currentPage-1)/10;
		
		// 리스트 response
		model.addAttribute("customerList",customerList);
		model.addAttribute("blackCustomerList",blackCustomerList);
		
		// 일반 변수 response
		model.addAttribute("searchWord",searchWord);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("lastPage",lastPage);
		model.addAttribute("pageSet",pageSet);
		
		return "customer/getCustomerList";
	}
}
