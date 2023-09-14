<%@page import="shop.vo.ReviewVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<ReviewVO> revList = (List<ReviewVO>) request.getAttribute("revList");
String prodName = (String) request.getAttribute("prodName");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.upate_wrap {
	border: 1px solid #d8dbdd;
	border-radius: 5px;
	padding: 30px;
}

.reivew_bar {
	position: relative;
	top: 0;
	left: 0;
	height: 10px;
	width: 100%;
	font-weight: 600;
	font-size: 25px;
	margin-bottom: 10px;
}

.line {
	border-bottom: 1px solid rgb(214, 214, 214);
	width: 100%;
	margin-top: 30px;
}

.nemo {
	width: 5px;
	height: 100%;
	display: inline-block;
	background: #d1e5fb;
	height: 15px;
	margin-bottom: -2px;
	margin-right: 5px;
}

.product_name {
	margin-top: -16px;
	font-size: 17px;
}

.review_img {
	width: 200px;
	height: 200px;
	margin-right: 100px;
}

.review_img img {
	width: 100%;
	height: 100%;
	border-radius: 5px;
}

.rv_txt {
	display: flex;
	margin-top: 49px;
}

.rv_txt p {
	display: flex;
	align-items: center;
	word-break: break-all;
	width: 530px;
}

.container {
	margin-top: -50px !important;
	margin-bottom: 70px !important;
}

.drop_area p {
	font-weight: 500;
	font-size: 17px;
}

.review_text {
	border: 1px solid #d9d9d9;
	padding: 30px;
	border-radius: 5px;
}
</style>

<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>

<!-- Custom styles for this template -->
<link href="./css/album.css" rel="stylesheet">

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








	<div class="container">

		<div class="py-5 text-center"></div>

		<div class="row upate_wrap">
			<div class="reivew_bar">
				<p style="margin-left: 12px;">리뷰</p>
			</div>



			<!-- 리뷰 fon문 돌려주세요-->
			<%
				if (revList != null) {

				for (ReviewVO rv : revList) {
			%>
			<div class="col-md-12 order-md-1">

				<div style="display: flex; justify-content: space-between;">
					<div class="drop_area">
						<h3 class="mb-3"
							style="font-weight: 600; margin-bottom: 45px !important;"></h3>
						<p>
							<span class="nemo"></span>작성자 :
							<%=rv.getCustId()%></p>
						<p class="product_name">
							<span class="nemo"></span><%=prodName%>
						</p>

					</div>


					<div class="rv_txt">
						<div class="review_img">
							<img src="./images/<%=rv.getRevImage()%>" alt="">
						</div>
						<%
						String str = rv.getRevcontent();
						String replaced = str.replaceAll("<img[^>]*>", "");
						replaced = replaced.replaceAll("<p>","");
						replaced = replaced.replaceAll("</p>"," ");
						
// 						String[] strSplit = str.split(">");
// 						String content = strSplit[2];
// 						System.out.print(content);
						%>
						<p class="review_text"><%=replaced%></p>
					</div>
				</div>


				<p class="line"></p>
			</div>


			<%
				}

			} else {
			%>
			<h1>작성된 리뷰가 없습니다.</h1>
			<%
				}
			%>





		</div>

	</div>














	<!-- footer -->
	<%@include file="./footer.jsp"%>

	<script src="../assets/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/write.js"></script>
	<script src="js/mobileSearch.js"></script>
	<script src="js/bannerSlider.js"></script>




</body>
</html>