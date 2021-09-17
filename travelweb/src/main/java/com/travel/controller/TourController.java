package com.travel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/tour/*")
public class TourController {
	
	@GetMapping("/intour")
	public String intour() {
		System.out.println("내륙으로 가고 있는가? 자네?");
		return "tour/intour";
	}
}
