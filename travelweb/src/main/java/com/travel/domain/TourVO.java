package com.travel.domain;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class TourVO {
	
	private int tourid;
	private String toTitle;
	private String toPrice;
	private String toContent;	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date toStart; //출발일
	@DateTimeFormat(pattern = "yyyy-MM-dd")	
	private Date toEnd;
	private String toChoice;
	
	private AdAttachVO adattachVO;
	
	private List<AdAttachVO> adattachlist;
}
