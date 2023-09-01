package bit701.day0901;

import java.util.Scanner;

public class Ex6_ForExam {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        //1. 숫자 n을 입력받은후 1부터 n 까지의 총 합계를 출력하시오
		//입력
		Scanner sc=new Scanner(System.in);
	/*	System.out.println("숫자를 입력하세요");
        int num=sc.nextInt(); 
        int total=0;
        
        //출력 1부터 n까지의 총 합 구하기
        for (int a=1;a<=num;a++) {
        total+=a;	
        }
        System.out.println("1부터 "+num+"까지의 합은 "+total+"입니다");
   */
		
		/*2. 구구단 숫자 2~9 사이의 숫자를 입력받은후 범위를 벗어날 경우 
		  "잘못 입력하여 종료합니다"라고 종료!
		  제대로 입력시 해당 구구단 출력
		
         ** 5단 **
         5 x 1 = 5
         5 x 2 = 10
         .
         .
         5 x 9 = 45
         		
		*/
		int dan;
		System.out.println("구구단을 입력하세요");
		dan = sc.nextInt();
		if(dan<2 || dan>9)
		{
			System.out.println("잘못된 숫자입니다");
			return;
		}
		System.out.printf("\t**"+dan+"단 **\n");
		
		for(int i=1;i<=9;i++)
		{
			System.out.printf("%6d X %d = %2d\n", dan,i,dan*i);
		}
		
		
	}

}
