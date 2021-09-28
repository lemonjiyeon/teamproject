package com.travel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.travel.domain.Criteria;
import com.travel.domain.ListVO;
import com.travel.mapper.ListMapper;

@Service
public class ListService {
	
	@Autowired
	private ListMapper listMapper;
	
	public int register(ListVO listVO) {
		return listMapper.insert(listVO);
	}
	public int nextNum() {
		return listMapper.nextNum();
	}
	public List<ListVO> getlists(){
		return listMapper.getLists();
	}
	public int getTotalCount() {
		return listMapper.getTotalCount();
	}
	public int getTotalCountBySearch(Criteria cri) {
		return listMapper.getTotalCountBySearch(cri);
	}
	public ListVO getList(int num) {
		return listMapper.getList(num);
	}
	public int deleteListByNum(int num) {
		return listMapper.deleteListByNum(num);
	}
	//페이징 글 가져오기
	public List<ListVO> getlists(Criteria cri){
		
		int startRow = (cri.getPageNum() -1) *cri.getAmount();
		cri.setStartRow(startRow);
		
		return listMapper.getListsWithPaging(cri);
	}
}
