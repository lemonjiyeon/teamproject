package com.travel.domain;

import java.util.Date;

import lombok.Data;


@Data
public class BoardVO {
	
	private int boardnum;  
	private String userid;
	private String bTitle;
	private String bContent;
	private Date regDate;
	private int readcount;
	private int bReco;  //추천수
	
	// private List<AttachVO> attachList;
	
}

