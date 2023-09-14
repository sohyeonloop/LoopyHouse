<%@page import="comm.vo.NoticeVO"%>
<%@page import="shop.vo.ProductVO"%>
<%@page import="comm.vo.BlackListVO"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@page import="user.vo.CustomerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	CustomerVO cv = new CustomerVO();
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
<title>오늘의집 관리자페이지</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/4.6/examples/album/">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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
	font-size: 1.4em;
	font-weight: 700;
}

p {
	margin-bottom: 3px !important;
}

#searchDiv {
	display: flex;
}

.row {
	display: block;
}

.admin_btn {
	cursor: pointer;
	text-decoration: none;
	background: #007bff;
	color: white;
	padding: 7px 10px;
	border-radius: 3px;
}

.admin_btn:hover {
	color: white;
	text-decoration: none;
}

.board_wrap {
	display: flex;
	justify-content: space-between;
	margin-bottom: 9px;
}

.admin_list {
	padding: 30px;
}

.black_btn {
	padding: 5px 8px!important;
	font-size: 15px!important;
	background:black;
	border:0;
}

.d-inline-block{
font-size: 17px;
margin-bottom: 12px!important;
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
	List<CustomerVO> decCustList = (List<CustomerVO>) request.getAttribute("decCust");
	List<BlackListVO> blackList = (List<BlackListVO>) request.getAttribute("blackList");
	List<ProductVO> furnitureList = (List<ProductVO>) request.getAttribute("furniture");
	List<ProductVO> digitalList = (List<ProductVO>) request.getAttribute("digital");
	List<ProductVO> decoList = (List<ProductVO>) request.getAttribute("deco");
	List<ProductVO> lightList = (List<ProductVO>) request.getAttribute("light");
	List<ProductVO> dailyList = (List<ProductVO>) request.getAttribute("daily");
	List<ProductVO> kitchenList = (List<ProductVO>) request.getAttribute("kitchen");
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

					<div class="col-md-12">
						<p class="mypage_txt">회원관리</p>
						<div class="input-group mb-3" id="searchDiv">
							<span class="input-group-text">@</span>
							<div class="form-floating">
								<input type="text" class="form-control" id="custId"
									placeholder="고객ID를 입력하세요."> <label
									for="floatingInputGroup1"></label>
								<button type="button" class="btn btn-primary btn-sm"
									id="searchBtn">검색</button>
							</div>
						</div>


						<div class="card mb-4 shadow-sm" id="custInfo">

							<div class="card-body"></div>
						</div>
					</div>

					<div class="col-md-12">
						<p class="mypage_txt">블랙리스트 관리</p>
						<div class="card mb-4 shadow-sm admin_list">

							<strong class="d-inline-block mb-1 text-primary">신고 누적회원</strong>
							<div class="table-responsive">
								<table class="table table-striped table-sm">
									<thead>
										<tr>
											<th>아이디</th>
											<th>닉네임</th>
											<th>이름</th>
											<th>사유</th>
											<th>신고횟수</th>
											<th>블랙리스트</th>
										</tr>
									</thead>
									<tbody>
										<%
											for (CustomerVO decCust : decCustList) {
										%>
										<tr>
											<td><%=decCust.getCustId()%></td>
											<td><%=decCust.getCustNickName()%></td>
											<td><%=decCust.getCustName()%></td>
											<td>욕설</td>
											<td><%=decCust.getCustDecNum()%></td>
											<td>
												<form action="${pageContext.request.contextPath}/admin.do"
													method="post">
													<input type="hidden" name="decCust"
														value='<%=new Gson().toJson(decCust)%>'>
													<button class="btn btn-primary black_btn" type="submit">블랙리스트</button>
												</form>
											</td>
										</tr>
										<%
											}
										%>
									</tbody>
								</table>
							</div>
							<strong class="d-inline-block mb-1 text-primary">블랙리스트
								회원</strong>
							<div class="table-responsive">
								<table class="table table-striped table-sm">
									<thead>
										<tr>
											<th>번호</th>
											<th>회원아이디</th>
											<th>관리자아이디</th>
											<th>사유</th>
											<th>일시</th>
										</tr>
									</thead>
									<tbody>
										<%
											for (BlackListVO bList : blackList) {
										%>
										<tr>
											<td><%=bList.getbListNo()%></td>
											<td><%=bList.getCustId()%></td>
											<td><%=bList.getMngId()%></td>
											<td><%=bList.getbListReason()%></td>
											<td><%=bList.getbListDate()%></td>
										</tr>
										<%
											}
										%>
									</tbody>
								</table>
							</div>
						</div>
					</div>


					<div class="col-md-12">
						<div class="board_wrap">
							<p class="mypage_txt">상품관리</p>
							<a href="./productRegist.jsp" class="admin_btn">상품추가</a>
						</div>


						<div class="card mb-4 shadow-sm admin_list">

							<strong class="d-inline-block mb-1 text-primary">가구</strong>
							<div class="table-responsive">
								<table class="table table-striped table-sm">
									<thead>
										<tr>
											<th>상품 코드</th>
											<th>상품 이름</th>
											<th>상품 가격</th>
											<th>상품 색상</th>
											<th>위시리스트 수</th>

										</tr>
									</thead>
									<tbody>
										<%
											for (ProductVO furniture : furnitureList) {
										%>
										<tr>
											<td><%=furniture.getProdCode()%></td>
											<td><%=furniture.getProdName()%></td>
											<td><%=furniture.getProdPrice()%></td>
											<td><%=furniture.getProdColor()%></td>
											<td><%=furniture.getProdWish()%></td>

										</tr>
										<%
											}
										%>
									</tbody>
								</table>
							</div>
							<strong class="d-inline-block mb-1 text-primary">가전·디지털</strong>
							<div class="table-responsive">
								<table class="table table-striped table-sm">
									<thead>
										<tr>
											<th>상품 코드</th>
											<th>상품 이름</th>
											<th>상품 가격</th>
											<th>상품 색상</th>
											<th>위시리스트 수</th>

										</tr>
									</thead>
									<tbody>
										<%
											for (ProductVO digital : digitalList) {
										%>
										<tr>
											<td><%=digital.getProdCode()%></td>
											<td><%=digital.getProdName()%></td>
											<td><%=digital.getProdPrice()%></td>
											<td><%=digital.getProdColor()%></td>
											<td><%=digital.getProdWish()%></td>

										</tr>
										<%
											}
										%>
									</tbody>
								</table>
							</div>
							<strong class="d-inline-block mb-1 text-primary">데코</strong>
							<div class="table-responsive">
								<table class="table table-striped table-sm">
									<thead>
										<tr>
											<th>상품 코드</th>
											<th>상품 이름</th>
											<th>상품 가격</th>
											<th>상품 색상</th>
											<th>위시리스트 수</th>

										</tr>
									</thead>
									<tbody>
										<%
											for (ProductVO deco : decoList) {
										%>
										<tr>
											<td><%=deco.getProdCode()%></td>
											<td><%=deco.getProdName()%></td>
											<td><%=deco.getProdPrice()%></td>
											<td><%=deco.getProdColor()%></td>
											<td><%=deco.getProdWish()%></td>

										</tr>
										<%
											}
										%>
									</tbody>
								</table>
							</div>
							<strong class="d-inline-block mb-1 text-primary">조명</strong>
							<div class="table-responsive">
								<table class="table table-striped table-sm">
									<thead>
										<tr>
											<th>상품 코드</th>
											<th>상품 이름</th>
											<th>상품 가격</th>
											<th>상품 색상</th>
											<th>위시리스트 수</th>

										</tr>
									</thead>
									<tbody>
										<%
											for (ProductVO light : lightList) {
										%>
										<tr>
											<td><%=light.getProdCode()%></td>
											<td><%=light.getProdName()%></td>
											<td><%=light.getProdPrice()%></td>
											<td><%=light.getProdColor()%></td>
											<td><%=light.getProdWish()%></td>

										</tr>
										<%
											}
										%>
									</tbody>
								</table>
							</div>
							<strong class="d-inline-block mb-1 text-primary">생활용품</strong>
							<div class="table-responsive">
								<table class="table table-striped table-sm">
									<thead>
										<tr>
											<th>상품 코드</th>
											<th>상품 이름</th>
											<th>상품 가격</th>
											<th>상품 색상</th>
											<th>위시리스트 수</th>

										</tr>
									</thead>
									<tbody>
										<%
											for (ProductVO daily : dailyList) {
										%>
										<tr>
											<td><%=daily.getProdCode()%></td>
											<td><%=daily.getProdName()%></td>
											<td><%=daily.getProdPrice()%></td>
											<td><%=daily.getProdColor()%></td>
											<td><%=daily.getProdWish()%></td>

										</tr>
										<%
											}
										%>
									</tbody>
								</table>
							</div>
							<strong class="d-inline-block mb-1 text-primary">주방용품</strong>
							<div class="table-responsive">
								<table class="table table-striped table-sm">
									<thead>
										<tr>
											<th>상품 코드</th>
											<th>상품 이름</th>
											<th>상품 가격</th>
											<th>상품 색상</th>
											<th>위시리스트 수</th>

										</tr>
									</thead>
									<tbody>
										<%
											for (ProductVO kitchen : kitchenList) {
										%>
										<tr>
											<td><%=kitchen.getProdCode()%></td>
											<td><%=kitchen.getProdName()%></td>
											<td><%=kitchen.getProdPrice()%></td>
											<td><%=kitchen.getProdColor()%></td>
											<td><%=kitchen.getProdWish()%></td>

										</tr>
										<%
											}
										%>
									</tbody>
								</table>
							</div>

						</div>
					</div>
				</div>







				<%
					List<NoticeVO> notice = (List<NoticeVO>) request.getAttribute("notice");
				%>
				<!-- 			<div class="col-md-12"> -->

				<div class="board_wrap">
					<p class="mypage_txt">게시판관리</p>
					<a href="./write.jsp" class="admin_btn">공지작성</a>
				</div>

				<div class="card mb-4 shadow-sm">

					<div class="card-body">
						<p class="card-text"></p>
						<div class="d-flex justify-content-between align-items-center">
							<div class="table-responsive">
								<table class="table table-striped table-sm">
									<thead>
										<tr>
											<th>공지번호</th>
											<th>공지제목</th>
											<th>작성자</th>
											<th>작성일</th>
											<th>조회수</th>

										</tr>
									</thead>
									<tbody>
										<%
											for (NoticeVO n : notice) {
										%>
										<tr>
											<td><%=n.getNoticeNo()%></td>
											<td><%=n.getNoticeTitle()%></td>
											<td><%=n.getMngId()%></td>
											<td><%=n.getNoticeDate()%></td>
											<td><%=n.getNoticeViews()%></td>

										</tr>
										<%
											}
										%>
									</tbody>
								</table>
							</div>


						</div>
					</div>
				</div>





			</div>



		</div>



		</div>
		</div>
		</div>

	</main>


	<!-- footer -->
	<%@include file="./footer.jsp"%>

	<!-- 	<script -->
	<!-- 		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" -->
	<!-- 		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" -->
	<!-- 		crossorigin="anonymous"> -->
	<!-- 	</script> -->

	<!-- 		window.jQuery -->
	<!-- 				|| document -->
	<!-- 						.write('<script src="../assets/js/vendor/jquery.slim.min.js"><\/script>'); -->
	<script>
		$('#searchBtn')
				.on(
						'click',
						function() {

							let idVal = $('#custId').val();
							if (idVal.trim().length == 0)
								return;

							$
									.ajax({
										url : 'userDetail.do',
										type : 'post',
										data : {
											'custId' : idVal
										},
										success : function(data) {

											var data = JSON.parse(data);
											var $table = $('<table class="table table-striped table-sm">');
											var $thead = $('<thead>');
											var $tr = $('<tr>'); // 테이블의 행 요소 생성
											$tr.append($('<th>').text('아이디'));
											$tr.append($('<th>').text('이름'));
											$tr.append($('<th>').text('닉네임'));
											$tr.append($('<th>').text('비밀번호'));
											$tr.append($('<th>').text('핸드폰번호'));
											$tr.append($('<th>').text('성별'));
											$tr.append($('<th>').text('이메일'));
											$tr.append($('<th>').text('주소'));
											$tr.append($('<th>').text('신고횟수'));
											$thead.append($tr);
											var $tbody = $('<tbody>');
											var $tr2 = $('<tr>');
											$tr2.append($('<td>').text(
													data['custId']));
											$tr2.append($('<td>').text(
													data['custName']));
											$tr2.append($('<td>').text(
													data['custNickName']));
											$tr2.append($('<td>').text(
													data['custPwd']));
											$tr2.append($('<td>').text(
													data['custTel']));
											$tr2.append($('<td>').text(
													data['custGender']));
											$tr2.append($('<td>').text(
													data['custMail']));
											$tr2.append($('<td>').text(
													data['custAddr']));
											$tr2.append($('<td>').text(
													data['custDecNum']));
											$tbody.append($tr2);
											$table.append($thead);
											$table.append($tbody);
											$('#custInfo').html($table);

										},
										error : function(xhr) {
											alert("상태>>" + xhr.status);
										}

									//	dataType : 'JSON'
									});
						});

		// 버튼 클릭 시 이벤트 핸들러
		document
				.getElementById("noticeBtn")
				.addEventListener(
						"click",
						function() {
							// 다른 주소로 이동
							window.location.href = "${pageContext.request.contextPath}/comm/notice.do";
						});
	</script>
	<script src="../assets/dist/js/bootstrap.bundle.min.js"></script>



</body>
</html>