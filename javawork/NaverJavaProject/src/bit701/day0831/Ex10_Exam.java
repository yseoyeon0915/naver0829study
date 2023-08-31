package bit701.day0831;

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
		
		int money = Integer.parseInt(args[0]);
        System.out.println("상품명":"+money);
        System.out.println("수량"+money/10000+"장");
        System.out.println("단가"+(money%10000)/1000+"장");
        System.out.println("백원짜리"+(money%1000)/100+"개");
        System.out.println("십원짜리"+(money%100)/10+"개");
        System.out.println("일원짜리"+(money%10)+"개");
	}

}
