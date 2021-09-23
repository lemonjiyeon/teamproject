package com.travel.controller;

import java.util.Date;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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

	/*
	 * @PostMapping("/join") public ResponseEntity<String> join(UserVO userVO) {
	 * 
	 * // 비밀번호 암호화 하기 String passwd = userVO.getPasswd(); String hashedPw =
	 * BCrypt.hashpw(passwd, BCrypt.gensalt()); // 암호화된 비밀번호 리턴받음
	 * userVO.setPasswd(hashedPw); // 암호화된 비밀번호로 재설정
	 * 
	 * // 연월일 구분문자("-") 제거하기 String birthday = userVO.getBirthday(); // "2021-08-25"
	 * birthday = birthday.replace("-", ""); // "20210825"
	 * userVO.setBirthday(birthday);
	 * 
	 * // 현재시점 날짜 객체 설정 userVO.setRegDate(new Date());
	 * 
	 * System.out.println(userVO); userService.register(userVO); // 회원등록 처리
	 * 
	 * HttpHeaders headers = new HttpHeaders(); headers.add("Content-Type",
	 * "text/html; charset=UTF-8");
	 * 
	 * String str = Script.href("회원가입 성공!", "/member/login");
	 * 
	 * return new ResponseEntity<String>(str, headers, HttpStatus.OK); }
	 */
}
