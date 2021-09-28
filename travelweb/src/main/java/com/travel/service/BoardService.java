package com.travel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.travel.domain.AttachVO;
import com.travel.domain.BoardVO;
import com.travel.domain.TourVO;
import com.travel.mapper.AttachMapper;
import com.travel.mapper.BoardMapper;

@Service
public class BoardService {
	
	@Autowired
	private BoardMapper boardMapper;
	
	/*
	 * @Autowired private AttachMapper attachMapper;
	 */
	
	/*
	 * @Transactional public void registerBoardAndAttaches(BoardVO boardVO,
	 * List<AttachVO> attachList) { // attach 테이블의 bno 컬럼이 외래키로서 // board 테이블의
	 * boardnum 컬럼을 참조하므로 // board 레코드가 먼저 insert된 후 attach 레코드가 insert되야 함.
	 * boardMapper.insert(boardVO);
	 * 
	 * if (attachList != null && attachList.size() > 0) {
	 * attachMapper.insertAttaches(attachList); } }
	 */
	
	public int nextNum() {
		return boardMapper.nextNum();
	}
	
	public int deleteAll() {
		return boardMapper.deleteAll();
	}
	
	public List<BoardVO> getBoards(){
		return boardMapper.getBoards();
	}
	
	public int getTotalCount() {
		return boardMapper.getTotalCount();
	}
	

}
