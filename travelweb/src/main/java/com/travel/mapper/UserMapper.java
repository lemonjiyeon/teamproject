package com.travel.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.travel.domain.UserVO;

public interface UserMapper {
	

	@Insert("INSERT INTO user(userid, u_pwd, u_name, u_gender, u_email, u_tel, u_birth) "
			+ "VALUES (#{userid}, #{uPwd}, #{uName}, #{uGender}, #{uEmail}, #{uTel}, #{uBirth})")
	int insert(UserVO userVO);
	
	@Select("SELECT * FROM user WHERE userid = #{userid}")
	UserVO getUserById(String id);
	
	@Select("SELECT COUNT(*) FROM user WHERE userid = #{userid}")
	int getCountById(String id);
	
}
