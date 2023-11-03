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
    <h6>도서 대출/반납 조회</h6>
    <form action="./ex5_dataread.jsp" method="get">
       도서 이름 : <input type="text" name="bookname"><br>
       회원 번호 :  <input type="number" name="membernum" value="123456"><br>
       대출 일자 : <input type="text" name="date"><br>
       <button type="submit">입력하기</button>
    </form>
</body>
</html>