<%@page import="myshop.data.MyShopDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //num
   String num=request.getParameter("num");
   //dao
   MyShopDao dao=new MyShopDao();
   //delete
   dao.deleteShop(num);
%>