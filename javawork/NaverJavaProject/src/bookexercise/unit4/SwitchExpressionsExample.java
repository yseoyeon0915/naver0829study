package bookexercise.unit4;

public class SwitchExpressionsExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		char grade = 'B';

		switch(grade) {
		case'A','a'-> {      //break문을 없애고 화살표와 중괄호를 사용
			System.out.println("우수 회원입니다.");	
		    }
		case 'B','b'-> {
			System.out.println("일반 회원입니다.");
		    }
			default->{
				System.out.println("손님입니다.");
			}

		}
	}
}
