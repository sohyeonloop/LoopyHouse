<%@page import="user.vo.CustomerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	CustomerVO cv = (CustomerVO) request.getAttribute("cv");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원검색</title>
</head>
<!-- JavaScript Bundle with Popper -->
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<body>
	<h3><%=cv.getCustId() %>>님의 정보</h3>
	<table class="table table-hover">
		<thead>
			<tr>
				<th scope="col">1</th>
				<td scope="col">고객ID</td>
				<td scope="col"><%=cv.getCustId() %></td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th scope="row">2</th>
				<td>비밀번호</td>
				<td><%=cv.getCustPwd() %></td>
			</tr>
			<tr>
				<th scope="row">3</th>
				<td>이름</td>
				<td><%=cv.getCustName() %></td>
			</tr>
			<tr>
				<th scope="row">4</th>
				<td>닉네임</td>
				<td><%=cv.getCustNickName() %></td>
			</tr>
			<tr>
				<th scope="row">5</th>
				<td>핸드폰 번호</td>
				<td><%=cv.getCustTel() %></td>
			</tr>
			<tr>
				<th scope="row">6</th>
				<td>이메일</td>
				<td><%=cv.getCustMail() %></td>
			</tr>
			<tr>
				<th scope="row">7</th>
				<td>생년월일</td>
				<td><%=cv.getCustBirth() %></td>
			</tr>
			<tr>
				<th scope="row">7</th>
				<td>성별</td>
				<td><%=cv.getCustGender() %></td>
			</tr>
		</tbody>
	</table>
</body>
</html>

