package com.travel.domain;

import java.util.Date;

import lombok.Data;


@Data

public class tourRsvVO {
	
	private String tourid;//내륙관광지 번호
	private String userid;//아이디
	private String tortitle;//제목
	private int torprice;
	private Boolean torjeju; //제주도 or 내륙
	private Date torstart;
	private Date torend;
	
	
}
