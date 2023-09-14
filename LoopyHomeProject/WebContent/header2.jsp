<%@page import="java.util.ArrayList"%>
<%@page import="shop.vo.SearchVO"%>
<%@page import="java.util.List"%>
<%@page import="comm.service.PopSearchServiceImpl"%>
<%@page import="comm.service.IPopSearchService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String cusId = (String) session.getAttribute("custId");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>예쁜템들 모여사는 오늘의집</title>
<!-- seo meta tag 생략 -->

<!-- CSS Reset -->
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css"> -->

<!-- 구글 폰트 -->
<link href="https://webfontworld.github.io/pretendard/Pretendard.css"
	rel="stylesheet">

<!-- 아이콘 용 폰트 어썸 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<link rel="apple-touch-icon" sizes="180x180"
	href="${pageContext.request.contextPath}/asset/favicon.ico">
<link rel="icon" type="image/png" sizes="32x32"
	href="${pageContext.request.contextPath}/asset/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="${pageContext.request.contextPath}/asset/favicon-16x16.png">
<link rel="manifest"
	href="${pageContext.request.contextPath}/asset/favicon.ico">
<meta name="msapplication-TileColor" content="#da532c">
<meta name="theme-color" content="#ffffff">



<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/mobileSearch.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/banner.css" />

<style>
.srh_btn {
	cursor: pointer;
	border-left: 1px solid #dbdbdb;
	height: 100%;
	width: 60px;
	text-align: center;
	height: 100%;
	width: 60px;
}

.main-logo {
	width: 200px !important;
}

/* 인기검색어 CSS */
#rolling_box {
	display: block;
}

.rolling_box {
	width: 300px;
	height: 35px;
	text-align: center;
}

.rolling_box ul {
	width: 100%;
	height: 100%;
	overflow: hidden;
	position: relative;
}

.rolling_box ul li {
	list-style: none;
	width: 100%;
	height: 100%;
	transition: .5s;
	position: absolute;
	transition: top .75s;
	top: 100%;
	z-index: 1;
	background-color: #ffffff;
	left: 0;
}

.card_sliding {
	top: 0 !important;
	z-index: 100 !important;
}

.card_sliding_after {
	top: -100% !important;
	z-index: 10 !important;
}

.rolling_box ul li p {
	font-size: 16px;
	line-height: 0px;
	line-height: 35px;
	width: 100%;
	font-weight: 500;
}

.before_slide {
	transform: translateY(100%);
}

.after_slide {
	transform: translateY(0);
}

.search {
	width: 100px;
}
</style>
</head>

