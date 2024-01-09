package myshop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.RequiredArgsConstructor;
import myshop.service.MyShopService;
import naver.storage.NcpObjectStorageService;

@Controller
@RequiredArgsConstructor
public class MyShopController {
	private final MyShopService shopService;
	//storage class 선언
	private final NcpObjectStorageService storageService;
	
	//버켓 네임 지정
	private String bucketName="bitcamp-ysy";
	//저장할 폴더네임 지정
	private String folderName="bootmyshop";
	
	@GetMapping("/")
	public String list(Model model)
	{
		//총개수를 얻어온다
		int totalCount=shopService.getTotalCount();
		//model 에 저장한다
		model.addAttribute("totalCount", totalCount);
		return "myshop/shoplist";
	}
	
	@GetMapping("/form")
	public String form()
	{
		return "myshop/shopform";
	}
}
