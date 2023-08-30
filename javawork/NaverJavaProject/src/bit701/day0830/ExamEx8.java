package bit701.day0830;

public class ExamEx8 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        //money 변수에 args[0] 값을 대입후 (급여:백만단위:5674321)
		/*
		 * 출력
		 * money : 5674321 원
		 * 만원짜리 567장
		 * 천원짜리 7장
		 * 백원짜리 3개
		 * 십원짜리 2개
		 * 일원짜리 1개
		 * 
		 * : 산술연산자를 사용해서 출력해보세요
		 */
		
        String str1=args[0];
        int su1=Integer.parseInt(str1);
        
        System.out.println("money: " + su1 + "원");
        System.out.println("만원짜리" + su1 / 10000 + "원");
        System.out.println("천원짜리" + su1 % 10000 / 1000 + "원");
        System.out.println("백원짜리" + su1 % 1000 / 100 + "원");
        System.out.println("십원짜리" + su1 % 100 / 10 + "원");
        System.out.println("일원짜리" + su1 % 10 / 1 + "원");
	}

}
