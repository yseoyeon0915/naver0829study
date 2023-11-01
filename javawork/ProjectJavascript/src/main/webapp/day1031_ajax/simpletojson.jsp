<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="simpleboard.data.SimpleBoardDto"%>
<%@page import="java.util.List"%>
<%@page import="simpleboard.data.SimpleBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	SimpleBoardDao dao=new SimpleBoardDao();
	List<SimpleBoardDto> list=dao.getAllList();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	
	JSONArray arr=new JSONArray();
	for(SimpleBoardDto dto:list)
	{
		JSONObject ob=new JSONObject();
		ob.put("num",dto.getNum());
		ob.put("writer",dto.getNum());
		ob.put("subject",dto.getSubject());
		ob.put("content",dto.getContent());
		ob.put("photo",dto.getPhoto());
		ob.put("readcount",dto.getReadcount());
		ob.put("writeday",sdf.format(dto.getWriteday()));
		
		arr.add(ob);		
	}
%>
<%=arr.toString()%>