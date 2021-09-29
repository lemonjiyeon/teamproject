package com.travel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.travel.domain.BoardVO;
import com.travel.domain.Criteria;
import com.travel.mapper.BoardMapper;

@Service
public class BoardService {

	@Autowired
	private BoardMapper boardMapper;

//	@Autowired 
//	private AttachMapper attachMapper;
	  
	public int register(BoardVO boardVO) {
		return boardMapper.insert(boardVO);
	}
	
	public int nextNum() {
		return boardMapper.nextNum();
	}
	 

	// rewrite
	public BoardVO getBoard(int boardnum) { //게시글 하나 가져오는거
		return boardMapper.getBoard(boardnum);
	}

	public List<BoardVO> getBoards(){
		return boardMapper.getBoards();
	}
	
	public int getTotalCount() {
		return boardMapper.getTotalCount();
	}
	
	public BoardVO boardcontent (BoardVO boardVO) {
		return boardMapper.getBoard(boardVO);
	}

	public List<BoardVO> getBoards(Criteria cri) {
		// TODO Auto-generated method stub
		return boardMapper.getBoards();
	}

	public List<BoardVO> updateBoard(BoardVO boardVO) {
		// TODO Auto-generated method stub
		return boardMapper.getBoards();
	}
}
