package bit701.day0831;

import java.text.NumberFormat;
import java.util.Scanner;

public class Ex10_Exam {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
       /*
        * 상품명 과 수량, 단가를 각각 입력받은 후 총급액을 출력하시오
        * 그리고 수량이 5개 이상일 경우 10프로 할인된 최종 금액도 출력해주세요
        * 
        * (예)
        * 상품명:딸기
        * 수량:6
        * 단가:1000
        * 
        * 총금액:6000원
        * 5개 이상 10프로 할인된 금액: 5400원
        */
		Scanner scanner = new Scanner(System.in);
		// 콤마 넣기
		NumberFormat numberFormat=NumberFormat.getInstance();
		
		// 입력
		System.out.println("상품을 입력하세요");
	    String product=scanner.nextLine();
	    System.out.println("수량을 입력하세요");
	    int amount=scanner.nextInt();
	    System.out.println("단가를 입력하세요");
	    int price=scanner.nextInt();
	    
	    // 내용 확인
		System.out.printf("\n상품명 : %s\n수량 : %d개\n단가 : %d\n\n",product,amount,price); //printf로 출력하기
		
		// 총 금액
		int score = amount * price;
		System.out.println("총 금액 : " + numberFormat.format(score) + "원");
		
		// 할인률 적용
		int discount = (score / 10);
		
		// 5개 이상을 샀을 때, 10% 할인
		if(amount >= 5) System.out.println("5개 이상 10프로 할인된 금액 : " + numberFormat.format(score - discount) + "원");
	    
	}
}
