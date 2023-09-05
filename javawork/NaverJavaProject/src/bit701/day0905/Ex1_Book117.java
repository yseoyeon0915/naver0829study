package bit701.day0905;

public class Ex1_Book117 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int score = (int)(Math.random()*20) + 81;
		System.out.println("점수:"+score);

		String grade;

		if(score>=90) {
			if(score>=95) {    //중첩 if 문
				grade = "A+";
			}else {            
				grade = "A";   
			}
		} else {
			if (score>=85) {    //중첩 if 문
				grade = "B+";
			}else {
				grade = "B";
			}
		}
		System.out.println("학점:"+ grade);
	}

}
