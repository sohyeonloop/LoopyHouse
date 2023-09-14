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
<link href="./css/bootstrap.min.css" rel="+

stylesheet">
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

.dropdown-item:focus, .dropdown-item:hover {
	color: #16181b;
	text-decoration: none;
	background-color: #e9ecef;
	cursor: pointer;
	width: 112px;
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
		<div class="container py-4">

			<p class="hidP pcode"><%=pv.getProdCode()%></p>
			<p class="hidP custId"><%=loginCust%></p>
			<div class="row align-items-md-stretch">
				<div class="col-md-6">

					<%
						if (pv != null) {
					%>
					<img src="./images/<%=pv.getProdImage()%>" class="detailImg">
					<%
						}
					%>

				</div>

				<div class="col-md-6">
					<div class="h-100 p-5 bg-light border rounded-3">
						<h2 class="pname"><%=pv.getProdName()%></h2>
						<hr>
						<br> <br>

						<p class="right-sort prodPrice"><%=pv.getProdPrice()%>원
						</p>

						<!-- Example single danger button -->
						<div class="btn-group">
							<button type="button" class="btn btn-info dropdown-toggle"
								data-bs-toggle="dropdown" aria-expanded="false" id="choice">색상
								선택</button>
							<!-- 상품 색상  -->
							<ul class="dropdown-menu">
								<%
									if (pv.getProdColor() != null) {
									String pcolor = pv.getProdColor();
									List<String> pList = new ArrayList<String>();

									String[] splitCor = pcolor.split(",");
									for (int i = 0; i < splitCor.length; i++) {
										pList.add(splitCor[i]);
									}

									for (String s : pList) {
								%>
								<li class="pColor"><a class="dropdown-item choiceProd"><%=s%></a></li>

								<%
									}
								} else {
								%>
								<li><a class="dropdown-item disabled">단일 색상</a></li>
								<%
									}
								%>
							</ul>
						</div>


						<input type="number" id="quantity" min="1">
						<!-- <input type="text" class="quantity qty" placeholder="수량선택" value="1"
							readonly> 
						<span>
							<button class="plus_btn choiceProd" >+</button>
							<button class="minus_btn choiceProd">-</button>
						</span> -->


						<!-- 주문상세내역 view -->
						<div class="detail_veiw">
							<%
								if (pv.getProdColor() == null) {
							%>
							<p>색상 : X</p>
							<%
								} else {
							%>
							<p>
								색상 : <span id="outputC"> </span>
							</p>
							<%
								}
							%>


							<p>
								수량 : <span id="outputQ"> </span>
							</p>

						</div>



						<div class="container-fluid py-5">
							<button type="button" class="btn btn-outline-info"
								onclick="location.href='./review.do?prodCode=<%=pv.getProdCode()%>&prodName=<%=pv.getProdName()%>'">리뷰보기</button>
							<%
								if (loginCust != null && !loginCust.equals("")) {
								// 회원만  장바구니 버튼 보인다.
							%>
							<button class="btn btn-outline-secondary" type="button"
								id="cartGo">장바구니 담기</button>
							<%
								} else {
							// 만약 비회원 로그인이면 로그인하러가기 버튼이 보인다.
							%>
							<button class="btn btn-outline-secondary" type="button"
								onclick="location.href='./login.html'">로그인하러 가기</button>
							<%
								}
							%>

						</div>




					</div>
				</div>
			</div>
			<br>
			<hr>
			<br>
			<div class="p-5 mb-4 bg-light rounded-3">
				<h3>상세사진</h3>
				<hr>
				<%
					if (pv != null) {
				%>
				<img src="./images/<%=pv.getDetailImage()%>" class="detailImg">
				<%
					}
				%>
			</div>



			<div class="pb-3 mb-4 border-bottom"></div>



		</div>
		<%@include file="./footer.jsp"%>
	</main>

	<script>
		//수량버튼 조작
		let quantity = $('.quantity').val();

		$('.plus_btn').on('click', function() {
			$('.quantity').val(++quantity);
		});

		$('.minus_btn').on('click', function() {
			if (quantity > 1) {
				$('.quantity').val(--quantity);
			} else {
				alert("수량은 최소 한개 이상 선택해주세요.");
			}
		});

		//선택한 옵션 출력하기
		$('.choiceProd').on('click', function() {
			console.log('clickdata: ', $(this).text());

			let pcolorVal = $(this).text();
			//	let pcolorVal = $(event.target).siblings('.pColor').text();
			console.log(pcolorVal);
			$('#outputC').text(pcolorVal);
		});

		$('#quantity').on('click', function() {

			// 			let qtyVal = $('.qty').val();
			let qtyVal = $('#quantity').val();
			$('#outputQ').text(qtyVal);

		});

		$('#cartGo').on(
				'click',
				function() {
					//alert("장바구니에 담으시겠습니까?");
					//선택한 상품들 value값 저장
					let p_color = $('#outputC').text();
					let p_qty = $('#outputQ').text();
					let p_code = $('.pcode').text();
					let p_name = $(event.target).parent().siblings('.pname')
							.text();
					let p_price = $(event.target).parent().siblings(
							'.prodPrice').text().trim();
					let custId = $('.custId').text();
					console.log(p_color);
					console.log(p_qty);
					console.log(p_code);
					console.log(p_name);
					console.log(p_price);
					console.log(custId);

					$.ajax({
						url : 'cartAdd.do',
						type : 'post',
						data : {
							'prodCode' : p_code,
							'custId' : custId,
							'prodName' : p_name,
							'itemColor' : p_color,
							'itemQua' : p_qty,
							'ordPrice' : p_price
						},
						success : function(result) {
							console.log("<<<", result);
							//if(result==1){
							if (confirm('장바구니에 추가되었습니다. 장바구니로 이동할까요?')) {
								window.location.href = "./shopCart.do";
							} else {
								window.location.href = "./furniture.jsp";
							}

							//}
						},
						error : function(xhr) {
							alert(xhr.status);
						}
					});

				});
	</script>

</body>
</html>
