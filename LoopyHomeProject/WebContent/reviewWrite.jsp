<%@page import="java.util.List"%>
<%@page import="shop.vo.ItemVO"%>
<%@page import="shop.vo.OrderVO"%>
<%@page import="shop.vo.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ProductVO pv = (ProductVO) request.getAttribute("pv");
	String prodCode = (String)request.getAttribute("prodCode");
	String ordNo = (String)request.getAttribute("ordNo");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>리뷰 작성</title>
<!-- include libraries(jQuery, bootstrap) -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- include summernote css/js-->
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<style>
table.table2 {
	border-collapse: separate;
	border-spacing: 1px;
	text-align: left;
	line-height: 1.5;
	border-top: 1px solid #ccc;
	margin: 20px 10px;
	display: flex; //
}

table.table2 tr {
	width: 50px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}

table.table2 td {
	width: 100px;
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}

#note {
	display: flex;
	justify-content: center;
}

#btn {
	width: 900px;
	height: 40px;
	text-align: center;
	background-color: #ccc;
	font-color: white;
}

.pdImg{
	width:250px;
	
}
.loacName{
	text-align:right;
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
	<div id="note">
		<form method="post" action="./insertReview.do">

			<input type="hidden" name="userId" value=<%=loginCust%>>
			<table style="padding-top: 50px" align=center border=0 cellpadding=2>
				<tr>
					<td bgcolor=white>
						<table class="table2">
							<div class="row align-items-md-stretch">
								<div class="col-md-6">
									<div class="h-100 p-5 text-bg-dark rounded-3">
										<img src="./images/<%=pv.getProdImage()%>" class="pdImg">
										<input type="hidden" name="ordNo" value=<%=ordNo%>>
										<input type="hidden" name="prodCode" value=<%=prodCode%>>
									</div>
								</div>
								<div class="col-md-6">
									<div class="h-100 p-5 bg-light border rounded-3 loacName">
										<h3>상품명 : <%=pv.getProdName()%></h3>
									</div>
								</div>
							</div>

						</table>
						
					</td>
				</tr>
			</table>
			<hr>
			<textarea id="summernote" name="content"></textarea>
			<input id="btn" type="submit" value="글쓰기"></input>
		</form>
	</div>

	<!-- footer -->
	<%@include file="./footer.jsp"%>
	<script>
		// 메인화면 페이지 로드 함수
		$(document).ready(function() {
			init();
		});

		var init = function() {
			$('#summernote').summernote({
				height : 700,
				focus : true,
				callbacks : {
					onImageUpload : function(files) {
						for (let i = 0; i < files.length; i++) {
							sendFile(files[i]);
						}
					}
				}
			});
		};

		function sendFile(file) {
			let filedata = new FormData();
			filedata.append("file", file);
			console.log(filedata.get("file"));
			$.ajax({
				url : './upload.do',
				type : "post",
				data : filedata,
				contentType : false,
				processData : false,
				success : function(url) {
					console.log(url);
					$('#summernote').summernote("insertImage", url);
				},
				error : function(xhr) {
					console.log(xhr.status);
				}
			})
		};
	</script>
</body>
</html>
