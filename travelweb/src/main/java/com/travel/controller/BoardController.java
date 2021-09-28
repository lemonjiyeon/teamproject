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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.travel.domain.AttachVO;
import com.travel.domain.BoardVO;
import com.travel.service.AdminService;
import com.travel.service.AttachService;
import com.travel.service.BoardService;

import net.coobird.thumbnailator.Thumbnailator;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private AttachService attachService;

	// 새 글등록 화면 요청
	@GetMapping("/rewriteform")
	public String rewriteform(@ModelAttribute("pageNum") String pageNum) {
		return "board/rewriteform";
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
	


}
