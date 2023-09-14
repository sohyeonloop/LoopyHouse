<%@page import="java.sql.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="com.google.gson.JsonParser"%>
<%@page import="user.vo.CustomerVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	BufferedReader rd = request.getReader();
	String jsonData = rd.readLine();
	
	Map<String, Object> map = new HashMap<>();
	
	CustomerVO cv = new CustomerVO();
	
	JsonParser parser = new JsonParser();
	JsonArray jsonArr = (JsonArray)parser.parse(jsonData);
	
	for(int i=0; i<jsonArr.size(); i++) {
		JsonObject jsonObj = (JsonObject)jsonArr.get(i);
		String key = jsonObj.get("name").getAsString();
		String value = jsonObj.get("value").getAsString();
		map.put(key, value);
	}
	BeanUtils.populate(cv, map);
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@112.220.114.130:1521:xe";
	Connection conn = DriverManager.getConnection(url, "team2_202302M", "java");
	
	String sql = "insert into customer "
				+ "( cust_id, cust_name, cust_mail, cust_addr, cust_gender, cust_tel, cust_birth, cust_nickname, cust_pwd ) "
				+ "values (?,?,?,?,?,?,to_date(?,'yyyy-mm-dd'),?,?)";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, cv.getCustId());
	pstmt.setString(2, cv.getCustName());
	pstmt.setString(3, cv.getCustMail());
	pstmt.setString(4, cv.getCustAddr());
	pstmt.setString(5, cv.getCustGender());
	pstmt.setString(6, cv.getCustTel());
	pstmt.setString(7, cv.getCustBirth());
	pstmt.setString(8, cv.getCustNickName());
	pstmt.setString(9, cv.getCustPwd());
	
	int rst = pstmt.executeUpdate();
	
	
%>
<%=rst %>