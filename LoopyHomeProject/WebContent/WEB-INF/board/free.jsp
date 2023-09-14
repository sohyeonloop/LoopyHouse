<%@page import="com.google.gson.Gson"%>
<%@page import="comm.vo.FreeAttachVO"%>
<%@page import="comm.vo.FreeBoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.101.0">
<title>FreeBoard</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/4.6/examples/album/">
<link href="${pageContext.request.contextPath}/css/album.css"
	rel="stylesheet">


<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none; +
	-ms-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.pager {
	float: left;
}

#writeBtn {
	display: flex;
	justify-content: flex-end;
}

.paging_area {
	display: flex;
	justify-content: center;
}

.pager li {
	margin-right: 10px;
}

footer {
	padding-top: 0;
	padding-bottom: 0;
}

.btn-xs {
	padding: 6px 12px;
	border-radius: 3px;
	border: 0;
}
</style>




</head>
<body>

	<%
		String loginCust = (String) session.getAttribute("custId");
	String loginAdmin = (String) session.getAttribute("mngId");
	%>
	<main role="main">

		<div class="album py-5 bg-light">
			<div class="container">
				<div class="row">
					<%
						List<FreeBoardVO> fBoardList = (List<FreeBoardVO>) request.getAttribute("boardList");

					for (FreeBoardVO board : fBoardList) {
					%>
					<div class="col-md-4 write"
						data-board='<%=new Gson().toJson(board)%>'>
						<div class="card mb-4 shadow-sm">
							<img
								src="${pageContext.request.contextPath}/images/<%=board.getFreeImage()%>"
								alt="대표사진" width="100%" height="225">
							<div class="card-body">
								<p class="card-text"><%=board.getFreeTitle()%></p>
								<p class="card-text"><%=board.getCustId()%></p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<button type="button" class="btn btn-sm btn-outline-secondary">View</button>
									</div>
									<small class="text-muted">조회수:<%=board.getFreeViews()%></small>
								</div>
							</div>
						</div>
					</div>
					<%
						} //for end
					%>
				</div>
			</div>
		</div>
		<div id="pageArea">

			<div class="paging_area">
				<ul class="pager">
					<% if((int) request.getAttribute("cPage") > 1) {%>
					<li><a href="${pageContext.request.contextPath}/comm/free.do?page=<%=((int) request.getAttribute("cPage")) -1 %>">이전</a></li>
					<%} else if((int) request.getAttribute("cPage") == 1) {  %>
					<li><a href="${pageContext.request.contextPath}/comm/free.do">이전</a></li>
					<%} %>
				</ul>

				<ul class="pagination pager">
					<%
						int sPage = (int) request.getAttribute("sPage");
					int ePage = (int) request.getAttribute("ePage");
					int cPage = (int) request.getAttribute("cPage");

					for (int i = sPage; i <= ePage; i++) {

						//현재페이지에만 활성화(active)적용하기
						if (cPage == i) {
					%>
					<li class="active"><a href="#"><%=i%></a></li>
					<%
						} else {
					%>
					<li><a href="#"><%=i%></a></li>
					<%
						} //if else end
					} //for end
					%>
				</ul>

				<ul class="pager">
					<% if((int) request.getAttribute("ePage") > 1) {%>
					<li><a href="${pageContext.request.contextPath}/comm/free.do?page=<%=((int) request.getAttribute("cPage")) +1 %>">다음</a></li>
					<%} else if((int) request.getAttribute("ePage") == 1) {  %>
					<li><a href="${pageContext.request.contextPath}/comm/free.do">다음</a></li>
					<%} %>
				</ul>
			</div>
			<%
				if (session.getAttribute("custId") != null && !session.getAttribute("custId").equals("")) {
			%>
			<div id="writeBtn">
				<input type="button" value="글쓰기" class="btn-xs btn-primary"
					onclick="location.href='${pageContext.request.contextPath}/write.jsp'">
			</div>
			<%
				}
			%>
		</div>


	</main>
	<script>
		$('.pagination li')
				.on(
						'click',
						function() {
							location.href = "${pageContext.request.contextPath}/comm/free.do?page="
									+ $(this).text();
						});

		$('.next')
				.on(
						'click',
						function() {
							let currentPage = parseInt($('.pagination')
									.children().last().text()) + 1;

							if (currentPage >
	<%=request.getAttribute("tPage")%>
		)
								return;
							location.href = "${pageContext.request.contextPath}/comm/free.do?page="
									+ currentPage;
						});

		$('.previous')
				.on(
						'click',
						function() {
							let currentPage = parseInt($('.pagination')
									.children().first().text()) - 1;

							if (currentPage < 1)
								return;
							location.href = "${pageContext.request.contextPath}/comm/free.do?page="
									+ currentPage;
						});
		$('.write')
				.click(
						function() {
							var board = $(this).data('board');
							window.location.href = "${pageContext.request.contextPath}/boardDetail.do?board="
									+ encodeURIComponent(JSON.stringify(board));
						});
	</script>


</body>
</html>
