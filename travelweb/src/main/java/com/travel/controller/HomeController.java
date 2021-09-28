package com.travel.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.travel.domain.TourVO;
import com.travel.service.HomeService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private HomeService homeService;
	
	@GetMapping("/")
	public String home(TourVO tourvo, Model model) {
		String tochoice = tourvo.getToChoice();	
		
		List<TourVO> tourList = homeService.getTourAddattach(tourvo);
		
		System.out.println("지금 담긴것은"+tochoice);
		System.out.println("home()호출됨2");
		
		model.addAttribute("tourList", tourList);
		model.addAttribute("tourvo", tourvo);
		
		System.out.println("드러갔나?" + tourList);
		return "index";
	}		
	
}
