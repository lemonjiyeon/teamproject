package com.travel.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
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
import org.springframework.web.multipart.MultipartFile;

import com.travel.domain.AttachVO;
import com.travel.domain.BoardVO;
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
	public String write(@ModelAttribute("pageNum") String pageNum) {
		return "board/rewriteform";
	}

	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd"); // 폴더명 날짜로
		String str = sdf.format(new Date());
		return str;
	}

	private boolean checkImageType(File file) throws IOException { // 이미지 파일인지 확인 리턴
		boolean isImage = false;

		String contentType = Files.probeContentType(file.toPath()); // path타입으로

		isImage = contentType.startsWith("images");
		return isImage;
	}

	private List<AttachVO> uploadFilesAndGetAttachList(List<MultipartFile> files, int boardnum)
			throws IllegalStateException, IOException {

		List<AttachVO> attachList = new ArrayList<AttachVO>();

		// 생성할 파일정보가 없으면 종료
		if (files == null || files.size() == 0) {
			System.out.println("업로드한 첨부파일 개수 : " + files.size());
			return attachList;
		}

		String uploadFolder = "C:/PJS/upload"; // 업로드 기준경로

		File uploadPath = new File(uploadFolder, getFolder()); // C:/ksw/upload/2021/08/31
		System.out.println("uploadPath : " + uploadPath.getPath());

		if (uploadPath.exists() == false) { // !uploadPath.exists()
			uploadPath.mkdirs();
		}

		for (MultipartFile multipartFile : files) {
			if (multipartFile.isEmpty()) {
				continue;
			}

			String originalFilename = multipartFile.getOriginalFilename();
			UUID uuid = UUID.randomUUID();
			String uploadFilename = uuid.toString() + "_" + originalFilename;

			File file = new File(uploadPath, uploadFilename); // 생성할 파일이름 정보

			// 파일1개 업로드(파일 생성) 완료
			multipartFile.transferTo(file);
			// ======================================================

			// 현재 업로드한 파일이 이미지 파일이면 썸네일 이미지를 추가로 생성하기
			boolean isImage = checkImageType(file); // 이미지 파일여부 확인

			if (isImage == true) {
				File outFile = new File(uploadPath, "s_" + uploadFilename);

				Thumbnailator.createThumbnail(file, outFile, 100, 100); // 썸네일 이미지 파일 생성하기
			}

			// ===== insert할 주글 AttachVO 객체 데이터 생성 ======
			AttachVO attachVO = new AttachVO();
			attachVO.setUuid(uuid.toString());
			attachVO.setUploadpath(getFolder());
			attachVO.setFilename(originalFilename);
			attachVO.setFiletype((isImage == true) ? "I" : "O");
			attachVO.setBoardnum(boardnum);

			attachList.add(attachVO); // 리스트에 추가
		} // for

		return attachList;
	} // uploadFilesAndGetAttachList

	// 첨부파일 업로드, 글쓰기 처리
	@PostMapping("/rewriteform")
	public void write(List<MultipartFile> files, BoardVO boardVO) throws IOException {

		System.out.println("file 매개변수 값 : files");
		if (files != null) {
			System.out.println("업로드한 첨부파일 개수 : " + files.size());
		}

		// insert할 새 글번호 가져오기
		//int num = boardService.nextNum();

		// 첨부파일 업로드(썸네일 생성) 후 attacList 리턴
		//List<AttachVO> attachList = uploadFilesAndGetAttachList(files, num);

		// ===== insert할 BoardVO 객체 데이터 설정 ======
		//boardVO.setBoardnun(boardnum);
		boardVO.setUserid(getFolder());
		boardVO.setReadcount(0);
		boardVO.setRegDate(new Date());


		// boardService.register(boardVO);
		//boardService.registerBoardAndAttaches(boardVO, attachList); // 주글 한개와 첨부파일 여러개 등록 - 트랜잭션 처리

	}

	@GetMapping("/rewrite") //글 후기 작성 결과 화면
	public String write(Model model) {
		System.out.println("rewrite 호출...");
		
		//List<BoardVO> boardList = boardService.getBoards();
		
		//int totalCount = boardService.getTotalCount(); //전체 글개수
		
		//model.addAttribute("boardList", boardList);
		//model.addAttribute("boardList", totalCount);
		
		return "board/rewrite";
	}

	@GetMapping("/reboard") // 예약한 상품 이미지, 상품 내용, 후기보기 버튼 누르면 rewrite 화면으로 가기
	public String reboard() {
		return "board/reboard";
	}
	

//	@GetMapping("/booking")
//	public String bookingGET(HttpServletRequest req,Model model,TourVO tourvo)throws Exception {
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
