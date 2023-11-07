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
	
	header{
		background-color: #F5A9A9;
		color: #fff;
		text-align: center;
		padding : 60px;
	}
	
	h1{
		font-size: 36px; 
		margin-top : 30px;
		
	}
		
	.loginform {
		position: absolute;
		top: 500px;
		left: 850px;
		transform: translate(-50%, -50%);
	}
	
	img{
		width: 150px;
		height: 150px;
	}
</style>
</head>
<%
//세션으로부터 아이디와 체크저장값을 얻는다
String loginid = (String) session.getAttribute("loginid");
String savestatus = (String) session.getAttribute("savestatus");
boolean bCheck;
if (savestatus == null || savestatus.equals("no")) {
	bCheck = false;//체크를 안했을경우
} else {
	bCheck = true;//체크를 했을경우
}

//체크를 안했을경우는 아이디를 없앤다

if (!bCheck)
	loginid = "";
%> 
<body>
   <header>
   		<img src="../fruitmarket/fruit.png">
   		<br>
        <h1>서연이네 과일가게</h1>
   </header>
	
	<div class="loginform" style="margin:30px 100px;">
	 <form action="loginaction.jsp" method="post">
		<table class="table table-bordered" style="width:300px;border:5px groove gray;">
			<caption align="top">
				<label><input type="checkbox" name="saveid"
				 <%=bCheck?"checked":""%>>아이디저장</label>
			</caption>
			<tr>
				<td width=150>
					<input type="text" class="form-control" autofocus required
					placeholder="아이디" name="loginid" value="<%=loginid%>">
				</td>
				<td rowspan="2" width=100>
					<button type="submit" style="width:100%;height:100px">로그인</button>
				</td>
			</tr>
			<tr>
				<td width=150>
					<input type="password" class="form-control"  required
					placeholder="비밀번호" name="loginpass">
				</td>
			</tr>
		</table>
	 </form>
	</div>
</body>
</html>