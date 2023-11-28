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
  
  div.guest_box{
  	width: 500px;
  	padding: 10px;
  	margin-bottom: 10px;
  	height: 300px;
  	border: 1px solid gray;
  	overflow: auto;
  }
  
</style>
<script type="text/javascript">
	$(function(){
		let nara=localStorage.nara;
		
		$("#nara").val(nara);
		
		if(nara==null) nara='en';
		$(".selnara").val(nara);
		
		//한국말 보이스
		$(".voicekr").click(function(){
			console.log(1);
			let m=$(this).prev().text();
			
			$.ajax({
				type:"get",
				dataType:"text",
				url:"./voice",
				data:{"message":m,"lang":"ko"},
				success:function(res){
					//오디오 생성
					let audio=new Audio("../res/voice/"+res);
					audio.play();
			    }
			});
		});
		
		//번역 목소리
		$(".voicetrans").click(function(){
			let m=$(this).prev().text();
			let lang=$(".selnara").val();
			
			$.ajax({
				type:"get",
				dataType:"text",
				url:"./voice",
				data:{"message":m,"lang":lang},
				success:function(res){
					//오디오 생성
					let audio=new Audio("../res/voice/"+res);
					audio.play();
			    }
			});
		});			
	});
</script>
</head>
<body>
<!-- The Modal -->
<div class="modal" id="myPhotoModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">원본사진 확인</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <img src="" class="largephoto" style="width: 100%;">
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>


<div>
	<form action="./insert" method="post" enctype="multipart/form-data">
		<input type="hidden" name="nara" id="nara">
		<b>사진 1장 필수:</b>
		<input type="file" name="upload" required><br>
		<b>닉네임 : </b>
		<input type="text" name="guest_nickname" required><br>
		<textarea style="width: 300px; height: 100px;" name="guest_content" required></textarea>
		<br>
		<button type="submit">방명록 저장</button>
	</form>
</div>
<hr>
<div>
	<h5>총 ${totalCount}개의 방명록 글이 있습니다</h5>
	<div class="input-group" style="width: 300px; margin-left: 100px;">
		<h6><b>번역할 나라 선택 : </b></h6>
		<select class="form-select selnara" style="margin-left: 30px;">
			<option value="en">영어</option>
			<option value="ja"> 일어</option>
			<!--  <option value="fr">프랑스어</option> -->
			<option value="es">스페인어</option>
			<option value="zh-CN">중국어</option>
			<!--<option value="de">독일어</option> -->
		</select>
		<script type="text/javascript">
			$(".selnara").change(function(){
				localStorage.nara=nara;
				location.href="./list?nara="+nara;
			});
		</script>
	</div>
	<c:forEach var="dto" items="${glist}">
		<div class="guest_box">
			<div style="clear: both;" class="input-group">
				<h6><b>${dto.guest_nickname}</b></h6>
				<span style="margin-left:30px;margin-right:10px;color:gray;font-size: 0.9em;">
					<fmt:formatDate value="${dto.guest_writeday}" pattern="yyyy-MM-dd HH:mm"/>
				</span>
			</div>
			<img src="https://3t4hqa0j1727.edge.naverncp.com/K3XnSsglXK/guest/${dto.guest_photo}?type=f&w=100&h=100&faceopt=true&ttype=jpg"  
			class="img-thumbnail smallphoto" style="float: left; margin-right:10px; cursor:pointer;"
			photoname="${dto.guest_photo}" data-bs-toggle="modal" data-bs-target="#myPhotoModal"
			title=" 원본사진을 보려면 클릭하세요">
			
			<pre>${dto.guest_content}</pre>
			<i class="bi bi-megaphone voicekr" style="cursor:pointer; font-size:1.5em;"></i>
			
			<hr>
			<h6 style="color:red;">Papago 번역 서비스</h6>
			<pre>${dto.trans_lang}</pre>
			<i class="bi bi-megaphone voicetrans" style="cursor:pointer; font-size:1.5em;"></i>
		</div>
	</c:forEach>
</div>
<script type="text/javascript">
	$("img.smallphoto").click(function(){
		//사진명 얻기
		let photoname=$(this).attr("photoname");
		//모달다이얼로그에 사진 넣기
		$("img.largephoto").attr("src",`https://kr.object.ncloudstorage.com/guest-lmh/guest/\${photoname}`);
	});
</script>
</body>
</html>


