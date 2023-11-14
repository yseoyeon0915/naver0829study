package day1108.test2;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TestMainEx2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("1. 기존 자바 방식으로 MessageInter 생성 ");
		MessageInter m1=new Message1();
		m1.sayHello("김나혜");
		MessageInter m2=new Message2();
		m2.sayHello("김건훈");
		
		System.out.println("2. 스프링의 xml 설정 방식으로 객체 생성하기");
		ApplicationContext context=new ClassPathXmlApplicationContext("appcontext1.xml");
		MessageInter m3=(Message1)context.getBean("mes1");//반환타입 object이므로 타입 지정 또는 형변환으로 타입 맞춰야함
		MessageInter m3_1=(Message1)context.getBean("mes1");//반환타입 object이므로 타입 지정 또는 형변환으로 타입 맞춰야함
		
		m3.sayHello("마이클");
		MessageInter m4=context.getBean("mes2",Message2.class);
		MessageInter m4_1=context.getBean("mes2",Message2.class);
		m4.sayHello("캐서린");
		
		System.out.println("주소 비교하기");
		System.out.println(m3.hashCode()+","+m3_1.hashCode());//싱글톤은 여러번 생성해도 주소 같음
		System.out.println(m4.hashCode()+","+m4_1.hashCode());//프로토 타입은 생성할때마다 주소가 다름
	}

}
