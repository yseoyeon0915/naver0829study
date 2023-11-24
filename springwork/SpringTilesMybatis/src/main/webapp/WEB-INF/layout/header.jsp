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
<c:set var="root" value="<%=request.getContextPath()%>"/>

<script type="text/javascript">
$(function(){
	//로그인버튼
	$("#btnlogin").click(function(){
		let saveid=$("#saveid").is(":checked"); //true/false,val()은 체크여부와 상관없이 무조건 'on'
		let myid=$("#login_myid").val();
		let pass=$("#login_pass").val();
		//alert(saveid+","+myid);
		
		//$("#btnclose").trigger("click");//강제로 닫기 버튼 클릭하기
		$.ajax({
            type: "get",
            dataType: "json",
            url: "${root}/login/process",
            data: {"saveid":saveid,"myid":myid,"pass":pass},
            success: function (res) {
                  //성공여부 : res.success
                  if(res.success){
                	  $("#btnclose").trigger("click");//강제로 닫기 버튼 클릭하기
                	  location.reload();
                  } else{
                	  alert("아이디나 비빌번호가 맞지 않습니다");  
                  }
            } 
         });
		
	});
	
	//로그아웃 버튼
	$("#btnlogout").click(function(){
		$.ajax({
            type: "get",
            dataType: "text",
            url: "${root}/login/logout",
            success: function (res) {
            	location.reload();//새로고침
            } 
         });
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
        <h4 class="modal-title">회원 로그인</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <table class="table talbe-bordered">
        <caption align="top">
           <label>
           <c:if test="${sessionScope.saveid==null || sessionScope.saveid=='no' }">
               <input type="checkbox" id="saveid">&nbsp;아이디저장
           </c:if>
           <c:if test="${sessionScope.saveid=='yes' }"> 
               <input type="checkbox" id="saveid" checked>&nbsp;아이디저장
           </c:if>
           </label>
           </caption>
            <tr>
              <th width="100">아이디</th>
              <td>
                  <c:if test="${sessionScope.saveid==null || sessionScope.saveid=='no' }">
                  <input type="text" id="login_myid" class="form-control">
                  </c:if>
                  <c:if test="${sessionScope.saveid=='yes' }">
                      <input type="text" id="login_myid" class="form-control" value="${sessionScope.myid}">
                  </c:if>
              </td>
            </tr>
            <tr>
              <th width="100">비밀번호</th>
              <td>
                  <input type="password" id="login_pass" class="form-control">
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

	<a href="${root }/" style="font-size: 30px;"> 
	<img src="${root }/res/photo/K-034.png" width="50" hspace="20">
		Spring5 Mini Project
	</a>
	<div style="width: 200px; position: fixed; right: 50px; top: 30px;">
		<c:if test="${sessionScope.loginok==null}">
			<button type="button" class="btn btn-success" 
			style="width: 100px;" data-bs-toggle="modal" data-bs-target="#myLoginModal">로그인</button>
		</c:if>

		<c:if test="${sessionScope.loginok!=null}">
			<img src="${root}/res/upload/${sessionScope.myphoto}" class="rounded-circle profile_photo"
			    width=70 height="70" hspace="10" border=1
				onerror="this.src='${root}/res/photo/noimage.png'"><br>
			<i class="bi bi-gear photochange" style="font-size: 2em; cursor: pointer;"></i>
			<input type="file" id="profile_upload" style="display: none;">
			
			<div class="input-group">
				<h5>${sessionScope.myname}님</h5> &nbsp;&nbsp;
				<button type="button" class="btn btn-success btn-sm"
					style="width: 100px;" id="btnlogout">로그아웃</button>
			</div>
		</c:if>
	</div>
<script type="text/javascript">
  //셋팅 아이콘 클릭시 파일 업로드 이벤트 트리거
  $(".photochange").click(function(){
	  $("#profile_upload").trigger("click");
  });
  
  //파일 업로드 이벤트
  $("#profile_upload").change(function(){
	  let form=new FormData();
	  form.append("upload",$("#profile_upload")[0].files[0]);
	  
	  $.ajax({
          type: "post",
          dataType: "json",
          url:"${root}/login/photochange",
          processData:false,
	      contentType=false,
          success: function (res) {
             $("img.profile_photo").attr("src",`${root}/res/upload/\${res.fileName}`);
             location.reload();
          } 
       });
  });
</script>
</body>
</html>