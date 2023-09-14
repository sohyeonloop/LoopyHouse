<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	session.removeAttribute("custId");
	session.removeAttribute("mngId");	

	String cPath = request.getContextPath();
	
	response.sendRedirect(cPath + "/index.jsp");

%>    
    