<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&family=Permanent+Marker&family=Single+Day&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<style>
    body * {
        font-family: 'Jua';
    }
</style>
</head>
<body>
<h5>한번에 여러개의 값을 읽어야하는 경우</h5>
<form action="./ex7_dataread.jsp" method="post">
   <h6>구현 가능한 언어를 모두 선택하세요</h6>
   <select name="lang" style="width: 150px;" multiple size="10">
   <option>Java</option>
   <option>JSP</option>
   <option>HTML5</option>
   <option>JavaScript</option>
   <option>jQuery</option>
   <option>React</option>
   <option>Vue</option>
   <option>Oracle</option>
   <option>Mysql</option>
   </select>
   <br><br>
   <h6>취미를 모두 골라보세요</h6>
   <label>
     <input type="checkbox" name="hobby" value="게임">게임
   </label>
   &nbsp;
   <label>
     <input type="checkbox" name="hobby" value="낚시">낚시
   </label>
   &nbsp;
   <label>
     <input type="checkbox" name="hobby" value="여행">여행
   </label>
   &nbsp;
   <label>
     <input type="checkbox" name="hobby" value="노래">노래
   </label>
   &nbsp;
   <label>
     <input type="checkbox" name="hobby" value="잠자기">잠자기
   </label>
   <br><br>
   <button type="submit">서버로 전송</button>
</form>
</body>
</html>
























