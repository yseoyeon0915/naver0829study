package mini.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import mini.dao.MemberDao;

@Controller
public class LoginController {
	
	@Autowired
	private MemberDao memberDao;
	
	@GetMapping("/login/main")
	public String login()
	{
		return "login/loginmain";
	}
	
	@GetMapping("/login/process")
	@ResponseBody Map<String, Object> login(@RequestParam boolean saveid,
			@RequestParam String myid,@RequestParam String pass,HttpSession session)
	{
		System.out.println("saveid:"+saveid);
		Map<String, Object> map=new HashMap<String, Object>();
		
		//�α��� ��������
		boolean bLogin=memberDao.isLoginCheck(myid, pass);
		if(bLogin)
		{
			//���� �����ð�
			session.setMaxInactiveInterval(60*60*6);
			//�α��� ������ ���ǿ� ������ �����
			session.setAttribute("loginok", "yes");
			session.setAttribute("saveid", saveid?"yes":"no");
			session.setAttribute("myid",myid);
			
			//���̵� �ش��ϴ� �̸� ���
			String myname=memberDao.getData(myid).getName();			
			session.setAttribute("myname", myname);
			//���̵� �ش��ϴ� ���� ���
			String myphoto=memberDao.getData(myid).getPhoto();			
			session.setAttribute("myphoto", myphoto);
			
			map.put("success", true);
		}else {
			map.put("success",false);//�α��� ���н�
		}
		return map;		
	}
	
	@GetMapping("/login/logout")
	@ResponseBody public void logout(HttpSession session)
	{
		session.removeAttribute("loginok");
	}
	
	//������ ��������
	@PostMapping("/login/photochange")
	@ResponseBody Map<String, String> photoChange(@RequestParam MultipartFile upload,
			HttpSession session, HttpServletRequest request)
	{
		//���� �α����� ���̵� ���
		String myid=(String)session.getAttribute("myid");
		//������ ���ε��� ���
		String path=request.getSession().getServletContext().getRealPath("/resources/upload");
		System.out.println(path);
		//�������ϸ� ���
		String fileName=UUID.randomUUID().toString();
		//���� ���ε�
		try {
		    upload.transferTo(new File(path+"/"+fileName));
		} catch (IllegalStateException e) {
			//TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			//TODO Auto-generated catch block
			e.printStackTrace();
		}
		//db����
		memberDao.updatePhoto(fileName, myid);
		
		//session������ ���� ����
		session.setAttribute("myphoto", fileName);
		
		Map<String, String> map=new HashMap<String, String>();
		map.put("fileName", fileName);
		return map;
	}
	
}




















