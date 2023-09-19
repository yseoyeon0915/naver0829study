package bit701.day0918;

import java.awt.GridLayout;

import javax.swing.JFrame;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

public class Ex2_Table extends JFrame{
	JTable table1;
	
	JTable table2;
	
	public Ex2_Table(String title) {
		// TODO Auto-generated constructor stub
		super(title);
		this.setBounds(1000, 100, 300, 400);
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);//프레임종료해주는 메서드
		this.setDesign();
		this.setVisible(true);
	}
	
	private void setDesign() {
		// TODO Auto-generated method stub
		
		//table 2개를 넣기 위해서 2행1열로 레이아웃 변경
		this.setLayout(new GridLayout(2, 1));
		
		//table1 생성
		//table1=new JTable(5, 4);//5행4열의 빈 테이블이 만들어진다
		
		//제목과 3개의 빈행을 추가하고자 할경우(Model 을 이용)
		DefaultTableModel model=new DefaultTableModel(new String[] {"이름","나이","주소"},3);
		table1=new JTable(model);
		
		//this.add(table1);//제목이 안나오네요?
		this.add(new JScrollPane(table1));//scroll 이 가능하도록 만들어줘야 제목도 나온다
		
		//table2 에는 데이타를 넣어보자
		String [][]data= {
				{"강부자","56","강남구"},
				{"이순재","67","여의도"},
				{"신구","56","제주도"}
		};
		
		table2=new JTable(data, new String[] {"이름","나이","주소"});
		this.add(new JScrollPane(table2));		
		
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Ex2_Table ex=new Ex2_Table("JTable");
	}

}
























