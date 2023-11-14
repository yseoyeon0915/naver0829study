package study.spring.photo;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
   @GetMapping("/")
   public String form()
   {
      return "shopform";
   }
   
   @PostMapping("/addshop")
   public String add(@ModelAttribute("dto") MyShopDto dto, HttpServletRequest request)
   {
      //������ ���ε��� ���
      String path=request.getSession().getServletContext().getRealPath("/resources/photo");
      System.out.println(path);
      //���� Ÿ��
      MultipartFile file=dto.getPhoto();
      
      //���ϸ� ����
      dto.setFilename(file.getOriginalFilename());
      
      //���� ���ε�
      try {
         file.transferTo(new File(path+"/"+file.getOriginalFilename()));
      } catch (IllegalStateException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } catch (IOException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
            
      return "shopresult";
   }
   
}