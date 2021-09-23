package com.travel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@GetMapping("/packagelist")
	public String packagelist() {
		return "admin/packagelist";
	}
	
	@GetMapping("/packageadd")
	public String packageadd(){
		return "admin/packageadd";
	}
}
