package com.travel.mapper;

import java.util.List;

import com.travel.domain.AttachVO;

public interface AttachMapper {
	
	int insertAttach(AttachVO attachVO);
	
	int insertAttaches(List<AttachVO> attachList);
	
}
