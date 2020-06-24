<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="Reply.ReplyDao"%>
<%@ page import="Reply.ReplyDTO"%>
<%@ page import="Reply.ReplyUserDTO"%>
<jsp:useBean id="dto" class="Reply.ReplyDTO" scope="page"></jsp:useBean>
<jsp:useBean id="dto2" class="Reply.ReplyUserDTO" scope="page"></jsp:useBean>
<jsp:useBean id="userDTO" class="Movie.UserDTO" scope="page"></jsp:useBean>

<%  
		request.setCharacterEncoding("UTF-8");
		
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		
		ReplyDao dao = ReplyDao.getInstance();
		
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="../css/swiper.min.css" />
<link type="text/css" rel="stylesheet" href="style.css" />
<script type="text/javascript" src="../js/swiper.min.js"></script>
<script src="../js/jquery-2.1.3.min.js">
    </script>
    <script src="../js/jquery.vide.min.js">
    </script>
    <script src="../js/jquery.scrollTo.min.js">
    </script>
</head>
<style>
body::before {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-image: url(../images/endgame3.jpg);
	background-repeat: no-repeat;
	background-position: center;
	background-size: 100%;
	-webkit-filter: blur(5px);
	-o-filter: blur(5px);
	-ms-filter: blur(5px);
	filter: blur(5px);
	z-index: -1;
	content: "";
	-webkit-filter: blur(5px);
}

.contents {
	width: 980px;
	height: 500px;
	margin: 0 auto;
}

h {
	font-weight: bold;
}

p {
	display: block;
	position: relative;
	text-align: center;
	top: 226px;
	color: white;
	font-weight: bold;
	font-size: 24px;
	background-color: #34495e;
	
}

</style>

<body>
	
	<div id="header">
		<!-- 네비게이션 -->
		
		<nav class="clearfix">
		<% if(userID == null) {
								%>
			<ul class="clearfix">
				<li onclick="location.href='../ViewPage/main.jsp'"><a href="#1">HOME</a></li>
				<li onclick="location.href='../Movie/login.jsp'"><a href="#2">로그인</a></li>
				<li onclick="location.href='../Movie/memberJoin.jsp'"><a href="#3">회원가입</a></li>
				<li onclick="location.href='./movie.jsp'"><a href="#4">MOVIE</a></li>
				<li onclick="location.href='../Music/ost-search.jsp'"><a href="#5">OST</a></li>
				<li><a href="#">LOCATION</a></li>
			</ul>
			<a href="" id="trigger"></a>
		</nav>
		<% } else { %>
		<nav class="clearfix">
			<ul class="clearfix">
				<li onclick="location.href='../ViewPage/main.jsp'"><a href="#1">HOME</a></li>
				<li onclick="location.href='../Movie/logoutAction.jsp'"><a href="#2">로그아웃</a></li>
				<li onclick="location.href='../Movie/memberJoin.jsp'"><a href="#3">회원가입</a></li>
				<li onclick="location.href='./movie.jsp'"><a href="#4">MOVIE</a></li>
				<li onclick="location.href='./ost-search.jsp'"><a href="#5">OST</a></li>
				<li><a href="#">LOCATION</a></li>

			</ul>
			<% } %>
			<a href="" id="trigger"></a>
		</nav>

	</div>
	<section id="container">
		<!-- Swiper -->
		<div class="contents" style="margin-top: 50px;">
			<h1 style="text-align: center;">2010년</h1>
			<div class="swiper-container gallery-top">
				<div class="swiper-wrapper">
					<div class="swiper-slide"
					style="background-image: url(./images/2010/1.jpg)"
					onclick=""><p>나잇&데이</p></div>
					<div class="swiper-slide" style="background-image: url(./images/2010/2.jpg)"
					onclick=""><p>드래곤 길들이기</p></div>
					<div class="swiper-slide" style="background-image: url(./images/2010/3.jpg)">
					<p>버레스크</p></div>
					<div class="swiper-slide" style="background-image: url(./images/2010/4.jpg)">
					<p>시라노:연애조작단</p></div>
					<div class="swiper-slide" style="background-image: url(./images/2010/5.jpg)">
					<p>아이언맨2</p></div>
					<div class="swiper-slide" style="background-image: url(./images/2010/6.jpg)">
					<p>아저씨</p></div>
					<div class="swiper-slide" style="background-image: url(./images/2010/7.jpg)">
					<p>이끼</p></div>
					<div class="swiper-slide" style="background-image: url(./images/2010/8.png)">
					<p>인셉션</p></div>
				</div>
				<!-- Add Arrows -->
				<div class="swiper-button-next swiper-button-white"></div>
				<div class="swiper-button-prev swiper-button-white"></div>
			</div>
			<div class="swiper-container gallery-thumbs">
				<div class="swiper-wrapper">
						<%for(int i=1; i<8; i++) { %>
						<div class="swiper-slide"
						style="background-image: url(./images/2010/<%=i%>.jpg)">
						</div>
						<% } %>
						<div class="swiper-slide"
						style="background-image: url(./images/2010/8.png)">
						</div>
				</div>
			</div>
		</div>
	</section>
	<script>
		var galleryThumbs = new Swiper('.gallery-thumbs', {
			spaceBetween : 10,
			slidesPerView : 4,
			loop : true,
			freeMode : true,
			loopedSlides : 5, //looped slides should be the same
			watchSlidesVisibility : true,
			watchSlidesProgress : true,
		});

		var galleryTop = new Swiper('.gallery-top', {
			spaceBetween : 10,
			loop : true,
			loopedSlides : 5, //looped slides should be the same
			navigation : {
				nextEl : '.swiper-button-next',
				prevEl : '.swiper-button-prev',
			},
			thumbs : {
				swiper : galleryThumbs,
			},
		});
		
		
		function idFind() {
		      location.href = 'http://localhost/Project/ViewPage/detailMovie.jsp';
		   }
		
	</script>
</body>
</html>