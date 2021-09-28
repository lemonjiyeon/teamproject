package com.travel.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	
	private int pageNum; //페이지 번호
	private int amount;	//한 페이지당 글개수
	private int startRow; //시작행번호
	
	private String type =""; //검색유형
	private String keyword ="";//검색어
			
	public Criteria() {
		this(1,10); //기본값은 1페이지 요청, 한페이지당 글 10개씩 가져옴
	}

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;		
	}
	
	
}
