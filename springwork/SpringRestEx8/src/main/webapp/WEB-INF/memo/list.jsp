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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<style>
body * {
	font-family: 'Jua';
}

.memoform {
	position: absolute;
	top: 150px;
	left: 50px;
}

.memolist {
	position: absolute;
	top: 150px;
	left: 400px;
}

.photo, .photo2 {
	width: 120px;
	height: 120px;
	border: 1px solid gray;
	border-radius: 30px;
	box-shadow: 5px 5px 5px gray;
}

.cameraupload {
	font-size: 30px;
	cursor: pointer;
}

div.box {
	width: 500px;
	height: 160px;
	padding: 10px;
	border: 2px solid gray;
	box-shadow: 3px 3px 3px gray;
	margin-bottom: 10px;
	border-radius: 20px;
}
</style>
<script type="text/javascript">
   $(function() {
      list();//처음 로딩시 list 출력
      
      $(".cameraupload").click(function () {
         $("#upload").trigger("click");
      });
      
      //파일선택시 이벤트
      $("#upload").change(function(){
         let form=new FormData();
         form.append("upload",$("#upload")[0].files[0]);//선택한 1개의 파일만 추가(무조건 배열파일로 나오기 때문에 파일스의 0번을 준 것)
         
         /*
         processData:false -> 서버에 전달하는 데이타는 query string이라는 형태로 전달된다
         파일전송의 경우 이를 하지 않아야하는데 그 설정이 false,
         contentType:false -> enctype이 원래 기본값이 application/x-www..... 이거인데
         multipart/form-data로 변경해준다
         */
         
         $.ajax({
            type:"post",
            dataType:"text",
            url:"./upload",
            processData:false,
            contentType:false,
            data:form,
            success:function(res){
               //alert(res); //이미지가 저장됬는지 확인
               $(".photo").attr("src","../res/upload/"+res);
            }
         });
         
      });
      
      $("#btnmemoadd").click(function(){
         let nick=$("#nickname").val();
         let memo=$("#memo").val();
         if(nick.length==0){
            alert("닉네임을 꼭 입력해주세요");
            return;
         }
         if(memo.length==0){
            alert("메모를 꼭 입력해주세요");
            return;
         }
         
         $.ajax({
             type: "get",
             dataType: "text",
             url: "./add",
             data:{"nickname":nick,"memo":memo},
             success: function (res) {
              //다시 메모 전체 출력
              list();
              //입력값들 지우기
              $("#nickname").val("");
              $("#memo").val("");
              $(".photo").attr("src","../res/upload/noimage.png");
             }
          });
         
         //메모삭제
         $(document).on("click","memodel",function(){
        	let num=$(this).attr("num");
        	let a=confirm("삭제하려면 확인");
        	if(a){
        		$.ajax({
        			type: "get",
        			dataType: "text",
        			url: "./delete",
        			data: {"num", num},
        			success:function(res){
        				//삭제후 목록 다시 출력
        				list();
        			}
        		});
        	}
      });    
         
         //좋아요수 증가하기
         $(document).on("click","increlikes",function(){
             let num=$(this).attr("num");
             let $prev=$(this).prev();
             $.ajax({
                 type: "get",
                 dataType: "json",
                 url: "./likes",
                 data:{"num":num},
                 success: function (res) {
                     prev.text(res.likes);
                 },    
              });
         });
   });//function close
   
   function list() {
      //전체 메모 출력해주는 함수
      $.ajax({
         type:"get",
         dataType:"json",
         url:"./view",
         success:function(res){
            let s="";
            $.each(res, function(idx,item){
               s+=`
                  <div class="box">
                     <img src="../res/upload/\${item.photo}" class="photo2" align="left"
                     hspace="20">
                     
                     닉네임 : \${item.nickname} &nbsp;&nbsp;
                     <a href="../res/upload/\${item.photo}" target="_new">원본사진다운</a><br>
                     메  모 : \${item.memo}<br>
                     작성일 : \${item.writeday}<br>
                     추천수 : \${item.likes}&nbsp; <i class="bi bi-suit-heart" 
                         style="cursor:pointer;color:red;margin-left:5px;" num="\??????"></i><br>
                         
                     <a href="#" class="memodel" num="\${item.num}" style="cursor:pointer;color:red;">삭제</a>
                  </div>
               `;
            });
            
            $(".memolist").html(s);
         }
      });
   }
</script>

</head>
<body>
	<h3 class="alert alert-success">간단한 메모를 남겨봅시다.</h3>
	<div class="memoform">
		<i class="bi bi-camera-fill cameraupload"></i> <input type="file"
			name="upload" id="upload" style="display: none;"> <br> <img
			src="../res/upload/noimage.png" class="photo"> <br>
		<br> <input type="text" id="nickname" class="from-control"
			style="width: 200px;" placeholder="닉네임 입력"> <br> <input
			type="text" id="memo" class="from-control" style="width: 300px;"
			placeholder="메모 메세지"> <br>
		<button type="button" class="btn btn-sm btn-outline-danger"
			id="btnmemoadd">Memo Add</button>
	</div>
	<div class="memolist">memo list</div>

</body>
</html>