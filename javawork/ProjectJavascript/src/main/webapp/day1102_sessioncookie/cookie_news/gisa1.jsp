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
<%
	Cookie []cookies=request.getCookies();
	boolean find=false;
	if(cookies!=null)
	{
		for(Cookie ck:cookies)
		{
			//저장된 쿠키 이름을 얻기
			String name=ck.getName();
			if(name.equals("loginok")){
				find=true;//해당 쿠키가 존재하면 true
			}
		}
	}
%>
<body>
<%
	if(!find){%>
		<script type="text/javascript">
			alert("먼저 로그인을 해주세요");
			history.back();
		</script>
	<%}else{%>
	<pre style="width:500px;">
	
[단독] 김혜수, 30번째 '청룡' 끝으로 아듀…박수칠 때 떠난다
제42회 청룡영화상 시상식이 26일 서울 여의도 KBS홀에서 열렸다. MC 김혜수가 진행을 하고 있다. 여의도=송정헌 기자 songs@sportschosun.com/2021.11.26/
[스포츠조선 조지영 기자] "박수칠 때 떠난다."

'청룡의 여신'이자 '청룡의 안방마님'으로 독보적인 존재감을 드러낸 배우 김혜수가 30번째 청룡영화상 진행을 끝으로 왕관을 내려놓는다.

김혜수는 1986년 영화 '깜보'(이황림 감독)로 데뷔해 많은 스포트라이트를 받으며 당대 최고의 라이징 스타로 떠올랐다. 충무로의 블루칩으로 등극한 김혜수는 1993년 청룡영화상 MC로 인연을 맺은 뒤 1998년(심혜진 사회)을 제외하고 올해 열릴 제44회 청룡영화상까지, 30번째 진행을 이어가며 의미 있는 족적을 남겼다.
	
	</pre>
	<br><br>
	<a href="loginmain.jsp">메인페이지로 이동</a>
	<%}
%>
</body>
</html>