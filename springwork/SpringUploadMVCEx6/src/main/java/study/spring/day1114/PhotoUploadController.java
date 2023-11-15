package study.spring.day1114;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import data.dto.MemberDto;

@Controller
public class PhotoUploadController {

	@PostMapping("/member/upload1")
	public String upload1(@ModelAttribute("mdto") MemberDto dto, @RequestParam MultipartFile upload,
		    HttpServletRequest request)
	{
		//업로드할 프로젝트냐의 경로구하기
		String path=request.getSession().getServletContext().getRealPath("/WEB-INF/photo");
		System.out.println(path);
		//파일명을  dto에 저장
		//파일명은 랜덤하게 만들어보자
		String photo=UUID.randomUUID().toString();
		dto.setPhoto(photo);
		
		//업로드
		try {
			upload.transferTo(new File(path+"/"+photo));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "member/result1";
	}
	
	@PostMapping("/member/upload2")
	public String upload2(@ModelAttribute("mdto") MemberDto dto, HttpServletRequest request, 
			@RequestParam ArrayList<MultipartFile> upload)
	{
		String path=request.getSession().getServletContext().getRealPath("/WEB-INF/photo");
		//파일명을 저장할 변수
		String photo="";
		
		//여러장의 사진을 업로드해야하므로 반복문을 돌린다
		for(MultipartFile m:upload)
		{
			//임의의 파일명을 얻는다
			String fname=UUID.randomUUID().toString();
			photo+=fname+",";
			//업로드
			try {
				m.transferTo(new File(path+"/"+fname));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		//마지막 컴마 제거
		photo=photo.substring(0,photo.length()-1);
		//dto에 넣기
		dto.setPhoto(photo);
		
		return "member/result2";
	}
	
	@PostMapping("/member/upload3")
	public String upload3(HttpServletRequest request, @ModelAttribute("mdto") MemberDto dto,
			@RequestParam MultipartFile upload, @RequestParam MultipartFile upload2)
	{
		String path=request.getSession().getServletContext().getRealPath("/WEB-INF/photo");
		//파일명 dto에 저장
		String filename1=UUID.randomUUID().toString();
		String filename2=UUID.randomUUID().toString();
		
		dto.setPhoto(filename1);
		dto.setPhoto(filename2);
		
		//업로드
		try {
			upload.transferTo(new File(path+"/"+filename1));
			upload2.transferTo(new File(path+"/"+filename2));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "member/result3";
	}
}
