package com.travel.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	@PostMapping("/listform")
	public String listform(ListVO listVO, HttpServletRequest request, RedirectAttributes rttr) {
		int num = listService.nextNum();
			String estnum = listVO.getEstname();
			String esttel = listVO.getEsttel();
			String estemail = listVO.getEstemail();
			String estday = listVO.getEstday();
			String esttraffic = listVO.getEsttraffic();
			String estcontent = listVO.getEstcontent();
			
			listVO.setEstnum(num);
			listVO.setEstname(estnum);
			listVO.setEsttel(esttel);
			listVO.setEstemail(estemail);
			listVO.setEstday(estday);
			listVO.setEsttraffic(esttraffic);
			listVO.setEstcontent(estcontent);
			
			listService.register(listVO);
			
			System.out.println("들어간 값은?" + listVO);
			rttr.addAttribute("num",listVO.getEstnum());
			rttr.addAttribute("pageNum",1);
			
			return "redirect:/";
	}
	@GetMapping("/listcontent")
	public String content(int num,@ModelAttribute("pageNum") String pageNum, Model model) {
		ListVO listVO = listService.getList(num);
		
		model.addAttribute("listVO", listVO);
		
		System.out.println("들어간 값은?"+listVO);
		return "board/listContent";
	}
	@GetMapping("/deleteEst")
	public String deleteEst(int num, String pageNum) {
		listService.deleteListByNum(num);
		
		return "redirect:/board/list?pageNum=" + pageNum;
			
	}
}
