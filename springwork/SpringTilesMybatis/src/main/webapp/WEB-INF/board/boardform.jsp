<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<c:if test="${sessionScope.loginok==null}">
	<h3>먼저 로그인을 한후 글을 써주세요</h3>
</c:if>
<c:if test="${sessionScope.loginok!=null}">
<div>
	<form action="./addboard" method="post" enctype="multipart/form-data">
		<!-- hidden -->
		<input type="hidden" name="currentPage" value="${currentPage}">
		<input type="hidden" name="num" value="${num}">
		<input type="hidden" name="regroup" value="${regroup}">
		<input type="hidden" name="restep" value="${restep}">
		<input type="hidden" name="relevel" value="${relevel}">		
		
		<table class="table table-bordered" style="width:500px;">
			<caption align="top">
				<b>${num==0?"새글쓰기":"답글쓰기"}</b>
			</caption>
			<tr>
				<th width="100">제목</th>
				<td>
					<input type="text" name="subject" class="form-control"
					required autofocus value="${subject}">
				</td>
			</tr>
			<tr>
				<th width="100">사진</th>
				<td>
					<input type="file" name="upload" multiple class="form-control">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea name="content" class="form-control" required
					style="width: 100%;height: 100px;"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-outline-success">글저장</button>
					
					<button type="button" class="btn btn-outline-success"
					onclick="history.back()">이전으로</button>
				</td>
			</tr>
		</table>
	</form>
</div>
</c:if>
</body>
</html>