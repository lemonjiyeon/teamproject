package com.travel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.travel.domain.TourVO;
import com.travel.service.TourService;

@Controller
@RequestMapping("/rsv/")
public class RsvController {
	
	@Autowired
	private TourService tourService;
	
	@GetMapping("/booking")
	public String gettour(int tourid, Model model) {
		TourVO tourVO = tourService.gettour(tourid);
		
		model.addAttribute("tlist",tourVO);
		
		System.out.println("tlist티리스트는?"+tourVO);
		
		return "rsv/booking";
	}
}
