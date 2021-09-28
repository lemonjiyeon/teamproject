package com.travel.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.travel.domain.AdAttachVO;
import com.travel.domain.Criteria;
import com.travel.domain.PageDTO;
import com.travel.domain.TourVO;
import com.travel.service.AdminService;

import net.coobird.thumbnailator.Thumbnailator;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private AdminService adminService;
	

	@GetMapping("/packagelist")
	public String packagelist(Criteria cri, Model model) {
		
		List<TourVO> tourList = adminService.getBoardAndAttaches(cri);
		//List<AdAttachVO> adattachList = adminService.getAttaches(cri);
		int totalCount = adminService.getTotalCount(); // 전체 글개수
		
		System.out.println("tourList"+tourList);
		PageDTO pageDTO = new PageDTO(totalCount, cri); // 페이지블록(Pagination) 화면 만들때 필요한 정보
		 
		
		// 뷰에서 사용할 데이터를 Model 객체에 저장 -> requestScope로 옮겨줌
		//model.addAttribute("adattachList",adattachList);
		model.addAttribute("tourList", tourList);
		model.addAttribute("pageMaker", pageDTO);
		
		return "admin/packagelist";
	}
	
	
	
	
	@GetMapping("/packageadd")
	public String packageadd(){
		return "admin/packageadd";
	}

	@PostMapping("/packageadd")
	public String tourpackageadd(MultipartFile toImg, TourVO tourVO, 
		 RedirectAttributes rttr) throws IOException {

		int tourid = adminService.nextNum();
		
		AdAttachVO adattachVO = uploadFileAndGetAdAttach(toImg, tourid);
		
		tourVO.setTourid(tourid);
		
		adminService.insertPackageAndAttach(tourVO, adattachVO);
		
		rttr.addAttribute("num", tourVO.getTourid());
		rttr.addAttribute("pageNum", 1);
		
		return "redirect:/admin/packagelist";
	}
	
	
	/* file upload method */
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		String str = sdf.format(new Date());
		return str;
	}
	
	private boolean checkImageType(File file) throws IOException {
		boolean isImage = false;
		
		String contentType = Files.probeContentType(file.toPath()); // "image/jpg"
		System.out.println("contentType : " + contentType);
		
		isImage = contentType.startsWith("image");
		return isImage;
	}
	
	
	private AdAttachVO uploadFileAndGetAdAttach(MultipartFile toImg, int bno) throws IllegalStateException, IOException {
		
		AdAttachVO adattachVO = new AdAttachVO();
		
		String uploadFolder = "C:/jiyeon/project";
		
		File uploadPath = new File(uploadFolder, getFolder());
		System.out.println("uploadPath : " + uploadPath.getPath());
		
		if (uploadPath.exists() == false) {  // !uploadPath.exists()
			uploadPath.mkdirs();
		}
		
		
		String originalFilename = toImg.getOriginalFilename();
		UUID uuid = UUID.randomUUID();
		String uploadFilename = uuid.toString() + "_" + originalFilename;
		
		File file = new File(uploadPath, uploadFilename); // 생성할 파일이름 정보
		
		// 파일1개 업로드(파일 생성) 완료
		toImg.transferTo(file);
		// ======================================================
		
		// 현재 업로드한 파일이 이미지 파일이면 썸네일 이미지를 추가로 생성하기
		boolean isImage = checkImageType(file); // 이미지 파일여부 확인 
		
		if (isImage == true) {
			File outFile = new File(uploadPath, "s_" + uploadFilename);
			
			Thumbnailator.createThumbnail(file, outFile, 100, 100);  // 썸네일 이미지 파일 생성하기
		}
		
		adattachVO.setUuid(uuid.toString());
		adattachVO.setUploadpath(getFolder());
		adattachVO.setFilename(originalFilename);
		adattachVO.setFiletype( (isImage == true) ? "I" : "O" );
		adattachVO.setBno(bno);
		return adattachVO;
	}
	/* end file upload method */
	
	
	
	@GetMapping("/packagecontent")
	public String packagecontent() {
		
		return "admin/packagecontent";
	}
	
}
