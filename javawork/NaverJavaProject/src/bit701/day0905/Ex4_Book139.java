package bit701.day0905;

public class Ex4_Book139 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		for(int i=1; i<=5;i++)
		{
			//for(int j=1; j<=i; j++)
			for(int j=i; j<=5; j++)
			{
				System.out.print("*");
			}
			System.out.println();
		}

		for(int i=1; i<=5;i++)
		{    
			for(int j=1; j<=5; j++)
			{ 
				if(i==j)
					System.out.print(i);
				else 
					System.out.print("*");
			}
			System.out.println();
		}
	}
}