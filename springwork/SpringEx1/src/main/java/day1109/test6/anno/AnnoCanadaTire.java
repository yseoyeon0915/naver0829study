package day1109.test6.anno;

import org.springframework.stereotype.Component;

@Component // xml에 자동으로 bean 등록 - 클래스명(첫글자 소문자 -> annoCanadaTire)이 아이디가 됨
public class AnnoCanadaTire implements AnnoTire {

   @Override
   public String getTireName() {
      // TODO Auto-generated method stub
      return "어노테이션 캐나다 타이어";
   }

}