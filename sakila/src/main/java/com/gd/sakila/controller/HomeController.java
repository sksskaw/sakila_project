package com.gd.sakila.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.gd.sakila.service.StaffService;
import com.gd.sakila.vo.Staff;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {
	@Autowired StaffService staffService;
	
	@GetMapping({"/home", "/index"})
	public String home(HttpSession session) {
		
		if(session.getAttribute("loginStaff") == null) {
			return "home";
		}
		// 로그인이 되어있으면 Dashboard 페이지로 이동
		return "getSalesList";
	}
	
	@GetMapping("/admin/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@PostMapping("/login")
	public String login(HttpSession session, Staff staff) { // servlet 세션을 직접 사용, 컨트롤러 메서드의 매개변수는 DI대상
		log.debug("HomeController - login() param staff :"+staff);
		
		Staff loginStaff = staffService.login(staff);
		log.debug("HomeController - login() return loginStaff :"+loginStaff);
		
		if(loginStaff != null) { // 로그인 실패
			session.setAttribute("loginStaff", loginStaff);
		}
		return "redirect:/admin/getSalesList";
	}
}