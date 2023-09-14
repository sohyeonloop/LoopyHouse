<%@page import="java.util.List"%>
<%@page import="shop.vo.ProductVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="shop.dao.ProductDaoImpl"%>
<%@page import="shop.dao.IProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String loginCust = (String) session.getAttribute("custId");
String loginAdmin = (String) session.getAttribute("mngId");

IProductDao prodDao = ProductDaoImpl.getInstance();
ArrayList<ProductVO> listP = (ArrayList<ProductVO>) prodDao.CateProd();
%>



<style>
.imageR1 {
	display: flex;
	justify-content: center;
	margin-top: 40px;
}

.imageR2 {
	display: inline-block;
	margin: 16px;
}

.imageR2 img {
	border-radius: 5px;
	border: 1px solid #f3f3f3;
}

.rd_name {
	margin-top: 10px;
	font-weight: 600;
	font-size: 18px;
	margin-bottom: 4px;
}

#prodC {
	background-color: #48bfdf;
	border: 0;
	padding: 8px 15px;
}

.today_item {
	width: 1100px;
	margin: 0 auto;
	margin-top: 60px;
	margin-bottom: -42px;
}

.prod_name {
	font-size: 21px;
	font-weight: 500;
	margin-top: 5px;
	margin-bottom: 2px;
}
</style>

<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>



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

<!-- 홈 페이지 컨텐츠 영역------------------------------------------------------------- -->
<div class="home-page">
	<!-- 홈 페이지 컨텐츠 이미지 ------------------------------------------------------->
	<div class="container home-header">
		<div class="home-header__upper">
			<div>
				<img
					src="https://image.ohou.se/i/bucketplace-v2-development/uploads/projects/cover_images/164309149487027066.jpg?gif=1&w=850&h=567&c=c"
					alt="홈페이지 메인 이미지" />
				<div class="home-header-tit">
					<h4>전형적인 구조를 색다르게!</h4>
					<a href="./furniture.jsp">보러가기</a>
				</div>
			</div>
		</div>



		<div class="home-header__lower">
			<div class="home-header__lower-banner">
				<ul class="banner-slider">
					<li class="banner-item"><a href=""> <img class="col-img"
							src="https://image.ohou.se/i/bucketplace-v2-development/static/home_banner/sign_up_mobile_v2.png?gif=1&w=850"
							alt="베너 이미지1" /> <img class="row-img"
							src="https://image.ohou.se/i/bucketplace-v2-development/static/home_banner/sign_up_web_v2.png?gif=1&w=512"
							alt="베너 이미지1" />
					</a></li>
					<li class="banner-item"><a href=""> <img class="col-img"
							src="https://image.ohou.se/i/bucketplace-v2-development/uploads/banners/home_banner/164459861986493304.png?gif=1&w=850"
							alt="베너 이미지1" /> <img class="row-img"
							src="https://image.ohou.se/i/bucketplace-v2-development/uploads/banners/home_banner/164459862593345523.png?gif=1&w=512"
							alt="베너 이미지1" />
					</a></li>
					<li class="banner-item"><a href=""> <img class="col-img"
							src="https://image.ohou.se/i/bucketplace-v2-development/uploads/banners/home_banner/164559250412286029.png?gif=1&w=850"
							alt="베너 이미지1" /> <img class="row-img"
							src="https://image.ohou.se/i/bucketplace-v2-development/uploads/banners/home_banner/164559252959722925.png?gif=1&w=512"
							alt="베너 이미지1" />
					</a></li>
					<li class="banner-item"><a href=""> <img class="col-img"
							src="https://image.ohou.se/i/bucketplace-v2-development/uploads/banners/home_banner/164559255249087796.png?gif=1&w=850"
							alt="베너 이미지1" /> <img class="row-img"
							src="https://image.ohou.se/i/bucketplace-v2-development/uploads/banners/home_banner/164559255881515784.png?gif=1&w=512"
							alt="베너 이미지1" />
					</a></li>
				</ul>
			</div>
		</div>


	</div>
</div>



<h3 class="today_item">오늘의 추천 상품</h3>
<div class="imageR1">

	<%
		int r = 0;
	for (int i = 0; i < 4; i++) {
		r = (int) ((Math.random() * 89) + 1);
		ProductVO pv = listP.get(r);
	%>
	<!--랜덤상품 출력 -->
	<div class="imageR2">
		<img src="./images/<%=pv.getProdImage()%>" class="random"
			width="250px">
		<p class="prod_name"><%=pv.getProdName()%></p>
		<p><%=pv.getProdPrice()%>원
		</p>
		<a href="./productDetail.do?prodCode=<%=pv.getProdCode()%>"
			class="btn btn-secondary" id="prodC" role="button">상세 정보&raquo;</a>
	</div>
	<%
		}
	%>
</div>

<!--Footer-->
<%@include file="./footer.jsp"%>


<script src="js/write.js"></script>
<script src="js/mobileSearch.js"></script>
<script src="js/bannerSlider.js"></script>
</body>

</html>