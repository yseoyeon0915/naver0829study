package bit701.day0831;

import java.text.NumberFormat;
import java.util.Scanner;

public class EX11_ExamAnswer {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		//선언
		Scanner sc=new Scanner(System.in);
		NumberFormat numFormat=NumberFormat.getInstance();
		String sangpum="";
		int su=0, dan=0, total=0;

		//입력
		System.out.println("상품명");
		sangpum=sc.nextLine();
		System.out.println("수량");
		su=sc.nextInt();
		System.out.println("단가");
		dan=sc.nextInt();

		//계산
		//총금액
		total=su*dan;

		//출력
	    System.out.println("총금액="+numFormat.format(total)+"원");
		//5개 이상 할인받는 조건 추가
	    if(su>=5)
	    {
	    	total=(int)(total*0.9);
	    	System.out.printf("5개 이상 10프로 할인된 금액 : %d 원\n",total);
	    	System.out.printf("5개 이상 10%% 할인된 금액 : %s 원\n",numFormat.format(total));
	    }
			


	}

}
