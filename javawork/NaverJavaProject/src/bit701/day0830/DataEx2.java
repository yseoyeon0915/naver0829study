package bit701.day0830;

public class DataEx2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("내 이름은 "+args[0]+" 입니다");
		System.out.println("우리집은 "+args[1]+"입니다");
		System.out.println("내 혈액형은 "+args[2]+"형 입니다");
		System.out.println("실수형 데이터 타입");
		float f1=1234.56789123f;//4	바이트 float으고 값을 지정하려면 f추가
		double f2=1234.567891234;
		System.out.println(f1);//8자리까지만 정확하게 출력
		System.out.println(f2);//15자리까지정확하게 출력 
		
		//char 타입은 2바이트라
		char ch1='A';
		char ch2='가';
		System.out.println(ch1);
		System.out.println(ch2);
		
	}

}
