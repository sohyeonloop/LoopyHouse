<%@page import="shop.vo.ProductVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="shop.vo.OrderVO"%>
<%@page import="user.vo.CustomerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	CustomerVO cv = (CustomerVO) request.getAttribute("cusVo");

List<HashMap<String, Object>> hsrst = (List<HashMap<String, Object>>) request.getAttribute("hsRst");

List<HashMap<String, Object>> wish = (List<HashMap<String, Object>>) request.getAttribute("wish");

String custPhoto = cv.getCustPhoto();

if (custPhoto != null) {
	custPhoto = cv.getCustPhoto();

} else {
	custPhoto = "./profile_defalut.PNG";
}
ProductVO pv = new ProductVO();
%>


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


<title>오늘의집 마이페이지</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/4.6/examples/album/">



<!-- Bootstrap core CSS -->
<link href="./css/bootstrap.min.css" rel="stylesheet">



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

.card-body {
	height: 350px;
	padding: 40px;
}

.profile_img img {
	width: 140px;
	border-radius: 50%;
	border: 1px solid rgb(211, 211, 211);
}

.profile_area {
	display: flex;
}

.nickname {
	font-size: 1.2em;
	font-weight: 600;
	display: flex;
	flex-direction: column-reverse;
	margin-left: 20px;
}

.profile_btn {
	display: inline-block;
	text-decoration: none;
	color: black;
	text-decoration: none !important;
	border: 1px solid rgb(199, 199, 199);
	padding: 5px 10px;
	border-radius: 3px;
	margin-top: 30px;
	cursor: pointer;
}

.profile_btn:hover {
	color: black;
}

.mypage_txt {
	font-size: 1.2em;
	font-weight: 700;
}

p {
	margin-bottom: 3px !important;
}

