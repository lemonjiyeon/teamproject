package com.travel.mapper;

import org.apache.ibatis.annotations.Insert;

import com.travel.domain.AdAttachVO;

public interface AdminAttachMapper {

	@Insert("INSERT INTO adattach (uuid, uploadpath, filename, filetype, bno)"
			+"VALUES(#{uuid}, #{uploadpath}, #{filename}, #{filetype},  #{bno})")
	int insertAttach(AdAttachVO adattachVO);
}
