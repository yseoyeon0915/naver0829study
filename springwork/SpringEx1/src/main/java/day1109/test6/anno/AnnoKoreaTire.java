package day1109.test6.anno;

import org.springframework.stereotype.Component;

@Component  //xml�� �ڵ����� bean ��� -id�� Ŭ�������� ���̵� �ȴ� (ù���� �ҹ���:annoCanadaTire)
public class AnnoKoreaTire implements AnnoTire {

	@Override
	public String getTireName() {
		// TODO Auto-generated method stub
		return "������̼� �ѱ� Ÿ�̾�";
	}

}
