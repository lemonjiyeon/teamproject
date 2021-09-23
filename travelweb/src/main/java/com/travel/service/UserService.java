package com.travel.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.travel.domain.UserVO;
import com.travel.mapper.UserMapper;

@Service
public class UserService {
	
	@Autowired
	private UserMapper usermapper;
	
	public UserService(UserMapper usermapper){
		this.usermapper = usermapper;
	}

	// 회원가입하기
	public void register(UserVO uservo) {
		usermapper.insert(uservo);
	}
	
	//userid로 정보조회
	public UserVO getUserById(String id) {
		return usermapper.getUserById(id);
	}
	
}
