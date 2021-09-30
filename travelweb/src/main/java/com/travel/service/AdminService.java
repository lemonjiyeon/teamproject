package com.travel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.travel.domain.AdAttachVO;
import com.travel.domain.Criteria;
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
	
	/* 패키지 상품리스트, 페이징 설정 */
	public List<TourVO> getTours(Criteria cri) {
		int startRow = (cri.getPageNum()-1) * cri.getAmount();
		cri.setStartRow(startRow); // 시작행번호 설정
		
		return adminMapper.getBoardsWithPaging(cri); // join 쿼리로 데이터 가져오기
	}
	
	public int getTotalCount() {
		return adminMapper.getTotalCount();
	}
	
	  public List<AdAttachVO> getAttaches(Criteria cri) { return
	  adminMapper.getAttaches(cri); // join 쿼리로 데이터 가져오기
	  }
	  
	  public TourVO getTourAndAttach(int tourid) {
			return adminMapper.getTourAndAttach(tourid);
		}

	  public AdAttachVO getAttach(int bno) {
		  return adminMapper.getAttach(bno);
	  }
	  
	  public void deleteTourAttachFile(int bno) {
			adminMapper.deleteTourAttachFile(bno);
			adminMapper.deleteTour(bno);
		}
		
	 
}
