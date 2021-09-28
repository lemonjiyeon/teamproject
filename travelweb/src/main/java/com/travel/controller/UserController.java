package com.travel.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
   
   @GetMapping("/join")
   public String join() {
      return "member/join";
   }

   @PostMapping("/join") 
   public ResponseEntity<String> join(UserVO userVO) {
     
     // 비밀번호 암호화 하기 String passwd = userVO.getPasswd(); String hashedPw =
     String passwd = userVO.getUPwd();
     String hashedPw = BCrypt.hashpw(passwd, BCrypt.gensalt()); // 암호화된 비밀번호 리턴받음
     userVO.setUPwd(hashedPw); // 암호화된 비밀번호로 재설정
     
      
        String birthday = userVO.getUBirth(); birthday = birthday.replace("-","");
        userVO.setUBirth(birthday);
       
     System.out.println(userVO); 
     userService.register(userVO); // 회원등록 처리
     
     HttpHeaders headers = new HttpHeaders(); 
     headers.add("Content-Type","text/html; charset=UTF-8");
     
     String str = Script.href("회원가입 성공!", "/member/login");
     
     return new ResponseEntity<String>(str, headers, HttpStatus.OK); }
   
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
         isPasswdSame = BCrypt.checkpw(passwd, userVO.getUPwd());
         
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
   
   @GetMapping("/logout")
   public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
      // 세션 비우기
      session.invalidate();
      
      // 로그인 상태유지용 쿠키 있으면 삭제하기
       Cookie[] cookies = request.getCookies();
       
       if(cookies != null) {
          for(Cookie cookie : cookies) {
             if(cookie.getName().equals("id")) {
                cookie.setMaxAge(0); // 브라우저가 삭제할 수 있도록 0초로 설정
                cookie.setPath("/");
                
                response.addCookie(cookie);
             }
          } //for
       }
      
      
      // 홈 화면으로 리다이렉트 이동
      return "redirect:/";
   }
   
//   @GetMapping("/modify")
//   public String modify() {
//      System.out.println("가고있는겐가 자네?");
//      return "member/modify";
//   }

// ========================내 정보 수정 ======================
	
	//수정화
	@RequestMapping(value = "/modify", method=RequestMethod.GET)
	public String userModifyGET() throws Exception {
		System.out.println("가고있는겐가 자네?");
		
		return "member/modify";
	}

	@RequestMapping(value="/modify",method=RequestMethod.POST)
	public String userModifPOST(UserVO vo, HttpSession session) throws Exception{
		
		userService.userUpdate(vo);
		
		session.invalidate();
	
		return "redirect:/";
	}

	// ===================회원탈퇴===========================
	
//	@DeleteMapping(value="/delete")
//	public String userDelete(@PathVariable UserVO vo) {
//	
//		userService.userDelete(vo);
//		
//		return "회원삭제";
//	}
	
	@GetMapping("/delete")
	   public String delete(@PathVariable UserVO vo) {
	     userService.userDelete(vo);
	      
	      return "/";
	         
	   }
}