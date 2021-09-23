package com.travel.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.travel.domain.UserVO;
import com.travel.service.UserService;
import com.travel.util.Script;

@Controller
@RequestMapping("/member/*")
public class UserController {
	
	private UserService userService;
	
	public UserController(UserService userService) {
		this.userService = userService;
	}
	
	@GetMapping("/question")
	public String question() {
		return "member/question";
	}

	@GetMapping("/login")
	public String login() {
		return "member/login";
	}

	@PostMapping("/login")
	public ResponseEntity<String> login(String id, String passwd,
			String rememberMe, HttpSession session, HttpServletResponse response) {
		
		UserVO userVO = userService.getUserById(id);
		
		boolean isPasswdSame = false;
		String message = "";
		
		if(userVO != null) {
			isPasswdSame = BCrypt.checkpw(passwd, userVO.getUpwd());
			
			if(isPasswdSame == false) { // 비밀번호 일치하지 않음 (=if(!isPasswdSame))
				message = "비밀번호가 일치하지 않습니다.";
			}
		} else { // memberVO == null // 일치한는 아이디가 없음
			message = "존재하지 않는 아이디 입니다.";
		}
		
		// 로그인 실패시 (없는 아이디거나 비밀번호 틀렸을때)
		if(userVO == null || isPasswdSame == false) {
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Type","text/html; charset=UTF-8");
			
			String str = Script.back(message);
			
			return new ResponseEntity<String>(str, headers, HttpStatus.OK);
		}
		
		session.setAttribute("id", id);
		
		if(rememberMe != null) {
			Cookie cookie = new Cookie("id", id); // 로그인 아이디로 쿠키정보 생성
			cookie.setPath("/");
			cookie.setMaxAge(60 * 10); // 초단위. 60초 * 10 -> 10분
			
			response.addCookie(cookie); // 응답객체에 쿠키를 추가해놓으면 최종응답시 쿠키를 클라이언트에게 전송해줌
		}
		
		HttpHeaders headers = new HttpHeaders();
		headers.add("Location", "/"); //redirect 경로 지정
		
		// 리다이렉트일 경우 HttpStatus.FOUND 로 지정해야 함
		return new ResponseEntity<String>(headers, HttpStatus.FOUND);
	}//login
	
	@GetMapping("/modify")
	public String modify() {
		System.out.println("가고있는겐가 자네?");
		return "member/modify";
	}

	@GetMapping("/join")
	public String join() {
		return "member/join";
	}

	@PostMapping("/join") public ResponseEntity<String> join(UserVO userVO) {
	  
	  // 비밀번호 암호화 하기 String passwd = userVO.getPasswd(); String hashedPw =
	  String passwd = userVO.getUpwd();
	  String hashedPw = BCrypt.hashpw(passwd, BCrypt.gensalt()); // 암호화된 비밀번호 리턴받음
	  userVO.setUpwd(hashedPw); // 암호화된 비밀번호로 재설정
	  
	  // 연월일 구분문자("-") 제거하기 String birthday = userVO.getBirthday(); // "2021-08-25"
	  String birthday = userVO.getUbirth();
	  birthday = birthday.replace("-", ""); // "20210825"
	  userVO.setUbirth(birthday);
	  
	  // 현재시점 날짜 객체 설정 userVO.setRegDate(new Date());
	  
	  System.out.println(userVO); userService.register(userVO); // 회원등록 처리
	  
	  HttpHeaders headers = new HttpHeaders(); headers.add("Content-Type",
	  "text/html; charset=UTF-8");
	  
	  String str = Script.href("회원가입 성공!", "/member/login");
	  
	  return new ResponseEntity<String>(str, headers, HttpStatus.OK); }

}
