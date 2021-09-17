package com.travel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@GetMapping("/write")
	public String write() {
		return "board/rewriteform";
	}
	
	@GetMapping("/list")
	public String list() {
		return "board/list";
	}
	
	@GetMapping("/booking")
	public String booking() {
		return "board/booking";
	}
	@GetMapping("/confirm")
	public String confirm() {
		return "board/confirm";
	}
}
