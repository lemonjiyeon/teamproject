package com.travel.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.travel.domain.UserVO;

public interface UserMapper {
	

	@Insert("INSERT INTO user(userid, uPwd, uName, uGender, uEmail, uTel, uBirth) "
			+ "VALUES (#{userid}, #{uPwd}, #{uName}, #{uGender}, #{uEmail}, #{uTel}, #{uBirth})")
	int insert(UserVO userVO);
	
	@Select("SELECT * FROM user WHERE userid = #{userid}")
	UserVO getUserById(String id);
	
	
}
