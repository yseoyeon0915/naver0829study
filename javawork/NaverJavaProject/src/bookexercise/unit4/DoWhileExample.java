package bookexercise.unit4;

import java.util.Scanner;    //scanner을 사용하기 위해 필요

public class DoWhileExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        System.out.println("메세지를 입력하세요.");
        System.out.println("프로그램을 종료하려면 q를 입력하세요.");
        
        Scanner scanner = new Scanner(System.in);   //scanner 생성
        String inputString;
        
        do {
        	System.out.print(">");
        	inputString = scanner.nextLine();  //키보드 읽기
        	System.out.println(inputString);
        } while( ! inputString.equals("q"));
        
       
        System.out.println("프로그램 종료");
	}

}
