<%@page import="simpleboard.data.SimpleBoardDto"%>
<%@page import="simpleboard.data.SimpleBoardDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MultipartRequest multipartRequest=null;
	
	String realPath=getServletContext().getRealPath("/save");
	System.out.println("path="+realPath);
	int uploadSize=1024*1024*5;//5mb
	
	try{
		multipartRequest=new MultipartRequest(request,realPath,uploadSize,"utf-8",
				new DefaultFileRenamePolicy());
		//dao. dto 선언
		SimpleBoardDao dao=new SimpleBoardDao();
		SimpleBoardDto dto=new SimpleBoardDto();
		
		//데이타 읽기(파일 포함)
		String num=multipartRequest.getParameter("num");
		String writer=multipartRequest.getParameter("writer");
		String subject=multipartRequest.getParameter("subject");
		String content=multipartRequest.getParameter("content");
		//업로드된 실제 파일명,업로드 안했을경우 null
		String photo=multipartRequest.getFilesystemName("upload");		
		
		//dto 에 넣기
		dto.setNum(num);
		dto.setWriter(writer);
		dto.setSubject(subject);
		dto.setContent(content);
		dto.setPhoto(photo);//사진수정안했을경우 null값이 들어감
		
		//update 메서드 호출
		dao.updateBoard(dto);
		
		//content.jsp 로 이동(content 는 num 를 필요로한다)
		response.sendRedirect("content.jsp?num="+num);
	}catch(Exception e){
		out.print("<h3>파일 업로드 오류 발생:"+e.getMessage()+"</h3>");
	}
%>