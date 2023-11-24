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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<style>
   body * {
       font-family: 'Jua';
   }
  
</style>
<script type="text/javascript">
$(function(){
	//로그인버튼
	$("#btnlogin").click(function(){
		let saveid=$("#saveid").is(":checked");//true/false,val() 은 체크여부와상관없이 무조건 'on'
		let myid=$("#myid").val();
		let pass=$("#pass").val();
		//alert(saveid+","+myid);
		
		//$("#btnclose").trigger("click");//강제로 닫기 버튼 클릭하기
	});
});
</script>
</head>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<body>
<!-- The Modal -->
<div class="modal" id="myLoginModal">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h6 class="modal-title">회원 로그인</h6>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <table class="table table-bordered">
            <caption align="top">
            	<label>
            		<input type="checkbox" id="saveid">&nbsp;아이디저장
            	</label>
            </caption>
        	<tr>
        		<th width="100">아이디</th>
        		<td>
        			<input type="text" id="myid" class="form-control">
        		</td>
        	</tr>
        	<tr>
        		<th width="100">비밀번호</th>
        		<td>
        			<input type="password" id="pass" class="form-control">
        		</td>
        	</tr>
        </table>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-success"
        id="btnlogin">로그인</button>
        
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal"
        id="btnclose">Close</button>
      </div>

    </div>
  </div>
</div>

<a href="${root}/" style="font-size: 30px;">
 <img src="${root}/res/photo/C7.png" width="50" hspace="20">
Spring5 Mini Project
</a>

<c:if test="${sessionScope.loginok==null}">
	<button type="button" class="btn btn-success"
	style="width: 100px;" data-bs-toggle="modal" data-bs-target="#myLoginModal">로그인</button>
</c:if>

<c:if test="${sessionScope.loginok!=null}">
    <h5>${sessionScope.myid}님</h5>
	<button type="button" class="btn btn-success"
	style="width: 100px;">로그아웃</button>
</c:if>
</body>
</html>