package com.travel.domain;

import java.util.Date;

import lombok.Data;

@Data


public class tourVO {
	private String tourid;
	private String totitle;
	private String toprice;
	private String toimg;
	private Boolean tojeju; //제주도 or 내륙 
	private Date tostart; //출발일
	private Date toend;
	private Boolean toreserve; //예약가능
	
}
