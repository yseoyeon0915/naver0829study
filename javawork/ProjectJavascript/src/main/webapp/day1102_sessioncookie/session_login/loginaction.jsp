<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//아이디와 비번을 읽는다
	String loginid=request.getParameter("loginid");
	String loginpass=request.getParameter("loginpass");
	String saveid=request.getParameter("saveid");//체크를 안할경우 null
	//비번이 1234면 각종 정보를 세션에 저장한다
	/*
	loginok - yes : 로그인상태인지 아닌지 판단
	loginid - 로그인한 아이디
	savestatus - 체크박스 체크상태를 저장(yes/no)
	*/
	
	if(loginpass.equals("1234")){
		//세션에 저장
		session.setAttribute("loginok", "yes");
		session.setAttribute("loginid", loginid);
		session.setAttribute("savestatus", saveid==null?"no":"yes");
		//유지 시간 지정
		session.setMaxInactiveInterval(60*60);//1시간 유지
		//메인 페이지로 이동
		response.sendRedirect("loginmain.jsp");		
	}else{%>
		<script>
			alert("비밀번호가 맞지 않습니다");
			history.back();
		</script>
	<%}%>
