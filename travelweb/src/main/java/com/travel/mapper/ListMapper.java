package com.travel.mapper;

import java.util.List;

import com.travel.domain.Criteria;
import com.travel.domain.ListVO;

public interface ListMapper {
	
	int insert(ListVO listVO); //문의 등록하기
	
	int nextNum(); //다음 insert할 글번호 가져오기(auto Increament)
	
	int deleteListByNum(int num);
	
	ListVO getList(int num); //글번호에 해당하는글 가져오기
	
	List<ListVO> getLists(); //전체 게시글 내용 가져오기
	
	List<ListVO> getListsWithPaging(Criteria cri); //페이징으로 게시글 내용 가져오기
	
	int getTotalCount(); //전체 글 갯수 가져오기
	
	int getTotalCountBySearch(Criteria cri); //검색을 적용해 전체글 개수 가져오기
}
