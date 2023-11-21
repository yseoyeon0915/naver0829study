<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&family=Permanent+Marker&family=Single+Day&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<style>
body * {
	font-family: 'Jua';
}

div.list .box {
	width: 400px;
	height: 100px;
	margin-bottom: 10px;
	border: 2px solid gray;
	border-radius: 30px;
	box-shadow: 3px 3px 3px gray;
	padding: 10px;
}
</style>
<script type="text/javascript">
	$(function(){
		$(function(){
			$(".photo1").hide(); //150사진 안보이게 처리
			$(".photo2").hide(); //원본사진 안보이게 처리
		});
		
		list();
		$("#upload").change(function(){
			let form=new FormData();
			form.append("upload",$("#upload")[0].files[0]);//선택한 1개의 파일만 추가
			
			/*
			processData:false : 서버에 전달하는 데이타는 query string이라는 형태로 전달된다
			파일전송의 경우 이를 하지 않아야하는데 그설정이 false ,
			contentType:false : enctype 이 원래 기본값이 application/x-www..... 이거인데
			  multipart/form-data로 변경해준다
			*/
			$.ajax({
				type:"post",
				dataType:"text",
				url:"./addphoto",
				processData:false,
				contentType:false,
				data:form,
				success:function(res){
					//alert(res);//랜덤 파일명 확인후 이미지 출력
					$(".photo80").attr("src",res);
			    }
			});		
		});
		
		$("#btnsend").click(function(){
			let title=$("#title").val();
			if(title.length==0){
				alert("제목을 입력해주세요");
				return;
			}
			$.ajax({
				type:"post",
				dataType:"text",
				url:"./adddb",
				data:{"title":title},
				success:function(res){
					list();//목록 다시 출력
					//제목 지우기
					$("#title").val("");
			    }
			});		
		});
		
		//photo150 이벤트
		$(document).on("mouseover","photo150",function(){
			$(this).next().css("display","block");
		});
		$(document).on("mouseout","photo150",function(){
			$(this).next().css("display","none");
		});
		
		//photo_or 이벤트
		$(document).on("mouseover","photo_or",function(){
			$(this).next().css("display","block");
		});
		$(document).on("mouseout","photo_or",function(){
			$(this).next().css("display","none");
		});
		
		//삭제
		$(document).on("click","photodel",function(){
			let num=$(this).attr("num");
			$.ajax({
	               type: "get",
	               dataType: "text",
	               url: "./delete",
	               data: {"num", num}.
	               success: function (res) {
                        list();//삭제 후 목록 다시 출력
	               }
	         });
		});
	});
	
	function list()
	{
		$.ajax({
			type:"get",
			dataType:"json",
			url:"./list",
			success:function(res){
				let s="";
				$.each(res,function(idx,item){
					s+=
						`
						<div class="box">
							<img src="\${item.photo80}" onerror="this.src='../res/upload/noimage.png'"
							width= 80 height=80 align=left hspace=10>
							<span>\${item.title}</span>
							<span style="margin-left:20px; cursor: pointer; color:red;" class="photodel" num="\${item.num}">삭제</span>
							<br>
							<div class="photo150" style="cursor:pointer;">150사진 확인</div>
							<div class="photo1" style="display:none";>
				                     <img src="\${item.photo150}">	
				                </div>
			                <div class="photo_or" style="cursor:pointer">원본사진확인</div>
					        <div class="photo2" style="display:none";>
				                 <img src="\${item.photo}">
							</div>
					    </div>
						`;
				});
				
				$("div.list").html(s);
		    }
		});	
	}
</script>
</head>
<body>
	<h4>스토리지에 사진 올리기</h4>
	<div class="input-group" style="width: 600px;">
		<input type="text" id="title" style="width: 200px;"
			class="form-control" placeholder="제목넣기"> <input type="file"
			id="upload" style="width: 200px;" class="form-control">
		<button type="button" id="btnsend">서버전송</button>
	</div>
	80X80 사진만 확인 :
	<img src="" class="photo80">
	<div class="list" style="margin: 20px;">목록</div>
</body>
</html>