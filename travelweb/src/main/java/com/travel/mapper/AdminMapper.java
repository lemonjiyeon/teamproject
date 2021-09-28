package com.travel.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.travel.domain.TourVO;

public interface AdminMapper {

	@Insert("INSERT INTO tour(tourid, to_title, to_price, to_content, to_start, to_end, to_choice) "
			+ "VALUES (#{tourid}, #{toTitle}, #{toPrice}, #{toContent}, #{toStart}, #{toEnd}, #{toChoice})")
	int insert(TourVO tourVO);

	@Select("SELECT IFNULL(MAX(tourid),0) + 1 AS btourid"
			+ "	FROM tour")
	int nextNum();
	
	@Select("SELECT t.tourid, t.to_title, t.to_price,  to_content, t.to_start, t.to_end, t.to_choice"
			   +"a.uuid, a.uploadpath, a.filename, a.filetype, a.bno"
		+"FROM tour t LEFT OUTER JOIN attach a"
		+"ON t.tourid = a.bno"
		+"WHERE tourid = #{tourid}")
	TourVO getBoardAndAttaches(int tourid);
	
}
