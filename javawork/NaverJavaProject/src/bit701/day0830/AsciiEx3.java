package bit701.day0830;

public class AsciiEx3 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        //char, int는 같은 타입이라고 봐도 된다.
		char a1=65;
		int a2='B';
		System.out.println(a1);//A
		System.out.println(a2);//66
		System.out.println((int)a1);//65
		System.out.println((char)a2);//B
		
		System.out.printf("%d의 아스키문자는 %c이다\n",(int)a1,a1);
		
		char b1='C';
    	int b2=68;
		
		System.out.println(b1);
		System.out.println(b2);
		System.out.println(b1+1);//묵시적 형변형에 의해서 char+int=int,그러므로 E가 아니라 69가 나온다
		/*
		 * 묵시적 형변환(+는 실제 더하기만 의미하는게 아니라 연산을 의미)
		 * char + int = int
		 * int + int = int
		 * long + int = long
		 * double + int =double
		 * String + int = String
		 * String + double = String
		 */
		
		//print나 println은 모든 타입 출력이 가능하다
		//이유는 타입별로 여러개를 같은 이름으로 만들어놨기 때문이다
		//이런 메서드를 중복함수(overloading method)라고 한다
		System.out.println((char)(b1+2));//b1+2=69로 int 타입인데 char로 강제 형변환해서 출력
		
		System.out.println(5/2);//2,int 와 int의 연산이므로 무조건 결과는 int 타입으로 나온다.
		System.out.println(5.0/2);//double+int=double, 2.5
		System.out.println((double)5/2);//double+int=double
		System.out.println((double)(5/2));//int+int=int결과를 double로 형변환해도 2.0이 될뿐이다.
	}

}
