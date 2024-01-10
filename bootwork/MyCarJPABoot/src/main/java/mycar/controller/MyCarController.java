package mycar.controller;

import java.util.List;

import javax.print.attribute.standard.PageRanges;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import lombok.RequiredArgsConstructor;
import mycar.data.MyCarDto;
import mycar.repository.MyCarDao;
import naver.storage.NcpObjectStorageService;

@Controller
@RequiredArgsConstructor
public class MyCarController {
	private final MyCarDao myCarDao;

	//storage class 선언
	private final NcpObjectStorageService storageService;

	//버켓네임 지정
	private String bucketName="bitcamp-lmh";
	//저장할 폴더네임 지정
	private String folderName="bootmyshop";

//	@GetMapping("/")
//	public String list(Model model)
//	{
//		//전체갯수
//		Long totalCount=myCarDao.getTotalCount();
//		//전체목록 가져오기
//		List<MyCarDto> list=myCarDao.getAllCars();
//
//		model.addAttribute("totalCount", totalCount);
//		model.addAttribute("list", list);
//		return "mycar/mycarlist";
//	}
	
	int pageSize;
	
	@GetMapping("/")
	public String list(Model model,@RequestParam(value = "more",defaultValue = "0") int more)
	{
		//more 가 0이면 기본 3개만 출력
		//o이 아니면 기본사이즈에 more 값 추가해서 목록 가져오기
		if(more==0)
			pageSize=3;
		else
			pageSize+=more;
		//페이징처리를 위한 클래스
		Pageable pageable=PageRequest.of(0, pageSize,Sort.by("num").ascending());
		
		//페이지에 필요한 만큼만 가져오기
		Page<MyCarDto> result=myCarDao.getAllCars(pageable);

		model.addAttribute("totalCount",result.getTotalElements());
		model.addAttribute("totalPage",result.getTotalPages());
		model.addAttribute("list", result.getContent());
		model.addAttribute("pageSize", pageSize);
		
		return "mycar/mycarlist";
	}

	@GetMapping("/addcar")
	public String addform()
	{
		return "mycar/mycarform";
	}
	
	@PostMapping("/insert")
	public String insert(@ModelAttribute MyCarDto dto,@RequestParam("upload") MultipartFile upload)
	{
		//이미지를 스토리지에 저장후 저장된 파일명반환
		String carphoto=storageService.uploadFile(bucketName, folderName, upload);
		//dto 에 사진파일명 저장
		dto.setCarphoto(carphoto);
		//db insert
		myCarDao.insertMyCar(dto);
		
		return "redirect:./";//목록으로 이동
	}
	
	@GetMapping("detail")
	public String detail(Model model)
	{
		return "mycar/mycardetail";
	}
}