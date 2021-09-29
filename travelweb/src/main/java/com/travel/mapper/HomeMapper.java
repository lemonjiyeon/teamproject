package com.travel.mapper;

import java.util.List;

import com.travel.domain.AdAttachVO;
import com.travel.domain.TourVO;

public interface HomeMapper {
	
	List<TourVO> getTourAddattach();
	
	List<AdAttachVO> getAdattach();
}
