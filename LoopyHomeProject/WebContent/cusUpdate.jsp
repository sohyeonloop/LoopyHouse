<%@page import="user.vo.CustomerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	CustomerVO cv = (CustomerVO) request.getAttribute("cusInfo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.101.0">
<title>회원정보 수정</title>
<link rel="canonical"
	href="https://getbootstrap.com/docs/4.6/examples/checkout/">
<!-- Bootstrap core CSS -->
<link href="./css/bootstrap.min.css" rel="stylesheet">
</head>


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

.drop_out {
	font-size: 0.95em;
	text-decoration: underline;
	color: rgba(238, 0, 0, 0.788);
	cursor: pointer;
}

.drop_out a {
	color: rgba(238, 0, 0, 0.788);
}

.drop_area {
	display: flex;
	justify-content: space-between;
	align-items: center
}

.upate_wrap {
	border: 1px solid #d8dbdd;
	border-radius: 5px;
	padding: 40px;
}

label {
	font-weight: 600;
}
</style>


<!-- Custom styles for this template -->
<link href="form-validation.css" rel="stylesheet">
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


	<form action="./update.do" method="post" enctype="multipart/form-data">
		<div class="container">
			<div class="py-5 text-center"></div>

			<div class="row upate_wrap">
				<div class="col-md-8 order-md-1">
					<div class="drop_area">
						<h3 class="mb-3"
							style="font-weight: 600; margin-bottom: 45px !important;">회원정보
							수정</h3>
						<p class="drop_out">
							<a href="./delete.do?id=<%=cv.getCustId()%>">탈퇴하기</a>
						</p>
					</div>
					<form class="needs-validation" novalidate>


						<div class="mb-3">
							<label for="username">아이디</label>
							<div class="input-group">
								<input readonly class="form-control" name="custId"
									value="<%=cv.getCustId()%>" required>
							</div>
						</div>


						<div class="mb-3">
							<label for="username">이름</label>
							<div class="input-group">
								<input type="text" class="form-control" name="custName"
									value="<%=cv.getCustName()%>" required>
							</div>
						</div>

						<div class="mb-3">
							<label for="username">별명</label>
							<div class="input-group">
								<input type="text" class="form-control" name="custNickName"
									value="<%=cv.getCustNickName()%>" required>
							</div>
						</div>


						<div class="mb-3">
							<label for="username">휴대폰 번호</label>
							<div class="input-group">
								<input type="text" class="form-control" name="custTel"
									value="<%=cv.getCustTel()%>" required>
							</div>
						</div>


						<div class="mb-3">
							<label for="username">새 비밀번호</label>
							<div class="input-group">
								<input type="text" class="form-control" name="custPwd"
									value="<%=cv.getCustPwd()%>" required>
							</div>
							<p style="font-size: 0.85em; font-weight: 500;">비밀번호 변경시에만
								기입해 주세요.</p>
						</div>

						<div class="mb-3">
							<label for="username">새 비밀번호</label>
							<div class="input-group">
								<input type="text" class="form-control" name="custPwd2"
									value="<%=cv.getCustPwd()%>" required>
							</div>
						</div>


						<div class="mb-3">
							<label for="username">이메일</label>
							<div class="input-group">
								<input type="text" class="form-control" name="custMail"
									value="<%=cv.getCustMail()%>" required>
							</div>
						</div>



						<div class="mb-3">
							<label for="username" style="display: block;">성별</label>
							<div class="custom-control custom-radio"
								style="display: inline-block; margin-right: 10px;">
								<input id="credit" name="custGender" type="radio"
									class="custom-control-input" value="M"
									<%if (cv.getCustGender().equals("M"))%> checked <%%>> <label
									class="custom-control-label" for="credit">남성</label>
							</div>
							<div class="custom-control custom-radio"
								style="display: inline-block;">
								<input id="debit" type="radio" class="custom-control-input"
									name="custGender" value="W"
									<%if (cv.getCustGender().equals("W"))%> checked <%%>> <label
									class="custom-control-label" for="debit">여성</label>
							</div>
						</div>

						<div class="mb-3">
							<label for="username">생년월일</label>
							<div class="input-group">
								<input type="text" class="form-control" id="username" required
									name="custBirth" value="<%=cv.getCustBirth()%>">
							</div>
						</div>

						<hr class="mb-4">

						<div class="mb-3">
							<label for="username">프로필 이미지</label>
							<div class="input-group">
								<%
									
								%>

								<input type="file" name="custPhoto"
									value="<%=cv.getCustPhoto()%>">
							</div>
						</div>

						<hr class="mb-4">

						<input class="btn btn-primary btn-lg btn-block" type="submit"
							value="회원정보 수정">
					</form>
				</div>
			</div>

		</div>

	</form>

	<!-- footer -->
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
	<script src="../assets/dist/js/bootstrap.bundle.min.js"></script>


	<script src="form-validation.js"></script>
</body>

</html>