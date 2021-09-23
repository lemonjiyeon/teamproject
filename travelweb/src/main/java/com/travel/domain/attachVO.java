package com.travel.domain;

import lombok.Data;

@Data
public class attachVO {

	private String uuid; //첨부번호
	private int boardnum; 
	private String uploadpath;
	private String filename;
	private String filetype;
	
}
