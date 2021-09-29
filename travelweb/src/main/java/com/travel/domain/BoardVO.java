package com.travel.domain;

import java.util.Date;

import lombok.Data;


@Data
public class BoardVO {
	
	private int boardnum;  
	private String userid;
	private String btitle;
	private String bcontent;
	private Date regdate;
	private int readcount;
	private int breco;  //추천수
	
	// private List<AttachVO> attachList;
	
}

