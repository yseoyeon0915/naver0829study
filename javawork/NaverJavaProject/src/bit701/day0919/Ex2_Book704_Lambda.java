package bit701.day0919;
//리턴 타입이 있는 람다식

@FunctionalInterface
interface CalcInter{
	double calc(double x, double y);
}

class Person{
	public void action(CalcInter cal) {
		double result=cal.calc(10, 4);
		System.out.println("결과="+result);
	}
}

public class Ex2_Book704_Lambda {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        Person person=new Person();
        //실행문이 두개인경우
        person.action((x, y)->{
        	double result=x+y;
        	return result;
        });
        
        //위 호출문과 같은 로직 처리
        //리턴 코드 한줄일경우 return 생략 가능
        person.action((x,y)->(x+y));
	}
}
