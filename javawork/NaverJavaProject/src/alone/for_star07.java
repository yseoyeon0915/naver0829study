package alone;

public class for_star07 {

	public static void main(String[] args) {
		for (int i=1; i<=5; i++) {
			for (int j=0; j<5-i; j++) {
				System.out.print(" ");
			}
			for (int j=0; j<i; j++) {
				System.out.print("*");
			}
			System.out.println();
		}
	}

}