.order_area {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.date {
	font-weight: 500;
}

.order_name {
	font-weight: 700;
}

.order_btn {
	background-color: #23b3df;
	border: 0;
	border-radius: 3px;
	padding: 5px 14px;
}

.order_btn a {
	color: white;
	text-decoration: none;
	font-weight: 600;
}

.sos {
	color: black;
	font-weight: 600;
	cursor: pointer;
}

.order_img img {
	width: 100px;
	height: 100px;
}

.review-go {
	background-color: pink !important;
}


.order_scroll {
	overflow-y: scroll;
}

/* 아래의 모든 코드는 영역::코드로 사용 */
.order_scroll::-webkit-scrollbar {
	width: 10px; /* 스크롤바의 너비 */
}

.order_scroll::-webkit-scrollbar-thumb {
	height: 30%; /* 스크롤바의 길이 */
	background: #dfdfdf; /* 스크롤바의 색상 */
	border-radius: 10px;
}

.order_scroll::-webkit-scrollbar-track {
	background: rgba(33, 122, 244, .1); /*스크롤바 뒷 배경 색상*/
}
</style>



<!-- Custom styles for this template -->
<link href="./css/album.css" rel="stylesheet">
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

				<div class="row">

					<div class="col-md-6">
						<p class="mypage_txt">회원설정</p>
						<div class="card mb-4 shadow-sm">

							<div class="card-body">

								<div class="profile_area">
									<div class="profile_img">
										<img src="./images/<%=custPhoto%>" alt="기본프로필사진">
									</div>
									<p class="nickname">
										<%=cv.getCustNickName()%>
									</p>
								</div>

								<a href="./update.do?id=<%=cv.getCustId()%>" class="profile_btn">회원정보
									설정</a>
							</div>
						</div>
					</div>

					<div class="col-md-6">
						<p class="mypage_txt">주문내역</p>
						<div class="card mb-4 shadow-sm">

							<div class="card-body order_scroll">




								<%
									if (hsrst != null && hsrst.size() > 0) {
									boolean hasOrder = false; // 주문 목록 여부를 확인하기 위한 변수

									for (int i = 0; i < hsrst.size(); i++) {
										HashMap<String, Object> order = hsrst.get(i);
								%>
								<!-- 주문 목록 출력 내용 -->
								<div class="date">
									<p><%=order.get("ORD_DATE")%></p>
								</div>
								<div class="order_area">
									<div class="order_img">
										<img src="./images/<%=order.get("PROD_IMAGE")%>" alt="주문목록이미지">
									</div>
									<div class="order_name">
										<p><%=order.get("PROD_NAME")%></p>
										<p><%=order.get("PROD_PRICE")%></p>
									</div>
									<div>
										
												<%
													String status = (String) order.get("ITEM_STATUS");
												System.out.print(status);
												if (status.equals("N")) {
												%>
												<span><button class="order_btn">
												<a
													href="./reviewWrite.do?PROD_CODE=<%=order.get("PROD_CODE")%>&ORD_NO=<%=order.get("ORD_NO")%>">리뷰작성</a>
												</button></span>
												<%
													} else {
												%>
												<span><button class="order_btn" style="background:pink;">
												<a class="review-go"
													href="./review.do?prodCode=<%=order.get("PROD_CODE")%>&prodName=<%=order.get("PROD_NAME")%>">리뷰보기</a>
												</button></span>
												<%
													}
												%>
											 <span><button class="order_btn return">
												<a href="./orderDelete.do?ordNo=<%=order.get("ORD_NO")%>">반품</a>
											</button></span>
									</div>
								</div>
								<hr>

								<%
									hasOrder = true; // 주문 목록이 존재함을 표시
								}

								// 주문 목록이 없는 경우 "주문한 목록이 없습니다." 메시지 출력
								if (!hasOrder) {
								%>
								<div class="date">
									<p>주문한 목록이 없습니다.</p>
								</div>
								<%
									}

								} else {
								%>
								<div class="date">
									<p>주문한 목록이 없습니다.</p>
								</div>
								<%
									}
								%>







							</div>


						</div>
					</div>

					<div class="col-md-6">
						<p class="mypage_txt">위시리스트</p>
						<div class="card mb-4 shadow-sm">
							<div class="card-body order_scroll">


								<!-- 주문 검색 결과 출력 -->
								<%
									if (wish != null && wish.size() > 0) {

									for (int i = 0; i < wish.size(); i++) {
										HashMap<String, Object> wishlist = wish.get(i);
								%>

								<div class="order_area">
									<div class="order_img">
										<img src="./images/<%=wishlist.get("PROD_IMAGE")%>"
											alt="주문목록이미지">
									</div>
									<div class="order_name">
										<p><%=wishlist.get("PROD_NAME")%></p>
										<p><%=wishlist.get("PROD_PRICE")%></p>
									</div>
									<div>
										<span><button class="order_btn wishdel">
												<a
													href="./wishlistDlt.do?pcode=<%=wishlist.get("PROD_CODE")%>">삭제</a>
											</button></span>
									</div>
								</div>
								<hr>



								<%
									}
								%>

								<%
									} else {
								%>
								<div class="date">
									<p>위시리스트 목록이 없습니다.</p>
								</div>

								<%
									}
								%>


							</div>
						</div>
					</div>
					<div class="col-md-6">
						<p class="mypage_txt">신고하기</p>
						<div class="card mb-4 shadow-sm">
							<div class="card-body">
								<a href="./decare.jsp" class="sos">신고하기</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>



	<!-- footer -->
	<%@include file="./footer.jsp"%>

	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="../assets/js/vendor/jquery.slim.min.js"><\/script>');

		$('.return').on('click', function() {
			alert("반품하시겠습니까?");
		});
		
		$('.wishdel').on('click',function(){
			alert("위시리스트를 삭제하시겠습니까?");
		});
	</script>
	<script src="../assets/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/write.js"></script>
	<script src="js/mobileSearch.js"></script>
	<script src="js/bannerSlider.js"></script>



</body>
</html>