package com.travel.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.travel.domain.BoardVO;
<<<<<<< HEAD
//import com.travel.mapper.AttachMapper;
=======
import com.travel.domain.TourVO;
import com.travel.mapper.AttachMapper;
>>>>>>> branch 'main' of https://github.com/lemonjiyeon/teamproject
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
<<<<<<< HEAD

=======
	
	public List<BoardVO> getBoards(){
		return boardMapper.getBoards();
	}
	
	public int getTotalCount() {
		return boardMapper.getTotalCount();
	}
	


//	public TourVO bookingGET(int tourid) {
//		// TODO Auto-generated method stub
//		return null;
//	}
>>>>>>> branch 'main' of https://github.com/lemonjiyeon/teamproject
}
