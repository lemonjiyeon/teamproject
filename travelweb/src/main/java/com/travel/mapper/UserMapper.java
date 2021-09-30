package com.travel.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.travel.domain.UserVO;

public interface UserMapper {

	@Insert("INSERT INTO user(userid, u_pwd, u_name, u_gender, u_email, u_tel, u_birth) "
			+ "VALUES (#{userid}, #{uPwd}, #{uName}, #{uGender}, #{uEmail}, #{uTel}, #{uBirth})")
	int insert(UserVO userVO);

	@Select("SELECT * FROM user WHERE userid = #{userid}")
	UserVO getUserById(String id);

	@Select("SELECT COUNT(*) FROM user WHERE userid = #{userid}")
	int getCountById(String id);
	

	// 화면수정
	@Update(" UPDATE user" + " SET u_name = #{uName}, "
			+ "u_birth = #{uBirth}, u_gender = #{uGender}, u_Tel = #{uTel} where userid = #{userid}")
	void userUpdate(UserVO userVO);
	  
	//회원탈퇴
	@Delete("DELETE FROM user WHERE userid = #{userid}")
	void userDelete(String userid);
}
