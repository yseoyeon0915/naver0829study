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
배우 유아인(본명 엄홍식)이 지난 9월 21일 서울 서초구 서울중앙지법에서 열린 마약류 관리에 관한 법률 위반 등 혐의 구속 전 피의자 심문(영장실질심사)에 출석하고 있다. ⓒ뉴시스

마약류 상습 투약 혐의를 받는 배우 유아인(37·본명 엄홍식) 씨가 유튜브 영상을 촬영하던 일행에게 대마 흡연 장면을 목격당하자 "너도 한번 해볼 때가 되지 않았냐"며 흡연을 권유한 것으로 전해졌다.

2일 데일리안이 입수한 유 씨의 공소장에 따르면 일행과 대마를 흡연하던 그는 대마 흡연 경험이 없는 A 씨에게 "깊이 들이마셔라"며 이같이 말했다. 현재 유 씨는 대마 수수 및 대마흡연교사 혐의로 기소된 상황이다.

사건의 발단은 A 씨가 유튜브 브이로그 동영상 촬영을 하면서다. 대마 흡연 장면을 목격당한 유 씨는 "내가 왜 유튜버 때문에 자유시간을 방해받아야 되냐"며 신경질을 부리며 A 씨에게 무안을 줬다고 한다.
	</pre>
	<br><br>
	<a href="loginmain.jsp">메인페이지로 이동</a>
	<%}
%>
</body>
</html>