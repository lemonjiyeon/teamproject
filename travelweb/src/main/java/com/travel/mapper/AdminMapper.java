package com.travel.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.travel.domain.TourVO;

public interface AdminMapper {

	@Insert("INSERT INTO tour(tourid, to_title, to_price, to_content, to_start, to_end, to_choice) "
			+ "VALUES (#{tourid}, #{toTitle}, #{toPrice}, #{toContent}, #{toStart}, #{toEnd}, #{toChoice})")
	int insert(TourVO tourVO);

	@Select("SELECT IFNULL(MAX(tourid),0)+1 AS ntourid FROM tour")
	int nextNum();
	
}
