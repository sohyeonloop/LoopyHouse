<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<!DOCTYPE html>
<html>
<head>

<%
String loginCust = (String) session.getAttribute("custId");
String loginAdmin = (String) session.getAttribute("mngId");
%>

<!-- 헤더 -->
<%
if (loginCust != null && !loginCust.equals("")) {
	//회원로그인이면 마이페이지뜨게
%>
<%@include file="/header2.jsp"%>
<%
} else if (loginAdmin != null && !loginAdmin.equals("")) {
//관리자 로그인이면 관리자페이지 뜨게
%>
<%@include file="/header3.jsp"%>
<%
} else {
//비회원이면 그냥 헤더
%>
<%@include file="/header.jsp"%>
<%
}
%>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet">

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
#side {
	display: flex;
	margin-bottom: 50px;
}

#sidebar {
	width: 20%
}

#contents {
	width: 60%
}



</style>
<decorator:head />

</head>

<body>
	<div id="side">
		<div id="sidebar">
			<%@include file="/side.jsp"%>
		</div>
		<div id="contents">
			<decorator:body />
		</div>
	</div>
</body>

<footer>
	<%@include file="/footer.jsp"%>
</footer>
</html>