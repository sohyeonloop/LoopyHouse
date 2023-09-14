<%@page import="shop.vo.ItemVO"%>
<%@page import="shop.vo.ProductVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	//
// 	ArrayList<Basket> baskets = (ArrayList<Bascket>) request.getAttribute("basket");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.101.0">
<title>오늘의집 마이페이지</title>
</body>

<link rel="canonical"
	href="https://getbootstrap.com/docs/4.6/examples/album/">

<!-- Bootstrap core CSS -->
<link href="./css/bootstrap.min.css" rel="stylesheet">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


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
	height: 350px;
	padding: 40px;
}

.profile_img img {
	width: 140px;
	border-radius: 50%;
	border: 1px solid rgb(211, 211, 211);
}

.mypage_txt {
	font-size: 1.2em;
	font-weight: 700;
}

p {
	margin-bottom: 3px !important;
}

.order_area {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.order_name {
	font-weight: 700;
	font-size: 17px;
}

.order_btn {
	background-color: #23b3df;
	border: 0;
	border-radius: 3px;
	width: 100%;
	margin-top: 20px;
	font-size: 18px;
	text-align: center;
	padding: 9px 3px;
	margin-top: 100px;
}

.order_btn a {
	color: white;
	text-decoration: none;
	font-weight: 600;
}

.sos {
	color: black;
	font-weight: 600;
}

.check_text {
	margin-left: 10px;
	font-weight: 600;
}

input[type="checkbox"] {
	padding: 10px;
}

.num_icon {
	font-size: 25px;
}

.num_icon2 {
	font-size: 32px;
}

.price {
	font-size: 18px;
	font-weight: 600;
}

.bg {
	display: flex;
	justify-content: space-between;
	background: #f2f9fc;
	border-radius: 10px;
	padding: 20px;
	margin-top: 20px;
}

.delete_btn {
	background-color: #23b3df;
	border: 0;
	border-radius: 3px;
	padding: 5px 14px;
	color: white;
	text-decoration: none;
	font-weight: 600;
}

.all_price {
	font-weight: 700;
	font-size: 20px;
}

.order_img {
	width: 140px;
	height: 140px;
}

.order_img img {
	width: 100%;
	border-radius: 3px;
}

.card-body:nth-child(2) {
	margin-top: -60px;
}

.all_price {
	margin-top: 80px;
}

.else_area {
	padding: 40px;
	font-weight: 500;
}
</style>


<!-- Custom styles for this template -->
<link href="./css/album.css" rel="stylesheet">
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

	<%
		int totalPrice = (int) request.getAttribute("total");
	Map<String, Integer> itemMap = (Map<String, Integer>) request.getAttribute("itemMap");
	List<ProductVO> prodList = (List<ProductVO>) request.getAttribute("prodList");
	List<ItemVO> cartList = (List<ItemVO>) request.getAttribute("cartList");
	int size = cartList.size() - 1;
	String productName = "상품이 존재하지 않습니다.";
	String ordNo = "";
	if (cartList.size() > 0) {
		productName = prodList.get(0).getProdName();
		productName = productName + "외 " + String.valueOf(size) + "종";
		ordNo = cartList.get(0).getOrdNo();
	}
	%>

	<main role="main">
		<div class="album py-5 bg-light">
			<div class="container">

				<div class="row">

					<div class="col-md-6">

						<label><input type="checkbox" id="selectAll"
							name="allCheck" onclick="selectAllItems()"> <spanclass="check_text">모두선택</span></label>

						<div class="card mb-4 shadow-sm">

							<!-- 장바구니 내용 -->
							<%
								if (cartList != null && cartList.size() > 0) {
								for (ItemVO item : cartList) {
									String image = "";
									String name = "";
									for (ProductVO product : prodList) {
								if (item.getProdCode().equals(product.getProdCode())) {
									image = product.getProdImage();
									name = product.getProdName();
								}
									}
							%>
							<div class="card-body">
								<input type="checkbox" class="checkbox"
									value="<%=item.getProdCode() + "," + item.getOrdNo()%>"
									name="allCheck">
								<div class="order_area">
									<div class="order_img">
										<img class="ordImg"
											src="${pageContext.request.contextPath}/images/<%=image%>"
											alt="주문목록이미지">
									</div>
									<div class="order_name">
										<p><%=name%>
											<%=item.getItemQua()%>개
										</p>
									</div>
								</div>

								<div class="bg">
									<div>
										<div>
											<span>컬러:</span> <span> <%
 	if (item.getItemColor() == null) {
 %> X <%
 	} else if (item.getItemColor() != null) {
 %> <%=item.getItemColor()%> <%
 	}
 %>
											</span>
										</div>
									</div>

									<p class="price"><%=itemMap.get(item.getProdCode())%>원
									</p>
								</div>
							</div>
							<%
								}
							} else {
							%>
							<div class="else_area">
								<p>장바구니 목록이 없습니다.</p>
							</div>
							<%
								}
							%>
						</div>

						<div>
							<input type="submit" onclick="processSelectedItems()" value="삭제"
								class="delete_btn">
						</div>

					</div>
					<div class="col-md-6">
						<p class="mypage_txt" style="visibility: hidden;">주문내역</p>
						<div class="card mb-4 shadow-sm">
							<div class="card-body">
								<div class="order_area">
									<div class="order_name all_price">
										<p>결제금액</p>
									</div>
									<p class="all_price"><%=totalPrice%>원
									</p>
								</div>

								<div>
									<span><button class="order_btn" onclick="requestPay()">
											<a href="#">구매하기</a>
										</button></span>
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

	<script type="text/javascript"
		src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	<script>
		var contextPath = '<%=request.getContextPath()%>';
		//수량버튼 조작
		let quantity = $('.quantity').val();

		$('.plus_btn').on('click', function() {
			$('.quantity').val(++quantity);
		});

		$('.minus_btn').on('click', function() {
			if (quantity > 1) {
				$('.quantity').val(--quantity);
			} else {
				alert("수량은 최소 한개 이상 선택해주세요.");
			}
		});
		
		function processSelectedItems() {
			  var checkboxes = document.getElementsByClassName("checkbox");	  
			  var check = 0;
			  var check2 = 0;
			  for(var i=0; i<checkboxes.length;i++){
				  if(checkboxes[i].checked){
					  check++;
				  }
			  }
			  for (var i = 0; i < checkboxes.length; i++) {
			    if (checkboxes[i].checked) {
			      var value = checkboxes[i].value;
			      console.log("선택된 항목:", checkboxes[i].value);
			      $.ajax({
                      url: contextPath + '/removeCart.do', 
                      method: 'POST', 
                      data: {
                          value: value  
                      }, 
                      success: function (data) {
                    	check2++;
                        if(check == check2){
  	                    	alert('장바구니 삭제가 완료되었습니다.');
  	                    	window.location.href = contextPath + "/shopCart.do"; 
                        }
                      },
                      error: function (jqXHR, textStatus, errorThrown) {
                          alert('삭제 처리 중 오류가 발생했습니다.');
                      }
                  });
			      
			    }
			  }
			}
		
		function selectAllItems() {
			  var checkboxes = document.getElementsByClassName("checkbox");
			  var selectAllCheckbox = document.getElementById("selectAll");
			  
			  var isChecked = selectAllCheckbox.checked;
			  
			  for (var i = 0; i < checkboxes.length; i++) {
			    checkboxes[i].checked = isChecked;
			  }
			}
			<%if (cartList.size() > 0) {%>
			 var IMP = window.IMP;
	        IMP.init("imp86153631");
<%-- 	        var contextPath = '<%=request.getContextPath()%>'; --%>
	        function requestPay() {
	            IMP.request_pay({
	                pg: 'kakaopay.TC0ONETIME',
	                pay_method: 'card',
	                merchant_uid: 'merchant_' + new Date().getTime(),
	                name: '<%=productName%>',
	                amount: <%=totalPrice%>,
	                buyer_email: 'Iamport@chai.finance',
	                buyer_name: '루피의집',
	                buyer_tel: '010-1234-5678',
	                buyer_addr: '대전광역시 중구 오류동',
	                buyer_postcode: '123-456'
	            }, function (rsp) {
	                if (rsp.success) {  // 결제가 성공했을 떄
	                    // 결제가 완료되었을 떄 결제 정보를 뜨게 만듬
	                    console.log(rsp);
	                    $.ajax({
	                        url: contextPath + '/payment.do', // 컨트롤러에서 처리할 URL을 입력
	                        method: 'POST', // 데이터 전송 방식을 선택
	                        data: {
	                        	list : 'JSON.stringify(<%=cartList%>)',
	                            ord_no:'<%=ordNo%>',  
	                            paid_amount: rsp.paid_amount,
	                        }, // 컨트롤러에 전송할 데이터를 입력
	                        success: function (data) {
	                            var msg = '결제가 완료되었습니다.';
	    	                    msg += '고객ID : ' + '<%=session.getAttribute("custId")%>';
	    	                    msg += '상점 거래ID : ' + rsp.merchant_uid;
	    	                    msg += '결제 금액 : ' + <%=totalPrice%>+"원";
	    	                    msg += '카드 승인번호 : ' + rsp.apply_num;
	    	                    alert('결제가 완료되었습니다.');
	    	                    window.location.href = contextPath + "/index.jsp";
	                        },
	                        error: function (jqXHR, textStatus, errorThrown) {
	                            alert('결제 처리 중 오류가 발생했습니다.');
	                        }
	                    });
	                } else {    // 결제가 실패했을 때
	                    // 결제에 실패했을떄 실패메세지와 실패사유를 출력
	                    var msg = '결제에 실패하였습니다.';
	                    msg += '실패 사유 : ' + rsp.error_msg;
	                }
	            });
	        }
	    <%} else {%>
	    function requestPay() {
	    	alert("결제 품목이 존재하지 않습니다.");
	    }
	    <%}%>
	</script>

</body>
</html>