package board.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import board.data.BoardDao;
import board.data.BoardDto;
import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/simple")
@AllArgsConstructor
public class BoardWriteController {

	private BoardDao boardDao;

	@GetMapping ("/writeform")
	public String form()
	{
		return "writeform";
	}

	@PostMapping("/addprocess")
	public String add(HttpServletRequest request, @ModelAttribute BoardDto dto,
			@RequestParam MultipartFile upload)
	{
		//������ ���ε��� ����
		String path=request.getSession().getServletContext().getRealPath("/WEB-INF/upload");
		System.out.println(path);

		//���ϸ��� �����ϰ� ���ؼ� dto�� ����
		String photo=UUID.randomUUID().toString();
		if(upload.getOriginalFilename().equals(""))
			dto.setPhoto("no"); //������ ���ε����� �ʴ� ���� no��� �����غ���
		else
			dto.setPhoto(photo);

		//���ε�
		try {
			upload.transferTo(new File(path+"/"+photo));
		} catch (IllegalStateException e) {
			//TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			//TODO Auto-generated catch block
			e.printStackTrace();
		}

		//db insert
		boardDao.insertBoard(dto);

		return "redirect:./list";
	}
}




















