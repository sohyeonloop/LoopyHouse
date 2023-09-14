<%@page import="com.google.gson.Gson"%>
<%@page import="comm.vo.InqComtVO"%>
<%@page import="comm.vo.FreeComtVO"%>
<%@page import="java.util.List"%>
<%@page import="comm.vo.NoticeVO"%>
<%@page import="comm.vo.InqBoardVO"%>
<%@page import="comm.vo.FreeBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#container {
	width: 100%;
	display: flex;
	/* 	flex-direction: column; */
	justify-content: center;
	align-items: center;
}

#title {
	font-size: 20px;
	font-weight: 900;
	margin: 10px;
}

.brd {
	display: flex;
	justify-content: center;
	margin: 10px;
	border-bottom: 1px solid grey;
}

.brd p {
	margin: 10px;
}

.outline {
	width: 80%;
}

.btn-primary {
	width: 30px;
	height: 30px;
}

#content {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	border-bottom: 1px solid grey;
	padding: 100px;
}

p img {
	width: 700px !important;
}

.btn.btn-outline-primary {
	width: 86px;
	margin-left: 680px;
}

#end {
	display: flex;
	justify-content: flex-end;
	width: 700px;
}

#end button {
	margin: 4px;
}

#boardBtn {
	width: 100%;
	display: flex;
	justify-content: flex-end;
}

#cmtSubmit {
	display: flex;
	justify-content: flex-end;
}

.rounded-circle {
	width: 43px;
}

.flex-shrink-0 {
	border: 0!important;
}
</style>
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
</head>
<body>
	<%
		String loginCust = (String) session.getAttribute("custId");
	String loginAdmin = (String) session.getAttribute("mngId");
	String check = (String) request.getAttribute("check");
	String user = "";
	if (session.getAttribute("custId") != null && !session.getAttribute("custId").equals("")) {
		user = (String) session.getAttribute("custId");
	} else if (session.getAttribute("mngId") != null && !session.getAttribute("mngId").equals("")) {
		user = (String) session.getAttribute("mngId");
	}
	InqBoardVO board = (InqBoardVO) request.getAttribute("board");
	%>

	<div id="container">
		<div class="outline">
			<div class="brd" id="titlediv">
				<p id="title"><%=board.getInqTitle()%></p>
			</div>
			<div class="brd">
				<p>
					작성자:
					<%=board.getCustId()%></p>
				<p>
					작성일:
					<%=board.getInqDate()%></p>
			</div>
			<div id="content">
				<%=board.getInqContent()%>
				<%
					if (user.equals(board.getCustId())) {
				%>
				<div id="boardBtn">
					<form action="${pageContext.request.contextPath}/boardModify.jsp"
						method="post">
						<input type="hidden" name="board"
							value='<%=new Gson().toJson(board)%>'>
						<button class="btn btn-primary" type="submit">수정</button>
					</form>
					<form action="${pageContext.request.contextPath}/boardDelete.do"
						method="post">
						<input type="hidden" name="board"
							value='<%=new Gson().toJson(board)%>'>
						<button class="btn btn-primary" type="submit">삭제</button>
					</form>
				</div>
				<%
					}
				%>
			</div>
			<section id="comment">
				<div class="card bg-light">
					<div class="card-body">
						<!-- Comment form-->
						<%
							if (session.getAttribute("mngId") != null && !session.getAttribute("mngId").equals("")) {
						%>
						<form class="mb-4"
							action="${pageContext.request.contextPath}/comment.do"
							method='post' onsubmit="return validateForm2()">
							<div id="cmt">
								<input type="hidden" name="board"
									value='<%=new Gson().toJson(board)%>'> <input
									type="hidden" name="userId" value="<%=user%>"> <input
									type="hidden" name="check" value="<%=check%>"> <input
									type="hidden" name="boardNo" value="<%=board.getInqNo()%>">
								<textarea class="form-control" rows="3" name="cmt" id="formArea"
									laceholder="Join the discussion and leave a comment!">
								</textarea>
							</div>
							<div id="cmtSubmit">
								<button type="submit" class="btn btn-outline-primary">입력</button>
							</div>
						</form>
						<%
							}
						%>
						<%
							String comment = "";
						if (check.equals("inq") && request.getAttribute("comment") != null) {
							List<InqComtVO> commentList = (List<InqComtVO>) request.getAttribute("comment");

							for (InqComtVO cmt : commentList) {
						%>
						<div id="comment-<%=cmt.getInqCmNo()%>">
							<div class="d-flex" style="margin: 20px;">
								<div class="flex-shrink-0">
									<img class="rounded-circle"
										src="https://image.ohou.se/i/bucketplace-v2-development/uploads/default_images/avatar.png?gif=1&w=640&h=640&c=c&webp=1"
										alt="..." />
								</div>
								<div class="ms-3" id="comment" style="width: 70%;">
									<div class="fw-bold"><%=cmt.getMngId()%></div>
									<%=cmt.getInqCmContent()%>
								</div>
								<%
									if (session.getAttribute("mngId") != null && !session.getAttribute("mngId").equals("")) {
								%>

								<div id="end">
									<button class="btn btn-primary" type="button"
										onclick="updateArea('cmtForm-<%=cmt.getInqCmNo()%>')">수정</button>
									<button class="btn btn-primary delete" type="button"
										onclick="deleteComt('comment-<%=cmt.getInqCmNo()%>')">삭제</button>
								</div>
								<%
									}
								%>
							</div>
							<form class="mb-4"
								action="${pageContext.request.contextPath}/cmtUpdate.do"
								method='post' id="cmtForm-<%=cmt.getInqCmNo()%>"
								style="display: none;"
								onsubmit="return validateForm('formArea<%=cmt.getInqCmNo()%>')">
								<div id="cmtUpdate">
									<input type="hidden" name="comt"
										value='<%=new Gson().toJson(cmt)%>'> <input
										type="hidden" name="board"
										value='<%=new Gson().toJson(board)%>'>
									<textarea class="form-control" rows="3" name="content"
										id="formArea<%=cmt.getInqCmNo()%>"
										placeholder="Join the discussion and leave a comment!"></textarea>
								</div>
								<div id="cmtSubmit">
									<button type="submit" class="btn btn-outline-primary">입력</button>
								</div>
							</form>


						</div>

						<%
							}
						}
						%>
					</div>
				</div>
			</section>

		</div>
	</div>


	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		function updateArea(commentId) {
			var form = document.getElementById(commentId);
			if (form.style.display === "none") {
				form.style.display = "block";
			} else {
				form.style.display = "none";
			}
		}
		function validateForm(id) {
			var textareaValue = document.getElementById(id).value;

			if (textareaValue.trim() === "") {
				alert("댓글 내용을 입력해주세요.");
				return false;
			}

			return true;
		}

		function validateForm2() {
			var textareaValue = document.getElementById("formArea").value;

			if (textareaValue.trim() === "") {
				alert("댓글 내용을 입력해주세요.");
				return false;
			}

			return true;
		}

		function deleteComt(commentId) {
			const cmNo = commentId.split('-')[1];
			$.ajax({
				type : "post",
				url : '${pageContext.request.contextPath}/comtDelete.do', // 요청  URL 가져오기
				data : {
					comtNo : cmNo,
					type : 'inq'
				},
				success : function(response) { // 요청 성공 시 처리
					if (response == "yes") {
						let targetDiv = document.getElementById(commentId);
						targetDiv.remove();
					}
				},
				error : function(error) { // 요청 실패 시 처리
					alert("에러가 발생했습니다.")
				}
			});
		}
	</script>


</body>
</html>