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

import com.gd.sakila.service.ActorService;
import com.gd.sakila.vo.Actor;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class ActorController {
	@Autowired ActorService actorService;
	
	@GetMapping("/addActor")
	public String addActor() {
		return "actor/addActor";
	}

	@PostMapping("/addActor")
	public String addActor(Actor actor) {

		int row = this.actorService.addActor(actor);
		
		log.debug("배우 입력 완료 : "+ row);
		return "redirect:/admin/getActorList";
	}
	
	@GetMapping("/getActorList") // actor_view
	public String getActorList(Model model, 
								@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
								@RequestParam(value= "rowPerPage", defaultValue = "10") int rowPerPage,
								@RequestParam(value="searchWord", required = false) String searchWord,
								@RequestParam(value="category", required = false)String category) {
		
		if(searchWord != null && searchWord.equals("")) {
			searchWord = null;
		}
		
		if(category != null && category.equals("")) {
			category = null;
		}
		
		log.debug("currentPage: "+ currentPage);
		log.debug("rowPerPage: "+ rowPerPage);
		log.debug("searchWord: "+ searchWord);
		log.debug("category: "+ category);
		
		Map<String, Object> map = new HashMap<>();
		map.put("beginRow", (currentPage-1)*rowPerPage);
		map.put("rowPerPage", rowPerPage);
		map.put("searchWord", searchWord);
		map.put("category", category);
		
		// 배우 정보 리스트
		List<Map<String, Object>> actorInfoList = actorService.getActorInfoList(map);
		
		int actorInfoTotal = actorService.getActorInfoListTotal(map);
		
		// 동적 쿼리에 따른 마지막 페이지 계산
		int lastPage = (int)Math.ceil((double)actorInfoTotal / rowPerPage);
		
		// 단일 변수 데이터
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("category", category);
		
		// List 데이터
		model.addAttribute("actorInfoList", actorInfoList);
		return "actor/getActorList";
	}
}