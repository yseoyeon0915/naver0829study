<%@page import="market.data.MarketAnswerBoardDao"%>
<%@page import="market.data.MarketSimpleBoardDao"%>
<%@page import="market.data.MarketSimpleBoardDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

<style>
    body * {
        font-family: 'Jua';
    }
    
    a:link{/*초기 a링크에 적용*/
    	text-decoration: none;
    	color: black;
    }
    a:visited {/*한번이라도 클릭한 글에만 적용*/
		text-decoration: none;
		color: gray;
	}
	a:hover {/*a태그에 마우스를 올렸을때*/
		text-decoration: underline;
		color: blue;
	}
	
	.photoicon{
		font-size: 0.8em;
		color: gray;
	}
</style>
</head>
<%
	//dao 선언
	MarketSimpleBoardDao dao=new MarketSimpleBoardDao();
	//전체 데이타 가져오기
	List<MarketSimpleBoardDto> list=dao.getAllList();
	//날짜 형식
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy.MM.dd.");
	//댓글 dao 선언
	MarketAnswerBoardDao adao=new MarketAnswerBoardDao();
%>
<body>
<div style="margin: 30px 50px;">
	<button type="button" class="btn btn-success btn-sm"
	onclick="location.href='boardform.jsp'">글쓰기</button>
	<br>
	<h5><b>총 <%=list.size() %>개의 게시글이 있습니다</b></h5>
	<br>
	<table class="table table-striped" style="width:600px;">
		<thead>
			<tr>
				<th width="50">번호</th>
				<th width="300">제목</th>
				<th width="80">작성자</th>
				<th width="100">작성일</th>
				<th width="70">조회</th>				
			</tr>
		</thead>
		<tbody>
		<%
		if(list.size()==0){%>
			<tr height="50">
				<td colspan="5" align="center">
					<h5>등록된 글이 없습니다</h5>
				</td>
			</tr>
		<%}else{
			int n=0;
			for(MarketSimpleBoardDto dto:list)
			{
				//댓글 갯수 가져오기
				int acount=adao.getBoardAnswers(dto.getNum()).size();
				//dto 에 저장
				dto.setAnswercount(acount);
			%>
				<tr align="center">
					<td><%=list.size()-n++ %></td>
					<td align="left">
						<a href="content.jsp?num=<%=dto.getNum()%>">
							<%=dto.getSubject() %>
							<%
							if(!dto.getPhoto().equals("no")){%>
								<i class="bi bi-image photoicon"></i>
							<%}
							
							if(acount>0){%>
								&nbsp;
								<span style="color: red">(<%=dto.getAnswercount()%>)</span>
							<%}
							%>
						</a>
					</td>
					<td><%=dto.getWriter() %></td>
					<td><%=sdf.format(dto.getWriteday()) %></td>
					<td><%=dto.getReadcount() %></td>
				</tr>
			<%}
		}
		%>
		</tbody>
	</table>
</div>
</body>
</html>