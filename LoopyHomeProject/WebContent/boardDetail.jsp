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

.outline {
	width: 50%;
}

#content {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	border-bottom: 1px solid grey;
	
}

p img {
	width: 500px !important;
}

.btn.btn-outline-primary {
	width: 86px;
	margin-left: 680px;
}

#comment{
background: yellow;

}

/* #titlediv{ */
/* 	display:flex; */
/* 	justify-content: center;  */
/* 	border-bottom: 1px solid grey; */
/* } */
</style>
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
</head>
<body>
	<%
	
	String loginCust = (String) session.getAttribute("custId");
	String loginAdmin = (String) session.getAttribute("mngId");
	String check = (String) request.getAttribute("check");
	String boardNo = "";
	String writerId = "";
	String title = "";
	String content = "";
	String date = "";
	String user = "";
	String boardType = "";
	int views = 0;
	if (session.getAttribute("custId") != null && !session.getAttribute("custId").equals("")) {
		user = (String) session.getAttribute("custId");
	} else if (session.getAttribute("mngId") != null && !session.getAttribute("mngId").equals("")) {
		user = (String) session.getAttribute("mngId");
	}

	if (check.equals("free")) {
		FreeBoardVO board = (FreeBoardVO) request.getAttribute("freeBoard");
		boardNo = board.getFreeNo();
		title = board.getFreeTitle();
		content = board.getFreeContent();
		date = board.getFreeDate();
		views = board.getFreeViews();
		writerId = board.getCustId();
	} else if (check.equals("inq")) {
		InqBoardVO board = (InqBoardVO) request.getAttribute("InqBoard");
		boardNo = board.getInqNo();
		title = board.getInqTitle();
		content = board.getInqContent();
		date = board.getInqDate();
		views = board.getInqViews();
		writerId = board.getCustId();
	} else if (check.equals("not")) {
		NoticeVO board = (NoticeVO) request.getAttribute("notice");
		boardNo = board.getNoticeNo();
		title = board.getNoticeTitle();
		content = board.getNoticeContent();
		date = board.getNoticeDate();
		views = board.getNoticeViews();
		writerId = board.getMngId();
	}
	%>

	<!-- 헤더 -->
	<%
		if (loginCust != null && !loginCust.equals("")) {
		//회원로그인이면 마이페이지뜨게
	%>
	<%@include file="./header2.jsp"%>

	<%
		} else if (loginAdmin != null && !loginAdmin.equals("")) {
	//관리자 로그인이면 관리자페이지 뜨게
	%>
	<%@include file="./header3.jsp"%>
	<%
		} else {
	//비회원이면 그냥 헤더
	%>
	<%@include file="./header.jsp"%>
	<%
		}
	%>
	<div id="container">
		<div class="outline">
			<div class="brd" id="titlediv">
				<p id="title"><%=title%></p>
			</div>
			<div class="brd">
				<p>
					작성자:
					<%=writerId%></p>
				<p>
					작성일:
					<%=date%></p>
			</div>
			<div id="content">
				<%=content%>
			</div>
			<section id="comment">
				<div class="card bg-light">
					<div class="card-body">
						<!-- Comment form-->
						<form class="mb-4" action="">
							<div id="cmt">
								<input type="hidden" name="userId" value="<%=user%>"> <input
									type="hidden" name="check" value="<%=check%>"> <input
									type="hidden" name="boardNo" value="<%=boardNo%>">
								<textarea class="form-control" rows="3" name="cmt" id="formArea"
									laceholder="Join the discussion and leave a comment!">
								</textarea>
								<button type="submit" class="btn btn-outline-primary">입력</button>
							</div>
						</form>
				<%
						String comment = "";
						if(check.equals("free") && request.getAttribute("comment") != null){
							List<FreeComtVO> commentList = (List<FreeComtVO>) request.getAttribute("comment");

							for (FreeComtVO cmt : commentList) {%>
							<div class="d-flex">
							<div class="flex-shrink-0">
								<img class="rounded-circle"
									src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." />
							</div>
							 <div class="ms-3">
								<div class="fw-bold"><%=user%></div>
								<%=cmt.getFreeCmContent() %>
							</div>
						</div>
								
							<%}
						}%>
				<% 
						if(check.equals("inq") && request.getAttribute("comment") != null){
							List<InqComtVO> commentList = (List<InqComtVO>) request.getAttribute("comment");
							
							for (InqComtVO cmt : commentList) {%>
							<div class="d-flex">
							<div class="flex-shrink-0">
								<img class="rounded-circle"
									src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." />
							</div>
							 <div class="ms-3">
								<div class="fw-bold"><%=user%></div>
								<%=cmt.getInqCmContent() %>
							</div>
						</div>
						<% }
					  }		
				%>						
					
					</div>
				</div>
			</section>

		</div>
	</div>


	<!-- footer -->
	<%@include file="./footer.jsp"%>

	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>


</body>
</html>