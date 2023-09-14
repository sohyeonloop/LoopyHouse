<%@page import="shop.service.WishlistServiceImpl"%>
<%@page import="shop.service.IWishlistService"%>
<%@page import="shop.vo.WishListVO"%>
<%@page import="java.util.List"%>
<%@page import="shop.dao.IProductDao"%>
<%@page import="shop.vo.ProductVO"%>
<%@page import="shop.dao.ProductDaoImpl"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	IProductDao prodDao = ProductDaoImpl.getInstance();
IWishlistService wishService = WishlistServiceImpl.getInstance();
ArrayList<ProductVO> listP = null;
if (request.getParameter("check") == null || request.getParameter("check").equals("")) {
	listP = (ArrayList<ProductVO>) prodDao.selectCateProd("K001");
} else if (request.getParameter("check").equals("total")) {
	listP = (ArrayList<ProductVO>) prodDao.selectCateProd("K001");
} else if (request.getParameter("check").equals("sale")) {
	listP = (ArrayList<ProductVO>) prodDao.selectSaleProd("K001");
} else if (request.getParameter("check").equals("wish")) {
	listP = (ArrayList<ProductVO>) prodDao.selectWishProd("K001");
}
List<WishListVO> custWish = new ArrayList<WishListVO>();

if (session.getAttribute("custId") != null && !session.getAttribute("custId").equals("")) {
	WishListVO wv = new WishListVO();
	wv.setCustId((String) session.getAttribute("custId"));
	custWish = wishService.selectCustWish(wv);
}
%>
<html lang="en">
<head>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 목록</title>
<style>
.img {
	width: 200px;
	height: 200px;
}

.container {
	display: flex;
}

i {
	/* 	font-size: 28px; */
	margin-left: 25px;
}

.hidP {
	display: none;
}

.col-md-4 {
	margin-bottom: 30px;
}

.col-md-4 img {
	border-radius: 3px;
}

.wish {
	font-size: 25px;
}

.col-md-4 h4 {
	margin-top: 11px;
}

#prodC {
	background: #3f4c56;
	border: 0;
	margin-right: -21px;
	margin-bottom: 9px;
}

.btn-group {
	display: flex;
	justify-content: end;
	margin-right: 318px;
}

.jumbotron {
	padding: 5.8rem 2rem 1.25rem;
}

.dropdown-item {
	cursor: pointer;
}

.dropdown-item:focus, .dropdown-item:hover {
	background-color: #eff7ff;
	width: 70%;
}

.dropdown-toggle {
	background: white;
	color: #6a6a6a;
	border: 1px solid #a9a9a9;
	font-weight: 500;
}

.btn-secondary:hover {
	color: #fff;
	background-color: #4fb5e1;
	border-color: #b1b1b1;
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
	<div class="jumbotron">
		<div class="container">
			<h1 class="display=3"></h1>
		</div>

		<div class="btn-group">
			<button type="button" class="btn btn-secondary dropdown-toggle"
				data-bs-toggle="dropdown" aria-expanded="false">전체</button>
			<ul class="dropdown-menu">
				<li class="total-prod"><a class="dropdown-item "
					href="${pageContext.request.contextPath}/kitchen.jsp?check=total">전체</a></li>
				<li><hr class="dropdown-divider"></li>
				<li class="sale-prod"><a class="dropdown-item"
					href="${pageContext.request.contextPath}/kitchen.jsp?check=sale">판매순</a></li>
				<li><hr class="dropdown-divider"></li>
				<li class="sale-prod"><a class="dropdown-item"
					href="${pageContext.request.contextPath}/kitchen.jsp?check=wish">위시리스트순</a></li>
			</ul>
		</div>

	</div>

	<div class=container>
		<div class="row" align="center">

			<%
				for (int i = 0; i < listP.size(); i++) {
				boolean wishCheck = false;
				ProductVO pv = listP.get(i);
			%>

			<div class="col-md-4">
				<img src="./images/<%=pv.getProdImage()%>" class="img">
				<!-- 상품이미지 경로! -->
				<h4><%=pv.getProdName()%></h4>
				<p><%=pv.getProdPrice()%>원
				</p>
				<a href="./productDetail.do?prodCode=<%=pv.getProdCode()%>"
					class="btn btn-secondary" id="prodC" role="button">상세 정보&raquo;</a>
				<%
					for (WishListVO wish : custWish) {
					if (pv.getProdCode().equals(wish.getProdCode())) {
						wishCheck = true;
					}
				}
				%>
				<%
					if (wishCheck) {
				%>
				<i class="bi bi-heart-fill wish"></i><span><%=pv.getProdWish()%></span>
				<%
					} else if (!wishCheck) {
				%>
				<i class="bi bi-heart wish"></i><span><%=pv.getProdWish()%></span>
				<%
					}
				%>
				<p class="pcode hidP"><%=pv.getProdCode()%></p>
			</div>
			<%
				}
			%>
			<p class="custId hidP"><%=loginCust%></p>
		</div>
		<hr>
	</div>

	<%@include file="./footer.jsp"%>

	<script>
		
	<%if (loginCust != null && !loginCust.equals("")) {%>
		$('.wish').on('click', function() {
			let i = 0;
			if ($(event.target).hasClass('bi-heart-fill')) {
				i = 1;
				console.log($(this));
				console.log(i);
			}
			let p_code = $(event.target).siblings('.pcode').text();
			let custId = $('.custId').text();
			console.log(p_code);
			console.log(custId);
			if (i == 0) {
				$(this).attr('class', 'wish bi bi-heart-fill');

				$.ajax({
					type : 'get',
					url : 'wishAdd.do',
					data : {
						'custId' : custId,
						'prodCode' : p_code
					},
					//async: false,
					success : function() {
						alert("위시리스트에 추가하였습니다.");
						i++;
					},
					error : function(xhr) {
						alert("상태 : " + xhr.status);
					}
				});
			} else if (i == 1) {
				$(this).attr('class', 'wish bi bi-heart');
				$.ajax({
					type : 'get',
					url : 'wishDelete.do',
					data : {
						'custId' : custId,
						'prodCode' : p_code
					},
					//async: false,
					success : function() {
						alert("위시리스트를 삭제하였습니다..");
						i--;
					},
					error : function(xhr) {
						alert("상태 : " + xhr.status);
					}
				});
			}
			console.log(i);
		});
	<%} else {%>
		$('.wish').on('click', function() {
			alert("회원 로그인을 해주세요.");
		});
	<%}%>
		
	</script>
</body>
</html>