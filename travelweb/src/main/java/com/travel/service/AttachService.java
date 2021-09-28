package com.travel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.travel.domain.AttachVO;
import com.travel.mapper.AttachMapper;


@Service
public class AttachService {
	
	@Autowired
	private AttachMapper attachMapper;
	
	public List<AttachVO> getAttachesByBno(int boardnum) {
		return attachMapper.getAttachesByBoardnum(boardnum);
	}
	
	public List<AttachVO> getAttachesByUuids(List<String> uuidList) {
		return attachMapper.getAttachesByUuids(uuidList);
	}
}