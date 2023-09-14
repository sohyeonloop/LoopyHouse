<%@page import="comm.vo.FreeBoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
.pager {
	float: left;
}

#pageArea {
	display: flex;
	justify-content: center;
}

#writeArea {
	color: blue;
}

#wirteArea {
	display: flex;
	justify-content: flex-end;
}
</style>
</head>
<body>
	<div class="col-sm-8 text-left">
		<!--글쓰기 영역 -->
		<div id="writeArea">
			<h3>인기게시물</h3>
		</div><br>

		<!--리스트 출력 영역 -->
		<%
		List<FreeBoardVO> list = (List<FreeBoardVO>) request.getAttribute("list");
		%>
		<div id="listArea">
			<table class="table table-hover">
				<tbody>
					<!-- for start -->
					<%
					for (int i = 0; i < 5; i++) {
					%>
					<tr>
						<td><a href=""><%=list.get(i).getFreeTitle()%></a></td>
						<td>조회수 <%=list.get(i).getFreeViews()%></td>   
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
		</div>
	</div>
</body>
</html>