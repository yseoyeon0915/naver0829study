package day1109.test6.anno;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

//@Component // ���̵�: annoCar
@Component("mycar") // id: mycar (���̵� �ٸ� ������ ����)
public class AnnoCar {
   
   //@Autowired // �ڵ� ���� - ���� �߻� : ��Ī ������ Ŭ������ 2���̹Ƿ�, �� ��Ī�ؾ����� ��
   //AnnoTire annoTire;
   
   // �������̽��� ������ Ŭ������ �������� ���, ��Ȯ�ϰ� Ŭ���������� �����ϸ� �ȴ�
   // �̷��� �Ǹ� ���������� ������ �˾Ƽ� �ڵ����Եȴ�
   @Autowired
   //AnnoCanadaTire annoTire;
   //AnnoKoreanTire annoTire;
   
   // @Resource : �������̽��� ������ Ŭ������ �������� ���, ���� �������� �� ��� �����ش�
   //@Resource(name = "annoCanadaTire")
   @Resource(name = "annoKoreanTire")
   AnnoTire annoTire;
   
   public void myCarInfo() {
      System.out.println("�� ���� Ÿ�̾�� " + annoTire.getTireName() + " �Դϴ�");
   }
}