package com.travel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member/*")
public class UserController {
	@GetMapping("/login")
	public String login() {
		System.out.println("가고있는겐가 자네?");
		return "member/login";
	}
}