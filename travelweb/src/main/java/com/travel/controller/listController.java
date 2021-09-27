package com.travel.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.travel.domain.Criteria;
import com.travel.domain.ListVO;
import com.travel.domain.PageDTO;
import com.travel.service.ListService;

@Controller
@RequestMapping("/board/*")
public class listController {
	
	@Autowired
	private ListService listService;
	
	@GetMapping("/list")
	public String list(Criteria cri, Model model) {
		System.out.println("리스트가 호출이될까요 안될까요?");
		
		List<ListVO> listBoard = listService.getlists(cri);
		int totalCount = listService.getTotalCountBySearch(cri);
		
		PageDTO pageDTO = new PageDTO(totalCount, cri);
		
		model.addAttribute("listBoard",listBoard);
		model.addAttribute("pageMaker", pageDTO);
		
		return "board/list";
	}
	
	@GetMapping("/listform")
	public String listform() {
		return "board/listform";
	}
}
