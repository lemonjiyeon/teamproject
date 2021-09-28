package com.travel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.travel.domain.AdAttachVO;
import com.travel.domain.TourVO;
import com.travel.mapper.AdminAttachMapper;
import com.travel.mapper.AdminMapper;

@Service
public class AdminService {
	@Autowired
	private AdminMapper adminMapper;
	@Autowired
	private AdminAttachMapper adattachMapper;

	
	public int nextNum() {
		return adminMapper.nextNum();
	}
	
	/* tour, adattach에 상품정보 등록하기 */
	public void insertPackageAndAttach(TourVO tourVO, AdAttachVO adattachVO) {
		adminMapper.insert(tourVO);

		if (adattachVO != null) {
			adattachMapper.insertAttach(adattachVO);
		}
	}

}