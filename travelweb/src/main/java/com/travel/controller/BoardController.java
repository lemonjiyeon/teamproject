package com.travel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@GetMapping("/rewriteform")
	public String write() {
		return "board/rewriteform";
	}			
	@GetMapping("/booking")
	public String booking() {
		return "board/booking";
	}
	
	@GetMapping("/reboard")
	public String reboard() {
		return "board/reboard";
	}
	
	@GetMapping("/confirm")
	public String confirm() {
		return "board/confirm";
	}
	
}
