<%@page import="comm.vo.InqBoardVO"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="comm.vo.FreeBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>board_Modify</title>
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
	width:100%;
}

table.table2 tr {
	width: 50px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}

table.table2 td {
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
</style>
</head>
<body>
	
	
	<%
	String boardStr = request.getParameter("board");
	String content = "";
	String title = "";
	if (boardStr.contains("\"freeNo\"")) {
		FreeBoardVO board = new Gson().fromJson(boardStr, FreeBoardVO.class);
		content = board.getFreeContent();
		title = board.getFreeTitle();
	} else if(boardStr.contains("\"inqNo\"")){
		InqBoardVO board = new Gson().fromJson(boardStr, InqBoardVO.class);
		content = board.getInqContent();
		title = board.getInqTitle();
	} 
// 	System.out.println(title+"타이틀 확인");
// 	System.out.println(content+"내용 확인");
	
	%>
	
	<div id="note">
		<form method="post" action="${pageContext.request.contextPath}/boardUpdate.do">
			<input type="hidden" name="custId"
				value=<%=session.getAttribute("custId")%>>
			<input type="hidden" name="board" value='<%=boardStr%>'>	
			<table style="width: 100%;padding-top: 50px" align=center border=0 cellpadding=2>
				<tr>
					<td bgcolor=white>
						<table class="table2">
							<tr>
								<td>분류</td>
								<td><select>
									<%if(boardStr.contains("\"freeNo\"")){ %>
										<option value="free">자유게시판</option>
									<%} else if(boardStr.contains("\"inqNo\"")){%>
										<option value="inq">문의게시판</option>
									<%} else if(boardStr.contains("\"noticeNo\"")){ %>
										<option value="not">공지게시판</option>
									<%} %>
								</select></td>
							</tr>
							<tr>
								<td>제목</td>
								<td><input style="width:100%;" type=text name="title" size=60></td>
							</tr>

						</table>

					</td>
				</tr>
			</table>
			<textarea id="summernote" name="content"></textarea>
			<input id="btn" type="submit" value="수정하기"></input>
		</form>
	</div>

	
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