<body>
	<!-- 전체 레이아웃--------------------------------------------------------------->
	<div class="wrap">
		<!-- 상단 네비게이션 영역 ---------------------------------------------------->
		<header class="header">
			<!-- 네비게이션 상단 ------------------------------------------------------->
			<div class="header-upper">
				<div class="inner">
					<i class="fas fa-bars searchMenu"></i>
					<div class="header-upper__inner">
						<div class="header-upper__logo">
							<a href="${pageContext.request.contextPath}/index.jsp"><img
								src="${pageContext.request.contextPath}/images/루피의집로고.png"
								alt="" class="main-logo"></a>
						</div>
						<div class="header-upper__nav">
							<ul>
								<li class="header-upper__item upper__active"><a href="">공지·문의</a>
								</li>
								<li class="header-upper__item"><a
									href="${pageContext.request.contextPath}/community.do">커뮤니티</a></li>
							</ul>
						</div>
					</div>
					<div class="header-upper__service">




						<i class="mobile-searchBar fas fa-search"></i>
						<form action="${pageContext.request.contextPath}/search.do"
							method="post">
							<div class="header-upper__searchBar">
								<i class="fas fa-search"></i> <input type="text"
									placeholder="오늘의집 통합검색" name="searchText" />
								<button type="submit" class="srh_btn">검색</button>
							</div>
						</form>




						<a href="#" class="shopping"> <img
							src="${pageContext.request.contextPath}/images/shopping.jpg"
							alt="">
						</a>
						<ul>
							<li><a href="${pageContext.request.contextPath}/shopCart.do">장바구니</a></li>
							<li><a
								href="${pageContext.request.contextPath}/mypage.do?id=<%=cusId%>">마이페이지</a></li>
							<li><a href="${pageContext.request.contextPath}/logout.jsp">로그아웃</a></li>
							<button class="header-upper__writeBt">
								글쓰기
								<div class="header-upper__lists">
									<a href="">
										<h4>사진 올리기</h4>
										<p>우리 집의 공간과 나의 일상을 기록해 보세요.</p>
									</a> <a href="./write.jsp">
										<h4>집들이 글쓰기</h4>
										<p>집에 관한 이야기를 글로 작성해 보세요.</p>
									</a> <a href="">
										<h4>노하우 글쓰기</h4>
										<p>다양한 인테리어 노하우를 공유해 주세요.</p>
									</a> <a href="">
										<h4>상품 리뷰 글쓰기</h4>
										<p>상품 리뷰를 작성하고 포인트도 받아 보세요.</p>
									</a> <a href="">
										<h4>시공 전문가 리뷰쓰기</h4>
										<p>시공 전문가 리뷰를 작성하고 포인트도 받아보세요.</p>
									</a> <a href="">
										<h4>인테리어 질문하기</h4>
										<p>인테리어 고수들과 전문가들에게 질문해 보세요.</p>
									</a>
								</div>
							</button>
						</ul>
					</div>
				</div>
			</div>

			<!-- 모바일 메뉴 영역 --------------------------------------------------- -->
			<div class="modal__content-wrap">
				<div class="modal__content-container">
					<div class="modal-layout modal__content-tit">
						<div class="header-upper__logo modal-logo">
							<a href="">오늘의집</a>
						</div>
						<div>
							<a href="">앱다운로드</a>
						</div>
					</div>
					<div class="modal-layout modal__content-login">
						<a href="">
							<button>로그인</button>
						</a> <a href="">
							<button>회원가입</button>
						</a>
					</div>
					<ul class="modal-layout modal__content community">
						<h4>커뮤니티</h4>
						<i class="fa-solid fa-angle-down"></i>
					</ul>
					<ul class="modal-layout modal__content store">
						<h4>스토어</h4>
						<i class="fa-solid fa-angle-down"></i>
					</ul>
					<ul class="modal-layout modal__content interior">
						<h4>인테리어시공</h4>
						<i class="fa-solid fa-angle-down"></i>
					</ul>
					<ul class="modal-layout modal__content">
						<li><a href="">마이페이지</a></li>
						<li><a href="">나의 쇼핑</a></li>
						<li><a href="">스크랩북</a></li>
						<li><a href="">알림</a></li>
						<li><a href="">이벤트</a></li>
						<li><a href="">사진 올리기</a></li>
						<li><a href="">집들이 글쓰기</a></li>
						<li><a href="">노하우 글쓰기</a></li>
						<li><a href="">상품 리뷰 쓰기</a></li>
						<li><a href="">시공 전문가 리뷰 쓰기</a></li>
						<li><a href="">인테리어 질문하기</a></li>
						<li><a href="">고객센터</a></li>
					</ul>
					<ul class="modal-layout modal__content">
						<li href=""><a href="">전문가 신청</a></li>
						<li href=""><a href="">판매자 신청</a></li>
					</ul>
				</div>
			</div>

			<!-- 네비게이션 하단----------------------------------------------------------- -->
			<div class="header-lower">
				<div class="inner">
					<nav>


						<!-- 홈 페이지 카테고리 상품 찾기 영역 -->
						<!-- <section class="container home-section home-category"> -->
						<div class="home-category__wrap">
							<ul class="home-category__contents">
								<li class="home-category__item__wrap">
									<div>
										<a href="${pageContext.request.contextPath}/furniture.jsp">
											<img
											src="https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_home_categories/164333421927911367.png?gif=1&w=144&h=144&c=c"
											alt="가구 이미지" />
											<h4 class="category">가구</h4>
										</a>
									</div>
								</li>

								<li class="home-category__item__wrap">
									<div>
										<a href="${pageContext.request.contextPath}/digital.jsp">
											<img
											src="https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_home_categories/162823226017937426.png?gif=1&w=144&h=144&c=c"
											alt="가전 이미지" />
											<h4 class="category">가전·디지털</h4>
										</a>
									</div>
								</li>

								<li class="home-category__item__wrap">
									<div>
										<a href="${pageContext.request.contextPath}/decoration.jsp">
											<img
											src="https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_home_categories/162823227719846773.png?gif=1&w=144&h=144&c=c"
											alt="데코/식물 이미지" />
											<h4 class="category">데코</h4>
										</a>
									</div>
								</li>


								<li class="home-category__item__wrap">
									<div>
										<a href="${pageContext.request.contextPath}/light.jsp"> <img
											src="https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_home_categories/162823225665741013.png?gif=1&w=144&h=144&c=c"
											alt="조명 이미지" />
											<h4 class="category">조명</h4>
										</a>
									</div>
								</li>

								<li class="home-category__item__wrap">
									<div>
										<a href="${pageContext.request.contextPath}/dailyGoods.jsp">
											<img
											src="https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_home_categories/163609843911228804.png?gif=1&w=144&h=144&c=c"
											alt="생활용품 이미지" />
											<h4 class="category">생활용품</h4>
										</a>
									</div>
								</li>

								<li class="home-category__item__wrap">
									<div>
										<a href="${pageContext.request.contextPath}/kitchen.jsp">
											<img
											src="https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_home_categories/162823226903946200.png?gif=1&w=144&h=144&c=c"
											alt="주방용품 이미지" />
											<h4 class="category">주방용품</h4>
										</a>
									</div>
								</li>
							</ul>
						</div>
						</section>

					</nav>
					<div class="nav2"></div>

					<%
						IPopSearchService service = PopSearchServiceImpl.getInstance();
					List<SearchVO> searchLank = service.popSearchSelect();
					List<String> searchWord = new ArrayList<String>();
					int i = 0;
					for (SearchVO search : searchLank) {
						++i;
						searchWord.add(Integer.toString(i) + ". " + search.getSchWord());
					}
					String word1 = searchWord.get(0);
					String word2 = searchWord.get(1);
					String word3 = searchWord.get(2);
					String word4 = searchWord.get(3);
					String word5 = searchWord.get(4);
					String word6 = searchWord.get(5);
					String word7 = searchWord.get(6);
					String word8 = searchWord.get(7);
					String word9 = searchWord.get(8);
					String word10 = searchWord.get(9);
					%>

					<!-- 실시간 인기검색어 -->
					<div class="topic">


						<div class="rolling_box topic_name">
							<ul id="rolling_box">
								<li class="card_sliding" id="first">
									<p class="search"></p>
								</li>
								<li class="" id="second">
									<p class="search"></p>
								</li>
								<li class="" id="third">
									<p class="search"></p>
								</li>
							</ul>
						</div>









						<div id="topic_lists">
							<ul>
								<li>
									<h3>인기검색어</h3>
								</li>

								<%
									if (searchLank != null && searchLank.size() > 0) {
									i = 0;
									for (SearchVO search : searchLank) {
										++i;
								%>

								<li><span class="topic_num"><%=i%></span> <span
									class="topic_name"><%=search.getSchWord()%></span></li>
								<%
									}
								}
								%>

							</ul>
						</div>
					</div>


				</div>
			</div>
		</header>

		<script src="./js/jquery-3.6.4.min.js"></script>
		<script>		
    let rollingData = [
       '<%=word1%>', 
       '<%=word2%>',
       '<%=word3%>',
       '<%=word4%>',
       '<%=word5%>',
       '<%=word6%>',
       '<%=word7%>',
       '<%=word8%>',
       '<%=word9%>',
       '<%=word10%>'
    ]    // 롤링할 데이터를 넣으면 됩니다 갯수 제한 없어요

    let timer = 1500 // 롤링되는 주기 입니다 (1000 => 1초)

    let first = document.getElementById('first'),
      second = document.getElementById('second'),
      third = document.getElementById('third')
    let move = 2
    let dataCnt = 1
    let listCnt = 1

    //위 선언은 따로 완전히 수정하지 않는 한 조정할 필요는 없습니다.

    first.children[0].innerHTML = rollingData[0]

    setInterval(() => {
      if (move == 2) {
        first.classList.remove('card_sliding')
        first.classList.add('card_sliding_after')

        second.classList.remove('card_sliding_after')
        second.classList.add('card_sliding')

        third.classList.remove('card_sliding_after')
        third.classList.remove('card_sliding')

        move = 0
      } else if (move == 1) {
        first.classList.remove('card_sliding_after')
        first.classList.add('card_sliding')

        second.classList.remove('card_sliding_after')
        second.classList.remove('card_sliding')

        third.classList.remove('card_sliding')
        third.classList.add('card_sliding_after')

        move = 2
      } else if (move == 0) {
        first.classList.remove('card_sliding_after')
        first.classList.remove('card_sliding')

        second.classList.remove('card_sliding')
        second.classList.add('card_sliding_after')

        third.classList.remove('card_sliding_after')
        third.classList.add('card_sliding')

        move = 1
      }

      if (dataCnt < (rollingData.length - 1)) {
        document.getElementById('rolling_box').children[listCnt].children[0].innerHTML = rollingData[dataCnt]
        dataCnt++
      } else if (dataCnt == rollingData.length - 1) {
        document.getElementById('rolling_box').children[listCnt].children[0].innerHTML = rollingData[dataCnt]
        dataCnt = 0
      }

      if (listCnt < 2) {
        listCnt++
      } else if (listCnt == 2) {
        listCnt = 0
      }

      console.log(listCnt)
    }, timer);


  </script>