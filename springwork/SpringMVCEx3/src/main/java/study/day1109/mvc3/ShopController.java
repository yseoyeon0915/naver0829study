package study.day1109.mvc3;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ShopController {
	
	@GetMapping("/")
	public String home()
	{
		return "home";
	}

	@GetMapping("/shop/{path}")
	//public String list(@PathVariable("path") String path) :path와 변수명이 같을경우 생략
	public String list(@PathVariable String path,Model model)
	{
		System.out.println(path);
		String shopinfo="";
		if(path.equals("list1"))
			shopinfo="원피스 상품 목록";
		else if(path.equals("list2"))
			shopinfo="슈즈 상품 목록";
		else
			shopinfo="악세서리 상품 목록";
		
		//상품 목록 담기
		List<ShopDto> list=new ArrayList<ShopDto>();
		if(path.equals("list1")) {
			list.add(new ShopDto("화이트원피스", "2.jpg", 99000));
			list.add(new ShopDto("스포티원피스", "25.jpg", 45000));
			list.add(new ShopDto("레이스원피스", "28.jpg", 68000));
			list.add(new ShopDto("청원피스", "33.jpg", 23000));			
		}else if(path.equals("list2")) {
			list.add(new ShopDto("샤넬슈즈", "12.jpg", 1500000));
			list.add(new ShopDto("구찌슈즈", "14.jpg", 980000));
			list.add(new ShopDto("플렛슈즈", "15.jpg", 33000));
		}else {
			list.add(new ShopDto("리본핀", "19.jpg", 11000));
			list.add(new ShopDto("머리띠", "30.jpg", 230000));
			list.add(new ShopDto("진주반지", "21.jpg", 55000));
			list.add(new ShopDto("머리끈", "26.jpg", 9000));
		}
		model.addAttribute("list",list);
		model.addAttribute("count",list.size());
		model.addAttribute("shopinfo", shopinfo);
		return "list1";
	}
	
	@GetMapping("/food/morning/brunch")
	public String brunch(Model model)
	{
		model.addAttribute("message", "오늘의 브런치 메뉴들");
		model.addAttribute("today", new Date());
		
		List<String> list=new ArrayList<String>();
		list.add("K-039.png");
		list.add("K-041.png");
		list.add("K-042.png");
		
		model.addAttribute("list", list);
		
		return "list2";
	}
	
	@GetMapping("/food/photo/detail")
	public ModelAndView detail()
	{
		ModelAndView mview=new ModelAndView();
		
		List<String> list=new ArrayList<String>();
		list.add("1.jpg");
		list.add("11.jpg");
		list.add("8.jpg");
		mview.addObject("food", list);
		mview.addObject("name","유서연");
		mview.addObject("addr","서울시 강남구");
		
		mview.setViewName("list3");
		
		return mview;
	}
}