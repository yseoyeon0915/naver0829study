package day1109.test6.anno;

import org.springframework.stereotype.Component;

@Component
public class AnnoKoreanTire implements AnnoTire {

   @Override
   public String getTireName() {
      return "������̼� �ѱ� Ÿ�̾�";
   }

}