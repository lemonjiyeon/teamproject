package com.travel.mapper;


import com.travel.domain.BoardVO;

import java.util.List;

//import org.apache.ibatis.annotations.Param;


public interface BoardMapper {

	int insert(BoardVO boardVO); // 글 한개 등록하기

	int nextNum(); // 다음 insert할 글번호 가져오기

	int deleteAll(); // 전체 행 삭제



	//List<BoardVO> getBoardsWithPaging(Criteria cri); // 페이징으로 게시글 내용 가져오기

	int getTotalCount(); // 전체 글개수 가져오기

	//int getTotalCountBySearch(Criteria cri); // 검색을 적용하여 전체 글개수 가져오기
// ====================================================================== rewrite부분
	BoardVO getBoard(int num); // 글번호에 해당하는 글 한개 가져오기 

	BoardVO getBoardAndAttaches(int num); // 글번호에 해당하는 글 한개와 첨부파일 모두 가져오기

	//void updateReadcount(int num); // 글번호에 해당하는 글의 조회수를 1 증가시키기


//===================================================================================================	
	BoardVO getBoard(BoardVO boardVO);
	
	List<BoardVO> getBoards(); // 전체 게시글 내용 가져오기
	
	void updateBoard(BoardVO boardVO); // 글번호에 해당하는 글의 글제목, 글내용, 날짜 수정하기

	//int deleteByboardnum(int num); // 글번호에 해당하는 글 한개 삭제하기

	int deleteByboardnum(int boardnum);

		


}
