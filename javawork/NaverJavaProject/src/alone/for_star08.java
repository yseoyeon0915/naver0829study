package alone;

public class for_star08 {

	public static void main(String[] args) {
		for(int i = 1; i <= 5; i++) {
			for(int j = 0; j < i; j++) {
				System.out.print("*");
			}
			System.out.println();
		}
		for(int i = 0; i < 5; i++) {		// 아래로 갈수록 줄어드는 별 구현(4개부터 실행)
			for(int j = 4; j > i; j--) {
				System.out.print("*");
			}
			System.out.println();
		}
	}
}
