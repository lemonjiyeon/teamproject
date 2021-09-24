package com.travel.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@Data

public class UserVO {
	
	private String userid;
	private String uPwd;
	private String uName;
	private String uGender;
	private String uEmail;
	private String uTel;
	private String uBirth;
	

}
