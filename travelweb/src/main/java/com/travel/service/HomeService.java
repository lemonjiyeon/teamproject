package com.travel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.travel.domain.AdAttachVO;
import com.travel.domain.TourVO;
import com.travel.mapper.HomeMapper;

@Service
public class HomeService {
	
	@Autowired
	private HomeMapper homeMapper;
	
	public List<TourVO> getTourAddattach() {
		return homeMapper.getTourAddattach();
	}
	
	public List<AdAttachVO> getAdattach(){
		return homeMapper.getAdattach();
	}
	
}
