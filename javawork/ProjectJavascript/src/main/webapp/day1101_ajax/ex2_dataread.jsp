<?xml version="1.0" encoding="UTF-8"?>
<%@page import="myshop.data.MyShopDto"%>
<%@page import="myshop.data.MyShopDao"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sangpum=request.getParameter("sangpum");
	String color=request.getParameter("color");
	String photo=request.getParameter("photo");
	String price=request.getParameter("price");
	
	//db 에 저장
	MyShopDao dao=new MyShopDao();
	//dto 에 담기
	MyShopDto dto=new MyShopDto();
	dto.setSangpum(sangpum);
	dto.setColor(color);
	dto.setPhoto(photo);
	dto.setPrice(Integer.parseInt(price));
	
	//db저장
	dao.insertShop(dto);
	//총갯수
	int total=dao.getAllSangpums().size();
%>
<data>
	<sangpum><%=sangpum %></sangpum>
	<photo><%=photo %></photo>
	<total><%=total %></total>
</data>