<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고하기</title>


<link rel="canonical"
	href="https://getbootstrap.com/docs/4.6/examples/checkout/">



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

.upate_wrap {
	border: 1px solid #d8dbdd;
	border-radius: 5px;
	padding: 40px;
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


	<div class="container">
		<div class="py-5 text-center"></div>

		<div class="row upate_wrap">
			<div class="col-md-8 order-md-1">
				<div class="drop_area">
					<h3 class="mb-3"
						style="font-weight: 600; margin-bottom: 45px !important;">회원
						신고하기</h3>
				</div>
				
				
				<form class="needs-validation" novalidate
				action="./decareUpdate.do" method="post">


					<div class="mb-3">
						<label for="username">신고할 아이디</label>
						<div class="input-group">
							<input type="text" class="form-control" id="username"
								placeholder="Username" name="decareId" required>
						</div>
					</div>



					<div class="mb-3">
						<label for="username">신고할 내용</label>
						<div class="input-group">
							<textarea
								style="width: 100%; border: 1px solid #ced4da; height: 100px;"></textarea>
						</div>
					</div>

					<input class="btn btn-primary btn-lg btn-block" type="submit" value="신고하기">
				</form>
			
			
			</div>
		</div>
	</div>




	<!-- footer -->
	<%@include file="./footer.jsp"%>

</body>
</html>