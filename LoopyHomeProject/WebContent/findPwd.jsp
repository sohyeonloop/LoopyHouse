<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입2</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<style>
body {
	min-height: 100vh;
	background: -webkit-gradient(linear, left bottom, right top, from(#92b5db),
		to(#1d466c));
	background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
}

.input-form {
	max-width: 680px;
	margin-top: 80px;
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
}
</style>
</head>

<body>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3">비밀번호 찾기</h4>

				<form class="validation-form" novalidate method="post" action="./findPwd.do">

					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="custName">아이디</label> 
							<input type="text" class="form-control" placeholder="아이디를 입력해주세요." name="custName" id="inputId" required>
							<div class="invalid-feedback">이름을 입력해주세요.</div>
						</div>
					</div>

					<div class="form-group">
						<label for="custTel" class="control-label col-sm-2">연락처</span></label>
						<div class="mb-3">
							<input id="inputPhoneNumber" type="text" class="form-control" name="custTel" placeholder="010-0000-0000" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" required>
							<div class="invalid-feedback">연락처를 입력해주세요.</div>
						</div>
					</div>

					<div class="mb-4"></div>
					<button class="btn btn-primary btn-lg btn-block" type="submit" id="findId">비밀번호 찾기</button>
					<span id="joinspan"></span>
				</form>
			</div>
		</div>
		<footer class="my-3 text-center text-small">
			<p class="mb-1">&copy; Loopy's Home</p>
		</footer>
	</div>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	
	<script>
	
		// id찾기 버튼 클릭시 동작
// 		$("#findId").on("click", function(){
			
// 			alert("아이디 찾기 버튼");
			
// 			var inputId = $("#inputId").val();
// 			var inputPhoneNumber = $("#inputPhoneNumber").val();
			
// 			console.log("inputId : " + inputId);
// 			console.log("inputPhoneNumber : " + inputPhoneNumber);
			
// 			// JSON될지모르겟는데 파라미터로해야되려나
			
// 			$.ajax({
// 				type : "post",
// 				url : './findId.do', // 요청  URL 가져오기
// 				data : "inputId:inputId",
// 					inputPhoneNumber : inputPhoneNumber
// 				}, // 폼 데이터 가져오기
// 				success : function(response) { // 요청 성공 시 처리
// 						alert(cv.getcustId());
// 						window.location.href = 'findId.jsp';
// 				},
// 				error : function(error) { // 요청 실패 시 처리

// 					alert("에러가 발생했습니다.")
// 				}
// 			});
			
// 		});
		// 위 방식쓰려면 paser써야되는데 일단 안쓰는게 좋을듯
		// 이건 폼태그를 시리얼라이즈해서 가져가고 아마 페이지이동을 막는형태인거로알고있음 이것도 ㄱㅊ
		$('form').submit(function(event) {
			event.preventDefault(); // 기본 제출 이벤트 막기 ajax부분만 보면될듯
			
			$.ajax({
				type : "post",
				url : './findPwd.do', // 요청  URL 가져오기
				data : $(this).serialize(), // 폼 데이터 가져오기
				success : function() { // 요청 성공 시 처리
					console.log();
					alert("비밀번호가 휴대폰으로 전송되었습니다.");
						window.location.href = 'login.html';
// 						alert(cv.getcustId());
				},
				error : function(error) { // 요청 실패 시 처리

					alert("잘못된 정보입니다 다시 입력해 주세요.")
				}
			});
			
		});
	</script>

</body>


</html>