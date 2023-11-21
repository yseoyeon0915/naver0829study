package data.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import naver.storage.NcpObjectStorageService;

@Controller
public class PhotoStorageController {
	
	@Autowired
	private NcpObjectStorageService storageService;
	
	private String bucketName="bitcamp-lmh";//각자 자기의 버켓명-강사 스토리지
	private String bucketFolder="photo";//버켓에 등록된 업로드할 폴더명
	
	
	@GetMapping("/storage/form")
	public String form()
	{
		return "storage/testform";
	}

	@PostMapping("/storage/upload")
	public String upload(Model model,@RequestParam MultipartFile upload)
	{
		//버켓에 업로드후 랜덤 파일명 리턴받기
		String fileName=storageService.uploadFile(bucketName, bucketFolder, upload);
		//원본사진경로
		String photo="https://kr.object.ncloudstorage.com/bitcamp-lmh/photo/"+fileName;
		//150*150
		String photo150="https://fr2k01411649.edge.naverncp.com/82uyvvqSQa/photo/"+fileName+"?type=f&w=150&h=150&faceopt=true&ttype=jpg";
		//80*80
		String photo80="https://fr2k01411649.edge.naverncp.com/82uyvvqSQa/photo/"+fileName+"?type=f&w=80&h=80&faceopt=true&ttype=jpg";
		System.out.println(photo80.length());
		
		model.addAttribute("photo", photo);
		model.addAttribute("photo80", photo80);
		model.addAttribute("photo150", photo150);
		
		return "storage/testresult";
	}
	
	@GetMapping("/storage/common")
	public String common()
	{
		return "storage/commondb";
	}
}