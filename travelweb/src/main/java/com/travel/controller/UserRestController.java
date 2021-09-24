package com.travel.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.travel.domain.UserVO;
import com.travel.service.UserService;


/*
 REST 컨트롤러의 HTTP method 매핑 규칙
 POST   - Create   (SQL Insert문)
 GET    - Read     (SQL Select문)
 GET    - Update   (SQL Update문)
 GET    - Delete   (SQL Delete문)
 * */

@RestController // 이 컨트롤러의 모든 메소드의 리턴값이 JSON 또는 XML 응답으로 동작함
@RequestMapping("/api/*")
public class UserRestController {
	
	@Autowired
	private UserService userService;
	
	// GET요청 http://localhost:8090/api/members?id=user1  	   ->XML 응답
	// GET요청 http://localhost:8090/api/members/user1.json  ->JSON 응답
	@GetMapping(value =  "/members/{userid}", produces = {MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE}) 
	public ResponseEntity<Map<String , Object>> getOne(@PathVariable("userid") String userid) {
		
		UserVO userVO = userService.getUserById(userid);
		int count = userService.getCountById(userid);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user", userVO);
		map.put("count", count);
		
		return new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
	} // getOne
	
}
