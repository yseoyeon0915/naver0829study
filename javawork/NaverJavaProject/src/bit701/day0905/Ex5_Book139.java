package bit701.day0905;

import java.util.Scanner;

public class Ex5_Book139 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc=new Scanner(System.in);
		int money=0, total= 0, num;
		Exit:	while(true) 
		{
			System.out.println("=".repeat(40));
			System.out.println("1. 예금 2. 출금 3. 잔고 4. 종료");
			System.out.println("=".repeat(40));
			System.out.println("선택>");

			num=sc.nextInt();
			switch(num)
			{
			case 1:
				System.out.print("예금액");
				money=sc.nextInt();
				total+= money;
				break;

			case 2:
				System.out.print("출금액");
				money=sc.nextInt();
				total-= money;
				break;

			case 3:
				System.out.println("잔고"+total);
				break;

			case 4:
				break Exit;

			default:
				System.out.println("번호를 다시 입력하세요");

			}
		}
		System.out.println("프로그램 종료");
	}

}
