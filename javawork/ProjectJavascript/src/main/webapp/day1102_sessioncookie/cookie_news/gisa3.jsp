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

'나는솔로' 16기 상철, 경력 사칭 논란에 美보잉사 명함 공개


[SBS연예뉴스 ㅣ 강경윤 기자] ENA, SBS Plus '나는 솔로' 16기 방송에 이어 '나는 SOLO, 그 후 사랑은 계속된다(나솔사계)'에 출연 중인 상철(가명)이 온라인 상에서 제기된 경력 사칭 논란에 명함과 경력 증명서 등을 직접 공개했다.



최근 상철은 자신의 SNS에 미국 보잉사 경력 증명서 사진을 올리면서 "오리엔테이션이 엊그제 같은데 벌써 몇 달 있으면 근무 10년째입니다. 5년마다 회사가 직원들에게 주는 감사패인데 볼 때마다 회사의 모토를 보며 보람을 느낀다."라며 보잉사 재직을 인증했다.



또 상철은 보잉사에서 일하는 것으로 알려진 친형과 함께 어머니를 회사로 초대해 찍은 사진을 공개하면서 "회사는 보안 때문에 방문이 불가능하고 저긴 보잉 뮤지엄이다."라면서 '나는 솔로'에서 공개한 보잉사 재직 이력이 거짓이 아님을 강조했다.	</pre>
	<br><br>
	<a href="loginmain.jsp">메인페이지로 이동</a>
	<%}
%>
</body>
</html>