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
				<h4 class="mb-3">회원가입</h4>

				<form class="validation-form"  method="post" action="./join.do" onsubmit="return valid()">
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="id">아이디</label> <input type="text"
								class="form-control" id="id" placeholder="아이디를 입력해주세요."
								name="custId" required>
							<div class="invalid-feedback">아이디를 입력해주세요.</div>
							<div class="col-sm-12" style="text-align: left;">
								<button type="button" class="btn btn-success btn-sm" id="idChk">중복확인</button>
								<span id="disp"></span>
							</div>
						</div>

						<div class="col-md-6 mb-3">
							<label for="password">패스워드</label> <input type="password"
								class="form-control" id="nickname" placeholder="패스워드를 입력해주세요."
								name="custPwd" required pattern="(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*()_+|]).{4,}">
							<div class="invalid-feedback">패스워드를 입력해주세요.</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="custName">이름</label> <input type="text"
								class="form-control" placeholder="이름을 입력해주세요." name="custName"
								required>
							<div class="invalid-feedback">이름을 입력해주세요.</div>
						</div>

						<div class="col-md-6 mb-3">
							<label for="custNickName">닉네임</label> <input type="text"
								class="form-control" placeholder="닉네임을 입력해주세요."
								name="custNickName" required>
							<div class="invalid-feedback">닉네임을 입력해주세요.</div>
						</div>
					</div>



					<div class="mb-3">
						<label for="email">이메일</label> <input type="email"
							class="form-control" name="custMail"
							placeholder="you@example.com" required>
						<div class="invalid-feedback">이메일을 입력해주세요.</div>
					</div>

					<div class="mb-3">
						<label for="custAddr">주소</label> <input type="text"
							class="form-control" name="custAddr" id="address" readonly>
						
						<div class="invalid-feedback">주소를 입력해주세요.</div>
					</div>

					<div class="form-group">
						<label for="custTel" class="control-label col-sm-2">연락처</span></label>
						<div class="mb-3">
							<input type="text" class="form-control" name="custTel"
								placeholder="010-0000-0000"
								pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" required>
							<div class="invalid-feedback">연락처를 입력해주세요.</div>
						</div>
					</div>

					<div class="form-group">
						<label for="custBirth" class="control-label col-sm-2">생년월일</label>
						<div class="mb-3">
							<input type="text" class="form-control" name="custBirth"
								placeholder="ex)1995-05-16" required>
							<div class="invalid-feedback">생년월일을 입력해주세요.</div>
						</div>
					</div>

					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="custGender"
							id="inlineRadio1" value="M"> <label
							class="form-check-label" for="inlineRadio1">남</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="custGender"
							id="inlineRadio2" value="W"> <label
							class="form-check-label" for="inlineRadio2">여</label>
					</div>


					<hr class="mb-4">
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input" id="aggrement"
							required> <label class="custom-control-label"
							for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
					</div>
					<div class="mb-4"></div>
					<button class="btn btn-primary btn-lg btn-block" type="submit">가입 하기</button>
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
    window.addEventListener('load', () => {
        const forms = document.getElementsByClassName('validation-form');

        Array.prototype.filter.call(forms, (form) => {
          form.addEventListener('submit', function (event) {
            if (form.checkValidity() === false) {
              event.preventDefault();
              event.stopPropagation();
            }

            form.classList.add('was-validated');
          }, false);
        });
      }, false);
    
    
    window.onload = function(){
        document.getElementById("address").addEventListener("click", function(){ 
            
            new daum.Postcode({
                oncomplete: function(data) { 
                    document.getElementById("address").value = data.address; 
                }
            }).open();
        });
    }
	
	$('#idChk').on('click',function(){
			$('#disp').text("");
		
			let idVal = $('#id').val();
			
			if(idVal.trim().length == 0) return;
			
			$.ajax({
				url:'idChk.jsp',
				type:'post',	
//	 			data:'key=value',
				data: {'id':idVal},
				success:function(data){
					console.log(data);
					if(data.code == "ok"){
						$('#disp').text(data.msg).css('color','green');
					}else{
						$('#disp').text(data.msg).css('color','red');
					}
				},
				error:function(xhr){
					alert("상태>>" + xhr.status);
				},
				
				
				dataType:'json' 
			});
		});
    
	//비동기처리
	function valid() {
		
		event.preventDefault();
		
		let data = $('form').serializeArray();
		
		$.ajax({
			type: 'post', 
			url: 'serializeArr.jsp',
			data: JSON.stringify(data),
			success: function (result){
				
				if(result == 1){
					
					let conf = confirm("가입에 성공했습니다. 로그인 페이지로 이동할까요?");
					if(conf) location.href = "./login.html";
					
					$('#joinspan').text("가입 성공!").css('color','green');
				}else{
					$('#joinspan').text("가입 실패..").css('color','red');
				}
			}, 
			error: function(xhr){
				alert("상태: " + xhr.status);
			}, 
		});
		
		
	}
    
  </script>

</body>


</html>