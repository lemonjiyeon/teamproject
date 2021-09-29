package com.travel.mapper;

import com.travel.domain.AttachVO;

import java.util.List;

public interface AttachMapper {
	
	int insertAttach(AttachVO attachVO);
	
	int insertAttaches(List<AttachVO> attachList);
	
	List<AttachVO> getAttachesByBoardnum(int boardnum);

	List<AttachVO> getAttachesByUuids(List<String> uuidList);
	
}
