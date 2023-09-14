<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String custId = request.getParameter("userId");
	String custPwd = request.getParameter("userPw");

	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@112.220.114.130:1521:xe";
	Connection conn = DriverManager.getConnection(url, "team2_202302M", "java");
	Statement stmt = conn.createStatement();
	
	
	String sql = "select cust_id from customer "
				+ " where cust_id = '" + custId + "' "
				+ " and  cust_pwd = '" + custPwd + "'";
	
	ResultSet rs = stmt.executeQuery(sql);
	
	if(rs.next()){
%>
	{"rst" : "yes"}
<% 
	} else{
%>
	{"rst" : "fail"}
<%
	}
%>