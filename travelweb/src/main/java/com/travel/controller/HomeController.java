package com.travel.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.travel.domain.AdAttachVO;
import com.travel.domain.Criteria;
import com.travel.domain.TourVO;
import com.travel.service.AdminService;
import com.travel.service.HomeService;

import net.coobird.thumbnailator.Thumbnailator;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
			
	@Autowired
	private HomeService homeService;
	
	@GetMapping("/")
	public String home(Model model) {
				
		List<TourVO> tourList = homeService.getTourAddattach();	
		List<AdAttachVO> adList = homeService.getAdattach();
		System.out.println("adList는" + adList);		
		
		
		model.addAttribute("tourList", tourList);
		model.addAttribute("adList", adList);
		
		System.out.println("드러갔나?" + tourList);
		return "index";
	}		
	
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getImageFile(String fileName) throws IOException{
		System.out.println("fileName : " + fileName);
		
		File file = new File("C:/jiyeon/project", fileName);
		System.out.println("실제 이미지 파일경로 : " + file.getPath());
		
		HttpHeaders headers = new HttpHeaders();
		
		String contentType = Files.probeContentType(file.toPath());
		headers.add("Content-type", contentType); // "image/jpeg" "image/png"
		
		byte[] imageData =  FileCopyUtils.copyToByteArray(file);
		
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<byte[]>(imageData, headers, HttpStatus.OK);
		return responseEntity;
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
	//깃터졌다.
}
