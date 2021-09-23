package com.travel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member/*")
public class UserController {
	@GetMapping("/question")
	public String question() {
		return "member/question";
	}
	
	@GetMapping("/login")
	public String login() {
		return "member/login";
	}
	
	@GetMapping("/modify")
	public String modify() {
		System.out.println("가고있는겐가 자네?");
		return "member/modify";
	}
	
	@GetMapping("/join")
	public String join() {
		return "member/join";
	}
}
