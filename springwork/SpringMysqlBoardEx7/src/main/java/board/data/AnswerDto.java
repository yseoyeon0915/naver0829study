package board.data;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AnswerDto {
   private int idx;
   private int num;
   private String writer;
   private String subject;
   private String nickname;
   private String content;
   private 	Timestamp writeday;
  
}
