package day1109.test6.anno;

import org.springframework.stereotype.Component;

@Component // xml�� �ڵ����� bean ��� - Ŭ������(ù���� �ҹ��� -> annoCanadaTire)�� ���̵� ��
public class AnnoCanadaTire implements AnnoTire {

   @Override
   public String getTireName() {
      // TODO Auto-generated method stub
      return "������̼� ĳ���� Ÿ�̾�";
   }

}