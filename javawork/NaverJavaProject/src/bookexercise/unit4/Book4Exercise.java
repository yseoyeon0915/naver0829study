package bookexercise.unit4;

public class Book4Exercise {

	public static void main(String[] args) {
		//	while문과 Math.random()메소드를 사용해서 
		//	두개의 주사위를 던졌을때 나오는 눈을 (눈1,눈2) 형태로 출력하고 
		//	눈의 합이 5가 아니면 계속 주사위를 던지고, 
		//	눈의 합이 5이면 실행을 멈추는 코드를 작성해보세요

		//	눈의 합이 5가 되는 경우는 (1,4) (4,1) (2,3) (3,2)입니다

		//두개의 주사위를 던지고 눈을 무작위로 생성
		while(true) {
			int dice1 =(int)(Math.random()*6)+1;
			int dice2 =(int)(Math.random()*6)+1;

			//눈의 합 계산
			int sum= dice1+dice2;

			//결과 출력
			System.out.println("(" + dice1 + ", " + dice2 + ")");

			//눈의 합이 5인경우 루프 종료
			if (sum == 5) {
				System.out.println("눈의 합이 5가 되어 실행을 종료합니다.");
				break;

			}
		}

	}
}

