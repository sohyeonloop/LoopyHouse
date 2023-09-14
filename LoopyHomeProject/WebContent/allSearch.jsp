<%@page import="com.google.gson.Gson"%>
<%@page import="comm.vo.FreeBoardVO"%>
<%@page import="shop.vo.ProductVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<ProductVO> prodList = null;
List<FreeBoardVO> freeList = null;

if (request.getAttribute("prodList") != null) {
	prodList = (List<ProductVO>) request.getAttribute("prodList");
}

if (request.getAttribute("freeList") != null) {
	freeList = (List<FreeBoardVO>) request.getAttribute("freeList");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통합검색</title>

<script src="./js/jquery-3.6.4.min.js"></script>

<!-- Bootstrap core CSS -->
<link href="./css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="./css/album.css" rel="stylesheet">

<!-- Link Swiper's CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

<style>
.swiper {
	width: 100%;
	height: 100%;
}

.swiper-slide {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	position: relative;
}

.swiper-slide img {
	display: block;
	width: 100%;
	width: 300px;
	height: 250px;
}

.swiper-horizontal>.swiper-scrollbar {
	display: none;
}

.swiper-slide p {
	font-weight: 600;
}

.product_name {
	margin-top: 10px;
}

.pirce {
	margin-top: -15px;
	font-weight: 600;
}

.swiper-pagination {
	top: 332px !important;
}

.line {
	border-bottom: 1px solid rgb(214, 214, 214);
}

i {
	margin-left: 25px;
}

.bi-heart {
	margin-top: -19px;
}

.hidP {
	display: none;
}

.album {
	display: flex;
}

.swiper-pagination {
	display: none;
}

.else_txt {
	font-size: 18px;
	font-weight: 500;
	color: #5c5c5c;
	margin-left: 15px;
}
</style>
</head>
<body>


	<!-- header -->
	<%
		String loginCust = (String) session.getAttribute("custId");
	String loginAdmin = (String) session.getAttribute("mngId");
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


	<main role="main">

		<div class="album py-5 bg-light">
			<div class="container">

				<h4 style="margin-bottom: 20px; font-weight: 600;">상품</h4>
				<div class="row" align="center">

					<div class="swiper mySwiper">
						<div class="swiper-wrapper">


							<%
								if (prodList.size() > 0) {
								for (ProductVO pv : prodList) {
							%>
							<div class="swiper-slide">

								<div class="col-md-12">
									<img src="./images/<%=pv.getProdImage()%>" class="img">
									<!-- 상품이미지 경로! -->
									<h4><%=pv.getProdName()%></h4>
									<p><%=pv.getProdPrice()%>원
									</p>
									<a href="./productDetail.do?prodCode=<%=pv.getProdCode()%>"
										class="btn btn-secondary" id="prodC" role="button">상세정보&raquo;</a>
									<p class="pcode hidP"><%=pv.getProdCode()%></p>
								</div>
							</div>
							<%
								}
							} else {
							%>
							<p class="else_txt">검색 결과가 없습니다.</p>
							<%
								}
							%>





						</div>

						<div class="swiper-button-next"></div>
						<div class="swiper-button-prev"></div>
						<div class="swiper-scrollbar"></div>
						<div class="swiper-pagination"></div>
					</div>

				</div>
			</div>
		</div>

		<div class="line"></div>



		<div class="album py-5 bg-light">
			<div class="container">

				<h4 style="margin-bottom: 20px; font-weight: 600;">커뮤니티</h4>
				<div class="row">

					<div class="swiper mySwiper">
						<div class="swiper-wrapper">
							<%
								if (freeList.size() > 0) {
								for (FreeBoardVO board : freeList) {
							%>
							<%-- 	
								<img
									src="./images/<%=fv.getFreeImage()%>" />
								<p class="product_name">
									글제목 : <%=fv.getFreeTitle()%></p>
								<p class="product_name">
									작성자<%=fv.getCustId()%></p>
							 --%>
							<div class="swiper-slide">
								<div class="card mb-4 shadow-sm">
									<img src="./images/<%=board.getFreeImage()%>" alt="대표사진"
										width="100%" height="225">
									<div class="card-body">
										<p class="card-text"><%=board.getFreeTitle()%></p>
										<p class="card-text">
											작성자 :
											<%=board.getCustId()%></p>
										<div class="d-flex justify-content-between align-items-center">
											<div class="btn-group">
												<button type="button" onclick="boardBtnClick()"
													data-board='<%=new Gson().toJson(board)%>'
													class="btn btn-sm btn-outline-secondary">View</button>
											</div>
											<small class="text-muted">조회수:<%=board.getFreeViews()%></small>
										</div>
									</div>
								</div>
							</div>
							<%
								}
							} else {
							%>
							<p class="else_txt">검색 결과가 없습니다.</p>
							<%
								}
							%>
						</div>
						<div class="swiper-button-next"></div>
						<div class="swiper-button-prev"></div>
						<div class="swiper-scrollbar"></div>
						<div class="swiper-pagination"></div>
					</div>

				</div>
			</div>
		</div>


	</main>

	<script
		src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-element-bundle.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>

	<!-- Initialize Swiper -->
	<script>
		var swiper = new Swiper(".mySwiper", {
			slidesPerView : 3,
			centeredSlides : false,
			slidesPerGroupSkip : 3,
			grabCursor : true,
			keyboard : {
				enabled : true,
			},
			breakpoints : {
				769 : {
					slidesPerView : 3,
					slidesPerGroup : 3,
				},
			},
			scrollbar : {
				el : ".swiper-scrollbar",
			},
			navigation : {
				nextEl : ".swiper-button-next",
				prevEl : ".swiper-button-prev",
			},
			pagination : {
				el : ".swiper-pagination",
				clickable : true,
			},
			autoplay : {
				delay : 2000,
			},
		});

		function boardBtnClick(board) {
			var button = event.target;
			var boardData = button.getAttribute('data-board');
			var board = JSON.parse(boardData);
			var url = "${pageContext.request.contextPath}/boardDetail.do?board="
					+ encodeURIComponent(JSON.stringify(board));
			window.location.href = url;

		}
	</script>






	<!-- footer -->
	<%@include file="./footer.jsp"%>


</body>
</html>