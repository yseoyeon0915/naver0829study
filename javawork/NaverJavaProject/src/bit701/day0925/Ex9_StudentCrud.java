package bit701.day0925;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Scanner;

import db.DbConnect;

public class Ex9_StudentCrud {
	DbConnect db=new DbConnect();
	Scanner sc=new Scanner(System.in);

	public int getMenu()
	{
		System.out.println("1.추가  2.삭제  3.수정  4.전체출력  5.검색  6.종료");
		int menu=Integer.parseInt(sc.nextLine());
		return menu;
	}

	//insert
	public void insertStudent()
	{
		System.out.println("name");
		String name=sc.nextLine();
		System.out.println("blood");
		String blood=sc.nextLine();
		System.out.println("phone");
		String phone=sc.nextLine();

		Connection conn=db.getMysqlConnection();
		PreparedStatement pstmt=null;
		String sql="insert into student values (null,?,?,?,now())";

		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, name);
			pstmt.setString(2, blood.toUpperCase());//대문자로 변환해서 넣기
			pstmt.setString(3, phone);

			//실행
			pstmt.execute();
			System.out.println("추가되었습니다");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}

	//delete
	public void deleteStudent()
	{
		System.out.println("삭제할 이름은");
		String name=sc.nextLine();

		Connection conn=db.getMysqlConnection();
		PreparedStatement pstmt=null;
		String sql="delete from student where name=?";

		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, name);

			//실행
			int n=pstmt.executeUpdate();
			if(n==0)
			{
				System.out.println("해당 이름을 찾을수 없습니다");
			}else {
				System.out.println("삭제했습니다");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}

	//update
	public void updateStudent()
	{
		System.out.println("수정할 num 값");
		String num=sc.nextLine();
		System.out.println("name");
		String name=sc.nextLine();
		System.out.println("blood");
		String blood=sc.nextLine();
		System.out.println("phone");
		String phone=sc.nextLine();

		Connection conn=db.getMysqlConnection();
		PreparedStatement pstmt=null;
		String sql="update student set name=?,blood=?,phone=? where num=?";

		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, name);
			pstmt.setString(2, blood.toUpperCase());//대문자로 변환해서 넣기
			pstmt.setString(3, phone);
			pstmt.setString(4, num);

			//실행
			int n=pstmt.executeUpdate();
			if(n==0)
				System.out.println("해당 데이타가 없습니다");
			else
				System.out.println("수정했습니다");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}

	//전체 출력
	public void selectAllStudent()
	{
		String sql="select * from student order by num";

		Connection conn=db.getMysqlConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();

			System.out.println("번호\t이름\t혈액형\t전화\t날짜");
			System.out.println("=".repeat(50));

			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
			while(rs.next())
			{
				int num=rs.getInt("num");
				String name=rs.getString("name");
				String blood=rs.getString("blood");
				String phone=rs.getString("phone");
				//String writeday=rs.getString("writeday");//날짜타입도 String 타입으로 가져와도된다 
				Timestamp ts=rs.getTimestamp("writeday");

				//System.out.println(num+"\t"+name+"\t"+blood+"\t"+phone+"\t"+ts.toLocaleString());
				System.out.println(num+"\t"+name+"\t"+blood+"\t"+phone+"\t"+sdf.format(ts));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
	}

	//검색-번호 끝 4자리로 검색
	public void searchPhone()
	{
		System.out.println("전화번호 끝 4자리를 입력하세요");
		String searchPhone=sc.nextLine();
		
		String sql="select * from student where phone like ?";

		Connection conn=db.getMysqlConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, "%"+searchPhone);
			rs=pstmt.executeQuery();

			System.out.println("전화번호 "+searchPhone+" 검색 결과");
			System.out.println("번호\t이름\t혈액형\t전화\t날짜");
			System.out.println("=".repeat(50));

			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
			while(rs.next())
			{
				int num=rs.getInt("num");
				String name=rs.getString("name");
				String blood=rs.getString("blood");
				String phone=rs.getString("phone");
				//String writeday=rs.getString("writeday");//날짜타입도 String 타입으로 가져와도된다 
				Timestamp ts=rs.getTimestamp("writeday");

				//System.out.println(num+"\t"+name+"\t"+blood+"\t"+phone+"\t"+ts.toLocaleString());
				System.out.println(num+"\t"+name+"\t"+blood+"\t"+phone+"\t"+sdf.format(ts));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Ex9_StudentCrud ex=new Ex9_StudentCrud();

		while(true)
		{
			System.out.println("-".repeat(40));
			int menu=ex.getMenu();
			System.out.println("-".repeat(40));
			switch(menu)
			{
			case 1:
				ex.insertStudent();
				break;
			case 2:
				ex.deleteStudent();
				break;
			case 3:
				ex.updateStudent();
				break;
			case 4:
				ex.selectAllStudent();
				break;
			case 5:
				ex.searchPhone();
				break;
			default:				
				System.out.println("** 프로그램을 종료합니다 **");
				System.exit(0);
			}
		}

	}

}