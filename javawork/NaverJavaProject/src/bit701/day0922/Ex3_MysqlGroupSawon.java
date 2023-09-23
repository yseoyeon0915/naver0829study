package bit701.day0922;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Ex3_MysqlGroupSawon {

   static final String MYSQL_DRIVER = "com.mysql.cj.jdbc.Driver";
   static final String MYSQL_URL = "jdbc:mysql://localhost:3306/bit701?serverTimezone=Asia/Seoul";
   
   public Ex3_MysqlGroupSawon() {
	   try {
			Class.forName(MYSQL_DRIVER);
			//System.out.println("Mysql 드라이버 성공");
		} catch (ClassNotFoundException e) {
			System.out.println("Mysql 드라이버 실패:"+e.getMessage());
		}
   }

   public void sawonBunseok() {
      Connection conn = null;
      Statement stmt = null;
      ResultSet rs = null;
      
      String query = "select buseo, count(*) count, max(score) max, min(score) min,"
            + " avg(score) avg from sawon group by buseo";
      
      try {
         conn = DriverManager.getConnection(MYSQL_URL, "root", "1234");
         System.out.println("성공");
         
         stmt = conn.createStatement();
         rs = stmt.executeQuery(query);
         System.out.println("부서 \t 인원 \t 최고 \t 최저 \t 평균");
         while (rs.next()) {
            String buseo = rs.getString("buseo");
            int count = rs.getInt("count");
            int max = rs.getInt("max");
            int min = rs.getInt("min");
            double avg = rs.getDouble("avg");
            System.out.println(buseo + "\t" + count + "\t" + max + "\t" + min + "\t" + avg);
         }
      } catch (SQLException e) {
			System.out.println("Mysql 연결 실패:"+e.getMessage());
      } finally {
         try {
            rs.close();
            stmt.close();
            conn.close();
         } catch (SQLException | NullPointerException e) {
            e.printStackTrace();
         }
      }
   }
   
   public static void main(String[] args) {
	   Ex3_MysqlGroupSawon ex = new Ex3_MysqlGroupSawon();
      ex.sawonBunseok();
   }

}