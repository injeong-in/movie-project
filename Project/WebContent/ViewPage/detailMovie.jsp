<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		
		dto.setBoardID(2);
		dto2.setBoardID(2);
		
		int boardID = 0;
		int boardID2 = dto.getBoardID();
		/* response.sendRedirect("replyAction.jsp?boardID="+boardID); */
		/* request.setAttribute("boardID", boardID); */
		/* request.getRequestDispatcher("replyAction.jsp").forward(request, response); */
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="DmStyle.css">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery-2.1.3.min.js">
    </script>
<script src="../js/jquery.scrollTo.min.js"></script>
<script>
    $(window).scroll(function(){
    	if ($(this).scrollTop() > 300){
    		$('.btn_gotop').show();
    	} else{
    		$('.btn_gotop').hide();
    	}
    });
    $('.btn_gotop').click(function(){
    	$('html, body').animate({scrollTop:0},400);
    	return false;
    });
    </script>
</head>


<style>

#slider {
	margin-top: 60px;
}
#slider .item {
	height: 400px;
	
}
#slide1 {
	background: url(../images/endgame2.jpg);
}

#slide2 {
	background: url(../images/endgame3.jpg);
}

#slide3 {
	background: url(../images/endgame4.jpg);
}
</style>
<body>
	<div id="header">
		<!-- 네비게이션 -->
		<% if(userID != null) {
	%>
		<nav class="clearfix">
			<ul class="clearfix">
				<li onclick="location.href='../ViewPage/main.jsp'"><a href="#">HOME</a></li>
				<li onclick="location.href='../Movie/logoutAction.jsp'"><a
					href="#">로그아웃</a></li>
				<li onclick="location.href='../Movie/memberJoin.jsp'"><a
					href="#">회원가입</a></li>
				<li onclick="location.href='../ViewPage/movie.jsp'"><a
					href="#">MOVIE</a></li>
				<li onclick="location.href='../ViewPage/ost.jsp'"><a href="#">OST</a></li>
				<li><a href="#">LOCATION</a></li>
			</ul>
			<a href="" id="trigger"></a>
		</nav>
		<% } else { %>
		<nav class="clearfix">
			<ul class="clearfix">
				<li onclick="location.href='../ViewPage/main.jsp'"><a href="#">HOME</a></li>
				<li onclick="location.href='../Movie/login.jsp'"><a href="#">로그인</a></li>
				<li onclick="location.href='../Movie/memberJoin.jsp'"><a
					href="#">회원가입</a></li>
				<li onclick="location.href='../ViewPage/movie.jsp"><a
					href="#">MOVIE</a></li>
				<li onclick="location.href='../ViewPage/ost.jsp'"><a href="#">OST</a></li>
				<li><a href="#">LOCATION</a></li>

			</ul>
			<a href="" id="trigger"></a>
		</nav>

		<% } %>
	</div>
	<div id="container">

		<div id="contents">
			<div id="select_main">
				<div class="heading-wrap">
					<h3>영화상세페이지</h3>
				</div>
				<div class="movie-sector">
					<div class="box-image">
						<span class="thumb-image"> <img
							src="../images/endgame1.jpg">
						</span>
					</div>
					<div class="box-contents">
						<div class="title">
							<strong>어벤져스-엔드게임</strong>
							<p style="margin-top: 10px;">Avengers-endgame</p>
						</div>
						<div class="spec" style="margin-top: 5px;">
							<dl>
								<dt>감독 : 조 루소, 앤서니 루소</dt>
								<dt>장르 : SF판타지,액션</dt>
								<dt>개봉 : 201X</dt>
							</dl>
						</div>
						<div class="like" style="margin-top: 10px;">
							<input type="button" value="주요정보"> <input type="button"
								value="O.S.T듣기"> <input type="button" value="촬영지">
						</div>
					</div>
				</div>
			</div>

			<!--스토리 글-->
			<div class="story">반갑습니다</div>



			<!--이미지 슬라이더-->
				<div class="carousel slide" id="slider" data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#slider" data-slide-to="0" class="active"></li>
						<li data-target="#slider" data-slide-to="1"></li>
						<li data-target="#slider" data-slide-to="2"></li>
					</ol>
					
			<!-- Wrapper for slides -->
			<div class="carousel-inner">
				<div class="item" id="slide1">
					<div class="carousel-caption"></div>
				</div>
				<div class="item" id="slide2">
					<div class="carousel-caption"></div>
				</div>

				<div class="item" id="slide3">
					<div class="carousel-caption"></div>
				</div>
		</div>
		<!-- Left and right controls -->
			<a class="left carousel-control" href="#slider" data-slide="prev">
				<span class="icon-prev" role="button"></span>
			</a>
			<a class="right carousel-control" href="#slider">
				<span class="icon-next" data-slide="next" role="button"></span>
			</a>
	</div>
	
	
		<!--댓글-->
		<label style="margin-top: 15px;">전체 리플</label>
		<hr style="border: 1.5px solid gray;">
		<% 
			
			ArrayList<Object> list = dao.replyList3(boardID2);
			for(int i=0; i<list.size(); i++) {
				dto = (ReplyDTO) list.get(i);
				String id = dto.getUserID();
				String reply = dto.getReplyContent();
			%>

		<table>
			<tr>
				<%-- <%if(userID == null) id = "***"; %> --%>

				<td style="font-weight: bold;"><%=id%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td style="color: gray;"><%=reply%></td>
				<hr>
			</tr>
		</table>

		<% } %>

		<%-- <% 
			ArrayList<ReplyUserDTO> list2 = dao.replyList2(1);
			for(ReplyUserDTO reply : list2) {
				String noneId = reply.getUserID();
				String noneReply = reply.getReplyContent();
				
			%>
			<table>
				<tr>
					<td style="font-weight: bold;"><%=noneId%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td><%=noneReply%></td>
				</tr>
			</table>
			
			<% } %>
			 --%>

		<!--회원댓글작성-->
		<% if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
			%>
		<section class="container">
			<form action="replyAction.jsp" class="form-horizontal" method="post">
				<div class="form-group">
					<label>댓글</label> 
					
					<input type="hidden" value=<%=boardID2%> name="boardID"> <!--히든값 게시물 아이디-->
					
					<textarea style="margin: 0px; width: 972px; height: 35px;"
						class="form-control" name="replyContent" id="replyContent"
						cols="45" rows="5" placeholder="댓글입력하기"></textarea>
					
					<br>
					<button type="submit" class="btn pull-right">등록</button>
				</div>
			</form>
			<hr>

		</section>
		<% } else {
			boardID = dto2.getBoardID();
		%>
		<!--비회원댓글작성-->
		<section style="width: 980px;" class="container">
			<form action="replyAction.jsp" class="form-horizontal" method="post">
				<div class="form-group">
					<label>댓글작성&nbsp;</label>
					<div>
						<input type="text" name="userID" placeholder="닉네임"> 
						<input type="password" name="userPW" placeholder="비밀번호">
						<input type="hidden" value=<%=boardID%> name="boardID"> <!--히든값 게시물 아이디-->
					</div>
					<textarea style="margin-top: 5px; width: 972px; height: 35px;"
						class="form-control" name="replyContent" id="replyContent"
						cols="45" rows="3" placeholder="댓글입력하기"></textarea>
					<br>
					<button type="submit" class="btn pull-right">등록</button>
				</div>
			</form>
			<hr>
		</section>
		
		<% } 
		
		%>
		<!--댓글 끝-->

		<a href="" class="btn_gotop"> <img src="../images/topbutton.png"
			style="position: fixed; width: 80px;"> <span
			class="glyphicon glyphicon-chevron-up"> </span>
		</a>
	</div>
	</div>
</body>
</html>