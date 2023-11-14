package day1109.test6.anno;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;

@Component("mycar2")
@AllArgsConstructor // ������ ���� ������� �ڵ� ����
public class AnnoCar2 {
   AnnoKoreanTire koreanTire;
   AnnoCanadaTire canadaTire;
   
   public void myCarInfo()
   {
      System.out.println("�� ���� Ÿ�̾�� " + koreanTire.getTireName() + " �Դϴ�");
      System.out.println("�ܿ�� Ÿ�̾�� " + canadaTire.getTireName() + " �Դϴ�");
   }
}