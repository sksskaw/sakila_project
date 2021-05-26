package com.gd.sakila.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.sakila.vo.Actor;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class ActorController {
	//@Autowired ActorService actorService;
	
	@GetMapping("/addActor")
	public String addActor() {
		return "addActor";
	}
	@PostMapping("/addActor")
	public String addActor(Actor actor) {
		return "redirect:/admin/getActorList";
	}
	
	@GetMapping("/getActorList") // actor_view 
	public String getActorList( @RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
								@RequestParam(value= "rowPerPage", defaultValue = "10") int rowPerpage,
								@RequestParam(value="searchWord") String searchWord) {
		return "getActorList";
	}
}