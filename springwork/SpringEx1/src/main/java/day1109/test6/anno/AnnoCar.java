package day1109.test6.anno;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

//@Component // 아이디: annoCar
@Component("mycar") // id: mycar (아이디를 다른 것으로 변경)
public class AnnoCar {
   
   //@Autowired // 자동 주입 - 에러 발생 : 매칭 가능한 클래스가 2개이므로, 뭘 매칭해야할지 모름
   //AnnoTire annoTire;
   
   // 인터페이스를 구현한 클래스가 여러개인 경우, 정확하게 클래스명으로 선언하면 된다
   // 이렇게 되면 유일해지기 때문에 알아서 자동주입된다
   @Autowired
   //AnnoCanadaTire annoTire;
   //AnnoKoreanTire annoTire;
   
   // @Resource : 인터페이스를 구현한 클래스가 여러개일 경우, 누굴 주입할지 콕 집어서 정해준다
   //@Resource(name = "annoCanadaTire")
   @Resource(name = "annoKoreanTire")
   AnnoTire annoTire;
   
   public void myCarInfo() {
      System.out.println("내 차의 타이어는 " + annoTire.getTireName() + " 입니다");
   }
}