package com.travel.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.travel.domain.TourVO;
import com.travel.mapper.TourMapper;

@Service
public class TourService {
	
	@Autowired
	private TourMapper tourMapper;
	
	public TourVO gettour(int tourid) {
		return tourMapper.gettour(tourid);
	}
}
