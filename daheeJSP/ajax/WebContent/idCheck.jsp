<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	

	String id = request.getParameter("uId");

	if(!id.equals("admin")) {
		out.print("Y");
	}else {
		out.print("N");
	}
%>