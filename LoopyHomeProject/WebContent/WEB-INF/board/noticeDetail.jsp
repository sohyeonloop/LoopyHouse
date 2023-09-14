<%@page import="com.google.gson.Gson"%>
<%@page import="comm.vo.InqComtVO"%>
<%@page import="comm.vo.FreeComtVO"%>
<%@page import="java.util.List"%>
<%@page import="comm.vo.NoticeVO"%>
<%@page import="comm.vo.InqBoardVO"%>
<%@page import="comm.vo.FreeBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#container {
	width: 100%;
	display: flex;
	/* 	flex-direction: column; */
	justify-content: center;
	align-items: center;
}

#title {
	font-size: 20px;
	font-weight: 900;
	margin: 10px;
}

.brd {
	display: flex;
	justify-content: center;
	margin: 10px;
	border-bottom: 1px solid grey;
}

.brd p {
	margin: 10px;
}

.outline{
	width:80%;
}

#content {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	border-bottom: 1px solid grey;
	padding: 100px;
}

p img {
	width: 700px !important;
}


.btn.btn-outline-primary {
	width: 86px;
	margin-left: 680px;
}

#end {
	display: flex;
	justify-content: flex-end;
	width: 700px;
}

#end button {
	margin: 4px;
}

#boardBtn {
	width: 100%;
	display: flex;
	justify-content: flex-end;
}
#cmtSubmit{

	display: flex;
    justify-content: flex-end;
}


</style>
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
</head>
<body>
	<%
	String loginCust = (String) session.getAttribute("custId");
	String loginAdmin = (String) session.getAttribute("mngId");
	String check = (String) request.getAttribute("check");
	String user = "";
	if (session.getAttribute("custId") != null && !session.getAttribute("custId").equals("")) {
		user = (String) session.getAttribute("custId");
	} else if (session.getAttribute("mngId") != null && !session.getAttribute("mngId").equals("")) {
		user = (String) session.getAttribute("mngId");
	}
	NoticeVO board = (NoticeVO) request.getAttribute("board");
	%>

	<div id="container">
		<div class="outline">
			<div class="brd" id="titlediv">
				<p id="title"><%=board.getNoticeTitle()%></p>
			</div>
			<div class="brd">
				<p>
					작성자:
					<%=board.getMngId()%></p>
				<p>
					작성일:
					<%=board.getNoticeDate()%></p>
			</div>
			<div id="content">
				<%=board.getNoticeContent()%>
				<%
				if (session.getAttribute("mngId") != null && !session.getAttribute("mngId").equals("")) {
				%>
				<div id="boardBtn">
					<form action="${pageContext.request.contextPath}/boardModify.jsp" method="post">
						<input type="hidden" name="board"
							value='<%=new Gson().toJson(board)%>'>
						<button class="btn btn-primary" type="submit">수정</button>
					</form>
					<form action="${pageContext.request.contextPath}/boardDelete.do" method="post">
						<input type="hidden" name="board"
							value='<%=new Gson().toJson(board)%>'>
						<button class="btn btn-primary" type="submit">삭제</button>
					</form>
				</div>
				<%
				}
				%>
			</div>

	</div>
	</div>


	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	


</body>
</html>