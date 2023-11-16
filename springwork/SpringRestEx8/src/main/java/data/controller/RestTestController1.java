package data.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import data.dto.MemoDto2;

//@Controller
//public class RestTestController1 {
//
//   @GetMapping("/test/list1")
//   @ResponseBody
//   public List<MemoDto2> list1()
//   {
//      List<MemoDto2> list=new Vector<MemoDto2>();
//      list.add(new MemoDto2(1,"Äµµð","1.jpg","¾È³ç",5,"2023-10-10"));
//      list.add(new MemoDto2(2,"¾È¼Ò´Ï","2.jpg","Çï·ç",9,"2026-11-05"));
//      list.add(new MemoDto2(3,"Å×¸®¿ì½º","3.jpg","ÇÒ·Î",2,"2024-05-27"));
//      list.add(new MemoDto2(4,"ÇÁ¶ûÄµ","4.jpg","ÇÏÀÌ",6,"2021-03-06"));
//      return list;
//   }
//   
//   @GetMapping("test/add")
//   @ResponseBody
//   public MemoDto2 add(String nickname, String photo, String memo)
//   {
//      MemoDto2 dto=new MemoDto2(1,nickname,photo,memo,10,"2022-12-25");
//      return dto;
//   }
//}

@RestController //restapi ¿ë - responsebody¾ÈºÙ¿©µµµÊ
public class RestTestController1 {

   @GetMapping("/test/list1")
   public List<MemoDto2> list1()
   {
      List<MemoDto2> list=new Vector<MemoDto2>();
      list.add(new MemoDto2(1,"Äµµð","1.jpg","¾È³ç",5,"2023-10-10"));
      list.add(new MemoDto2(2,"¾È¼Ò´Ï","2.jpg","Çï·ç",9,"2026-11-05"));
      list.add(new MemoDto2(3,"Å×¸®¿ì½º","3.jpg","ÇÒ·Î",2,"2024-05-27"));
      list.add(new MemoDto2(4,"ÇÁ¶ûÄµ","4.jpg","ÇÏÀÌ",6,"2021-03-06"));
      return list;
   }
   
   @GetMapping("test/add")
   public MemoDto2 add(String nickname, String photo, String memo)
   {
      MemoDto2 dto=new MemoDto2(1,nickname,photo,memo,10,"2022-12-25");
      return dto;
   }
   
   @PostMapping("/test/list2")
   public Map<String, String> test()
   {
	   Map<String, String> map=new HashMap<String, String>();
	   map.put("name", "È«±æµ¿");
	   map.put("age","35");
	   return map;
   }
}