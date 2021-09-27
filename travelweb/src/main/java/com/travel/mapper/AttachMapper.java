package com.travel.mapper;

import com.travel.domain.AttachVO;

import java.util.List;

public interface AttachMapper {
	
	int insertAttach(AttachVO attachVO);
	
	int insertAttaches(List<AttachVO> attachList);
	
}
