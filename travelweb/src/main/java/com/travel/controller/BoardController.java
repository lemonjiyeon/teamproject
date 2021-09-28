package com.travel.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.travel.domain.AttachVO;
import com.travel.domain.BoardVO;
import com.travel.service.AdminService;
import com.travel.service.AttachService;
import com.travel.domain.TourVO;
import com.travel.service.BoardService;

import net.coobird.thumbnailator.Thumbnailator;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	

//	@Autowired
	private BoardService boardService;


	// 새 글등록 화면 요청
	@GetMapping("/rewriteform")
	public String rewriteform(@ModelAttribute("pageNum") String pageNum) {
		return "board/rewriteform";

	}			
	@GetMapping("/booking")
	public String booking() {
		return "board/booking";

	}


	// 첨부파일 업로드, 글쓰기 처리
	@PostMapping("/rewriteform")
	public String rewriteform(BoardVO boardVO, 
			HttpServletRequest request, RedirectAttributes rttr) throws IOException {
		
		int boardnum = boardService.nextNum();
		
		boardVO.setBoardnum(boardnum);
		
		boardService.register(boardVO);
		
	

		return "redirect:/board/reboard";
	}

	@GetMapping("/rewrite") //글 후기 작성 결과 화면
	public String rewrite(int boardnum, @ModelAttribute("pageNum") String pageNum, Model model) {
		System.out.println("rewrite 호출...");
		
		//글 한개 가져오기
		//BoardVO boardVO = boardService.getBoard(boardnum);
		
		return "board/rewrite";
	}

	@GetMapping("/reboard") // 예약한 상품 이미지, 상품 내용, 후기보기 버튼 누르면 rewrite 화면으로 가기
	public String reboard() {
		return "board/reboard";
	}
	

<<<<<<< HEAD
}
=======
//	@GetMapping("/booking")
//	public String bookingGET(){
//		
//		HttpSession session=req.getSession();
//		
//		TourVO tour = (TourVO)session.getAttribute("Tour");
//		TourVO bookingTour = boardService.bookingGET(tour.getTourid());
//		
//		model.addAttribute("tourId",bookingTour.getTourid());
//		model.addAttribute("tourTitle",bookingTour.getToTitle());
//		model.addAttribute("tourContent",bookingTour.getToContent());
//		
//		
//		return "board/booking";
//	}
//
//	@RequestMapping(value="/booking", method=RequestMethod.GET)
//	public String bookingPOST(TourVO tourvo)throws Exception{
//		
//		
//		
//		
//		return null;
//	}
	
	
	
	

	@GetMapping("/confirm")
	public String confirm() {
		return "board/confirm";
	}

}
>>>>>>> branch 'main' of https://github.com/lemonjiyeon/teamproject
