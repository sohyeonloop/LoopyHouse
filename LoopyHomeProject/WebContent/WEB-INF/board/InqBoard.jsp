<%@page import="com.google.gson.Gson"%>
<%@page import="comm.vo.InqBoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.pager {
	float: left;
}

#pageArea {
	display: flex;
	justify-content: center;
}

#wirteArea {
	display: flex;
	justify-content: flex-end;
}

#listArea h2 {
	color: #040452;
}

.board_area {
	display: flex;
	flex-direction: column;
	max-width: 1136px;
	margin: 0 auto;
}

.btn-xs {
	padding: 6px 12px;
	border-radius: 3px;
	border: 0;
}

#pageArea ul {
	margin-right: 20px;
	margin-top: 40px;
}

.previous a {
	cursor: pointer;
}

.next a {
	cursor: pointer;
}

.table td, .table th {
	cursor: pointer;
}
</style>

<!-- <link rel="stylesheet" -->
<!-- 	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

</head>
<body>

	<% 
   String loginCust = (String)session.getAttribute("custId");
   String loginAdmin = (String)session.getAttribute("mngId");
   %>


	<div class="board_area">


		<div class="col-sm-12 text-center">

			<!--리스트 출력 영역 -->
			<%
				List<InqBoardVO> list = (List<InqBoardVO>) request.getAttribute("list");
			%>
			<div id="listArea">
				<h2>문의 게시판</h2>
				<table style="margin-top: 20px;" class="table table-hover">
					<thead>
						<tr>
							<th>문의번호</th>
							<th>문의제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<!-- for start -->
						<%
							for (InqBoardVO board : list) {
						%>
						<tr data-board='<%=new Gson().toJson(board)%>'>
							<td><%=board.getInqNo()%></td>
							<td><%=board.getInqTitle()%></td>
							<td><%=board.getCustId()%></td>
							<td><%=board.getInqDate()%></td>
							<td><%=board.getInqViews()%></td>
						</tr>

						<%
							} //for end
						%>
						<!-- for end -->
					</tbody>
				</table>
			</div>


			<!--페이지 영역 -->
			<div id="pageArea">


				<ul class="pager">
					<% if((int) request.getAttribute("cPage") > 1) {%>
					<li><a
						href="${pageContext.request.contextPath}/comm/inquery.do?page=<%=((int) request.getAttribute("cPage")) -1 %>">이전</a></li>
					<%} else if((int) request.getAttribute("cPage") == 1) {  %>
					<li><a
						href="${pageContext.request.contextPath}/comm/inquery.do">이전</a></li>
					<%} %>
				</ul>

				<ul class="pagination pager">
					<!-- for start -->

					<%
						int sPage = (int) request.getAttribute("sPage");
					int ePage = (int) request.getAttribute("ePage");
					int cPage = (int) request.getAttribute("cPage");

					for (int i = sPage; i <= ePage; i++) {

						//현재페이지에만 활성화(active) 적용하기 
						if (cPage == i) {
					%>
					<li class="active"><a href="#"><%=i%></a></li>
					<%
						} else {
					%>
					<li><a href="#"><%=i%></a></li>
					<%
						} //if else end
					} //for end
					%>
				</ul>


				<ul class="pager">
					<% if((int) request.getAttribute("ePage") > 1) {%>
					<li><a href="${pageContext.request.contextPath}/comm/inquery.do?page=<%=((int) request.getAttribute("cPage")) +1 %>">다음</a></li>
					<%} else if((int) request.getAttribute("ePage") == 1) {  %>
					<li><a href="${pageContext.request.contextPath}/comm/inquery.do">다음</a></li>
					<%} %>
				</ul>


			</div>

			<!--글쓰기 영역 -->
			<%if(session.getAttribute("custId") != null && !session.getAttribute("custId").equals("")){ %>

			<div id="writeArea">
				<input type="button" value="글 작성" class="btn-xs btn-primary"
					onclick="location.href='${pageContext.request.contextPath}/write.jsp'"
					style="float: right;">
			</div>
			<% } %>

		</div>




		<footer class="footer"> </footer>




	</div>





	<script>
		//페이지 번호 클릭 이벤트
		$('.pagination li').on(
				'click',
				function() {
					//alert($(this).text());
					//Main서블릿으로 페이지정보 전달
					location.href = "/LoopyHomeProject/comm/inquery.do?page="
							+ $(this).text();
				});

		//next버튼 클릭 이벤트
		$('.next')
				.on(
						'click',
						function() {
							let currentPage = parseInt($('.pagination')
									.children().last().text()) + 1;

							//계산된 currentPage값이 totalPage의 값보다 클 경우 서블릿으로 페이지 정보 넘기지 않음 
							if (currentPage >
	<%=request.getAttribute("tPage")%>
		)
								return;
							location.href = "${pageContext.request.contextPath}/comm/inquery.do?page="
									+ currentPage;
						});

		//previous버튼 클릭 이벤트
		$('.previous')
				.on(
						'click',
						function() {
							let currentPage = parseInt($('.pagination')
									.children().first().text()) - 1;

							//계산된 currentPage값이 totalPage의 값보다 클 경우 서블릿으로 페이지 정보 넘기지 않음 
							if (currentPage < 1)
								return;
							location.href = "${pageContext.request.contextPath}/comm/inquery.do?page="
									+ currentPage;
						});

		$('tbody tr')
				.on(
						'click',
						function() {

							var board = $(this).data('board');
							window.location.href = "${pageContext.request.contextPath}/boardDetail.do?board="
									+ encodeURIComponent(JSON.stringify(board));
						});
	</script>

</body>
</html>