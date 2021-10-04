package com.travel.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.travel.domain.BoardVO;
import com.travel.domain.Criteria;
import com.travel.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	@Autowired
	private BoardService boardService;

	// 새 글등록 화면 요청
	@GetMapping("/rewriteform")
	public String rewriteform(@ModelAttribute("pageNum") String pageNum) {
		return "board/rewriteform";

	}			
	


	// 글쓰기 처리
	@PostMapping("/rewriteform")
	public String rewriteform(BoardVO boardVO, 
			HttpServletRequest request, RedirectAttributes rttr) throws IOException {

		int boardnum = boardService.nextNum();

		boardVO.setBoardnum(boardnum);
		boardVO.setRegdate(new Date());

		rttr.addAttribute("boardnum", boardVO.getBoardnum());

		boardService.register(boardVO);

		System.out.println("테스트" + boardVO);

		return "redirect:/board/reboard";
	}

	/*
	 * @GetMapping("/rewrite") //글 후기 작성 결과 화면 public String rewrite(BoardVO
	 * boardVO, Model model) { System.out.println("rewrite 호출...");
	 * 
	 * model.addAttribute("boardnum", boardVO.getBoardnum());
	 * 
	 * //글 한개 가져오기 //BoardVO boardVO = boardService.getBoard(boardnum);
	 * 
	 * return "board/rewrite"; }
	 */

	@RequestMapping(value = "/rewrite", method = RequestMethod.GET)
	public String userModifyGET(@ModelAttribute("boardVO") BoardVO boardVO, Model model, HttpServletRequest request)
			throws Exception {
		System.out.println("글 후기?");

		int boardnum = Integer.parseInt(request.getParameter("boardnum"));
		boardVO.setBoardnum(boardnum);

		BoardVO resultVO = boardService.boardcontent(boardVO);

		model.addAttribute("resultVO", resultVO);

		return "board/rewrite";
	}

	/*
	 * @GetMapping("/reboard") // 예약한 상품 이미지, 상품 내용, 후기보기 버튼 누르면 rewrite 화면으로 가기
	 * public String reboard(BoardVO boardVO, Model model) {
	 * 
	 * model.addAttribute("boardnum", boardVO.getBoardnum());
	 * 
	 * return "board/reboard"; }
	 */

	@GetMapping("/reboard")
	public String list(Criteria cri, Model model) {
		System.out.println("list 호출...");

		List<BoardVO> boardList = boardService.getBoards(cri);

		// int totalCount = boardService.getTotalCount(); // 전체 글개수
		// int totalCount = boardService.getTotalCountBySearch(cri); // 검색이 적용된 전체 글개수

		// PageDTO pageDTO = new PageDTO(totalCount, cri); // 페이지블록(Pagination) 화면 만들때
		// 필요한 정보

		// 뷰에서 사용할 데이터를 Model 객체에 저장 -> requestScope로 옮겨줌
		model.addAttribute("boardList", boardList);
		// model.addAttribute("pageMaker", pageDTO);
		System.out.println("rebored : " + boardList);
		return "board/reboard";
	}

	@GetMapping("/board/rewritemodify")
	public String boardModifyGET(@ModelAttribute("boardnum") BoardVO boardVO, Model model, HttpServletRequest request)
	throws Exception {
		System.out.println("후기 수정");

		int boardnum = Integer.parseInt(request.getParameter("boardnum"));
		boardVO.setBoardnum(boardnum);

		BoardVO resultVO = boardService.boardcontent(boardVO);

		model.addAttribute("resultVO", resultVO);
		System.out.println("수정?" + resultVO);
		return "board/rewritemodify";
	}
	 
	  
	  @PostMapping("/rewritemodify") 
	  public String modify(BoardVO boardVO,
	  HttpServletRequest request, RedirectAttributes rttr) throws IOException {
	  
	  // 3) boardVO 준비해서 첨부파일 신규리스트, 삭제리스트와 함께 // 테이블 글 수정(update)을 트랜잭션 단위로 처리
		 String title = boardVO.getBtitle();
		 String content = boardVO.getBcontent();
     // ===== update할 BoardVO 객체 데이터 설정 ======
	  
	  boardVO.setRegdate(new Date());
	  boardVO.setBtitle(title);
	  boardVO.setBcontent(content);
	  
	  // boardnum에 해당하는 후기 수정.
	  boardService.updateBoard(boardVO); 
	  System.out.println("boardVO" + boardVO);
	  System.out.println("================ POST modify - 테이블 수정 완료 ================");
	  
//	  //boardnum에 해당하는 후기 삭제
//	  int boardnum = Integer.parseInt(request.getParameter("boardnum"));
//	  boardVO = boardService.getBoard(boardnum);
//	  boardService.deleteByboardnum(boardVO);
	  
	 // 리다이렉트 쿼리스트링 정보 설정 
	 rttr.addAttribute("boardnum", boardVO.getBoardnum());
	  
	  
	  // 상세보기 화면으로 리다이렉트 이동 
	  return "redirect:/board/reboard"; 
	  
	  } // modify
	  
	 @GetMapping("/delete")
	 public String delete(int boardnum) {
		 boardService.deleteByboardnum(boardnum);
		 
		 System.out.println("후기 삭제 완료!");
		 
		 return "/";
	 }

}
