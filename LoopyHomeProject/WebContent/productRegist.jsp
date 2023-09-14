<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="user.vo.CustomerVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="shop.dao.ProductDaoImpl"%>
<%@page import="shop.dao.IProductDao"%>
<%@page import="shop.vo.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ProductVO pv = (ProductVO) request.getAttribute("pv");
%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.104.2">
<title>상세 페이지</title>

<script src="/static/js/bootstrap.bundle.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<link rel="canonical"
	href="https://getbootstrap.com/docs/5.2/examples/jumbotron/">
<link href="./css/bootstrap.min.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style>
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

.right-sort {
	text-align: right;
	font-size: 25px;
}

.detail_veiw {
	width: 100%;
	background: white;
	border: 1px solid #d9d9d9;
	margin-top: 40px;
	height: 180px;
	border-radius: 4px;
	border: 1px solid #d9d9d9;
	margin-top: 40px;
	padding: 15px;
	font-weight: 500;
}

.py-5 {
	padding: 0 !important;
	margin-top: 40px;
}

.hidP {
	display: none;
}

.form-control {
	margin-top: 5px;
}

#Plabel {
	font-size: large;
}
</style>


</head>
<body>
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

	<main>
		<form method="post"
			action="${pageContext.request.contextPath}/prodRegist.do"
			enctype="multipart/form-data">
			<div class="container py-4">

				<div class="row align-items-md-stretch">
					<div class="col-md-6">
						<h3>썸네일 사진 첨부</h3>
						<hr>
						<input type="file" name="thumbnailFile">

					</div>

					<div class="col-md-6">
						<div class="h-100 p-5 bg-light border rounded-3">
							<h3>상품정보 입력</h3>
							<h2 class="pname"></h2>
							<hr>
							<p class="right-sort prodPrice"></p>
							<label id="Plabel"> 상품코드 : <select name="cateCode">
									<option class="pCode" value="F001">가구</option>
									<option class="pCode" value="CE001">가전·디지털</option>
									<option class="pCode" value="D001">데코</option>
									<option class="pCode" value="L001">조명</option>
									<option class="pCode" value="DS001">생활용품</option>
									<option class="pCode" value="K001">주방용품</option>
							</select>
							</label><br> <input type="text" class="form-control" name="prodName"
								value="" placeholder="상품명 입력"> <input type="text"
								class="form-control" name="prodPrice" value=""
								placeholder="가격 입력"> <input type="text"
								class="form-control" name="prodColor" value=""
								placeholder="색상 입력">
							<button type="submit" class="btn btn-outline-info">상품등록</button>

						</div>
					</div>
				</div>

				<br>
				<hr>
				<br>
				<div class="p-5 mb-4 bg-light rounded-3">
					<h3>상세사진 첨부</h3>
					<hr>
					<input type="file" name="detailFile">
				</div>




			</div>

		</form>



		<%@include file="./footer.jsp"%>
	</main>

	<script>
		
	</script>

</body>
</html>
