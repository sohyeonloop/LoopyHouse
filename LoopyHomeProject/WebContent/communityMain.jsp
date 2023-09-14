<%@page import="com.google.gson.Gson"%>
<%@page import="comm.vo.NoticeVO"%>
<%@page import="comm.vo.InqBoardVO"%>
<%@page import="comm.vo.FreeBoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String loginCust = "";
String loginAdmin = "";
if (session.getAttribute("custId") != null && !session.getAttribute("custId").equals("")) {
	loginCust = (String) session.getAttribute("custId");
} else if (session.getAttribute("mngId") != null && !session.getAttribute("mngId").equals("")) {
	loginAdmin = (String) session.getAttribute("mngId");
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


<!-- <link rel="canonical" -->
<!-- 	href="https://getbootstrap.com/docs/5.2/examples/blog/"> -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="./css/bootstrap.min.css" rel="stylesheet">
<link rel="canonical"
	href="https://getbootstrap.com/docs/4.6/examples/carousel/">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Dongle:wght@700&display=swap"
	rel="stylesheet">


<style>
main {
	max-height: none !important;
	overflow-y: scroll !important;
}

.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.b-example-divider {
	height: 3rem;
	background-color: rgba(0, 0, 0, .1);
	border: solid rgba(0, 0, 0, .15);
	border-width: 1px 0;
	box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em
		rgba(0, 0, 0, .15);
}

.b-example-vr {
	flex-shrink: 0;
	width: 1.5rem;
	height: 100vh;
}

.bi {
	vertical-align: -.125em;
	fill: currentColor;
}

.nav-scroller {
	position: relative;
	z-index: 2;
	height: 2.75rem;
	overflow-y: hidden;
}

.nav-scroller .nav {
	display: flex;
	flex-wrap: nowrap;
	padding-bottom: 1rem;
	margin-top: -1px;
	overflow-x: auto;
	text-align: center;
	white-space: nowrap;
	-webkit-overflow-scrolling: touch;
}

.bigContainer {
	display: flex;
}

.col-md-6 {
	max-width: 45% !important;
}

.chat_area {
	margin-left: 50px;
}

.Bcolor {
	font-family: 'Dongle', sans-serif;
	color: white;
	font-size: 64px;
	text-shadow: 2px 5px 7px rgb(58, 58, 58);
	background: rgba(58, 58, 58, 0.2);
	border-radius: 19px;
}

body {
	padding-top: 0 !important;
	padding-bottom: 0 !important;
}

.container {
	overflow: hidden !important;
}

.d-inline-block {
	font-size: 22px;
}
</style>


<!-- Custom styles for this template -->
<link
	href="https://fonts.googleapis.com/css?family=Playfair&#43;Display:700,900&amp;display=swap"
	rel="stylesheet">
<!-- Custom styles for this template -->
<%-- <link href="${pageContext.request.contextPath}/css/blog.css" --%>
<!-- 	rel="stylesheet"> -->

<link href="${pageContext.request.contextPath}/css/carousel.css"
	rel="stylesheet">

<body>
	<%
		List<FreeBoardVO> freePopularList = (List<FreeBoardVO>) request.getAttribute("freePopular");
	List<FreeBoardVO> freeRecentList = (List<FreeBoardVO>) request.getAttribute("freeRecent");
	List<InqBoardVO> inqRecentList = (List<InqBoardVO>) request.getAttribute("inqRecent");
	List<NoticeVO> notRecentList = (List<NoticeVO>) request.getAttribute("notRecent");
	int count = 0;
	%>
	<div class="bigContainer">
		<%@include file="./side.jsp"%>


		<main class="container">

			<div class="row mb-2">
				<div class="col-md-6">
					<strong class="d-inline-block mb-2 text-primary">인기게시물</strong>
					<div id="myCarousel" class="carousel slide" data-ride="carousel">
						<ol class="carousel-indicators">
							<%
								for (int i = 0; i < freePopularList.size(); i++) {
								if (i == 0) {
							%>
							<li data-target="#myCarousel" data-slide-to="<%=i%>"
								class="active"></li>
							<%
								} else if (i > 0) {
							%>
							<li data-target="#myCarousel" data-slide-to="<%=i%>"></li>
							<%
								}
							}
							%>
						</ol>
						<div class="carousel-inner">
							<%
								for (FreeBoardVO board : freePopularList) {

								if (count == 0) {
							%>
							<div class="carousel-item active write"
								data-board='<%=new Gson().toJson(board)%>'>
								<img src="./images/<%=board.getFreeImage()%>" alt="대표사진">

								<div class="container">
									<div class="carousel-caption">
										<h2 class="Bcolor"><%=board.getFreeTitle()%></h1>
											<p class="Bcolor"><%=board.getCustId()%></p>
											<p>
												<a class="btn btn-lg btn-primary" href="#">보러가기</a>
											</p>
									</div>
								</div>
							</div>
							<%
								} else if (count > 0) {
							%>
							<div class="carousel-item write"
								data-board='<%=new Gson().toJson(board)%>'>
								<img src="./images/<%=board.getFreeImage()%>" alt="대표사진">
								<div class="container">
									<div class="carousel-caption">
										<h2 class="Bcolor"><%=board.getFreeTitle()%></h1>
											<p class="Bcolor"><%=board.getCustId()%></p>
											<p>
												<a class="btn btn-lg btn-primary" href="#">보러가기</a>
											</p>
									</div>
								</div>
							</div>

							<%
								}
							%>

							<%
								count++;
							}
							%>

						</div>
						<button class="carousel-control-prev" type="button"
							data-target="#myCarousel" data-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="sr-only">Previous</span>
						</button>
						<button class="carousel-control-next" type="button"
							data-target="#myCarousel" data-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
						</button>
					</div>


				</div>
				<div class="col-md-6 chat_area">

					<strong class="d-inline-block mb-2 text-primary">채팅방</strong>

					<div
						class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative"
						style="display: none;"></div>
					<%@include file="./chat.jsp"%>
				</div>
			</div>
			<div class="row mb-2" style="border-radius: 7px;">
				<div class="py-5" style="width: 100%">
					<div class="row">
						<main role="main" class="col-md-12 px-md-4">
							<strong class="d-inline-block mb-1 text-primary">최신
								자유게시물</strong>
							<div class="table-responsive">
								<table class="table table-striped table-sm">
									<thead>
										<tr>
											<th>게시판번호</th>
											<th>제목</th>
											<th>작성자</th>
											<th>작성일</th>
											<th>조회수</th>
										</tr>
									</thead>
									<tbody>
										<%
											for (FreeBoardVO board : freeRecentList) {
										%>
										<tr data-board='<%=new Gson().toJson(board)%>'>
											<td><%=board.getFreeNo()%></td>
											<td><%=board.getFreeTitle()%></td>
											<td><%=board.getCustId()%></td>
											<td><%=board.getFreeDate()%></td>
											<td><%=board.getFreeViews()%></td>
										</tr>
										<%
											}
										%>
									</tbody>
								</table>
							</div>
							<strong class="d-inline-block mb-1 text-primary">최신
								문의게시물</strong>
							<div class="table-responsive">
								<table class="table table-striped table-sm">
									<thead>
										<tr>
											<th>게시판번호</th>
											<th>제목</th>
											<th>작성자</th>
											<th>작성일</th>
											<th>조회수</th>
										</tr>
									</thead>
									<tbody>
										<%
											for (InqBoardVO board : inqRecentList) {
										%>
										<tr data-board='<%=new Gson().toJson(board)%>'>
											<td><%=board.getInqNo()%></td>
											<td><%=board.getInqTitle()%></td>
											<td><%=board.getCustId()%></td>
											<td><%=board.getInqDate()%></td>
											<td><%=board.getInqViews()%></td>
										</tr>
										<%
											}
										%>
									</tbody>
								</table>
							</div>
							<strong class="d-inline-block mb-1 text-primary">최신
								공지게시물</strong>
							<div class="table-responsive">
								<table class="table table-striped table-sm">
									<thead>
										<tr>
											<th>게시판번호</th>
											<th>제목</th>
											<th>작성자</th>
											<th>작성일</th>
											<th>조회수</th>
										</tr>
									</thead>
									<tbody>
										<%
											for (NoticeVO board : notRecentList) {
										%>
										<tr data-board='<%=new Gson().toJson(board)%>'>
											<td><%=board.getNoticeNo()%></td>
											<td><%=board.getNoticeTitle()%></td>
											<td><%=board.getMngId()%></td>
											<td><%=board.getNoticeDate()%></td>
											<td><%=board.getNoticeViews()%></td>
										</tr>
										<%
											}
										%>
									</tbody>
								</table>
							</div>
						</main>
					</div>


				</div>
			</div>


		</main>
	</div>

	<%@include file="./footer.jsp"%>

	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="../assets/js/vendor/jquery.slim.min.js"><\/script>')
	</script>
	<script>
		$('tbody tr')
				.on(
						'click',
						function() {
							var board = $(this).data('board');
							window.location.href = "${pageContext.request.contextPath}/boardDetail.do?board="
									+ encodeURIComponent(JSON.stringify(board));
						});

		$('.write')
				.click(
						function() {
							var board = $(this).data('board');
							window.location.href = "${pageContext.request.contextPath}/boardDetail.do?board="
									+ encodeURIComponent(JSON.stringify(board));
						});
	</script>
	<script src="./js/bootstrap.bundle.min.js"></script>