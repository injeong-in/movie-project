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
		
		/*게시물 ID번호 세팅*/
		dto.setBoardID(2);
		dto2.setBoardID(2);
		
		int boardID = dto2.getBoardID();
		int boardID2 = dto.getBoardID();
		int number=0;
		String checkBoard = null;
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

.spec dt {
	font-size: 13px;
}


.cmt_mdf_del {
	font-size: 11px;
}

.cmt_delpw_box {
	overflow: hidden;
	position: absolute;
	width: 212px;
	height: 31px;
	border: 2px solid #3c4790;
}

.cmt_delpw {
	float: left;
	width: 129px;
	height: 31px;
	line-height: 34px;
	padding: 0 5px;
	border: 0;
	background: #fff;
	font-size: 14px;
}

.btn_ok {
	float: left;
	width: 49px;
	height: 31px;
	line-height: 32px;
	background: #4a57a8;
	color: #fff;
	font-weight: bold;
	text-shadow: 0px 1px #343a8e;
}

.cmt_mdf_del button {
	color: #999;
}

.btn_cmtpw_close {
	width: 30px;
	height: 31px;
	background: #3c4790;
}

.blind {
	position: absolute;
	overflow: hidden;
	visibility: hidden;
	margin: -1px;
	width: 0px;
	height: 0px;
	top: -9999px;
	font-size: 0;
}

.icon_cmtpw_close {
	display: inline-block;
	width: 13px;
	height: 14px;
	margin: 3px 0 0 3px;
	background-position: -138px -78px;
}

.sp_img {
	background-image: url(https://nstatic.dcinside.com/dc/w/images/sp/sp_img.png);
	background-repeat: no-repeat;
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
				<li onclick="location.href='../Music/ost.jsp'"><a href="#">OST</a></li>
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
				<li onclick="location.href='../Music/ost.jsp'"><a href="#">OST</a></li>
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
						<span class="thumb-image"> 
						<img src="./images/7Beon.jpg" onclick="location.href='./images/7Beon.jpg'">
						</span>
					</div>
					<div class="box-contents">
						<div class="title">
							<strong>7번방의 선물</strong>
							<p style="margin-top: 10px;">Miracle in Cell No.7</p>
						</div>
						<div class="spec" style="margin-top: 5px;">
							<dl>
								<dt>감독 : 이환경</dt>
								<dt>배우 : 류승룡, 박신혜, 갈소원... </dt>
								<dt>장르 : 코미디</dt>
								<dt>개봉 : 2013</dt>
							</dl>
						</div>
						<div class="like" style="margin-top: 10px;">
							<img src="./images/stillcut.png">
							<a href="../Music/ost-search.jsp"><img src="./images/music.png" style="margin-left:-6px;"></a>
							<img src="./images/reply.png" style="margin-left:-6px;">
						</div>
					</div>
				</div>
			</div>

			<!--스토리 글-->
			<br>
			<h4 style="font-weight: bold; padding-top: 15px;">줄거리</h4>
			<div class="story">최악의 흉악범들이 모인 교도소 7번방에 이상한 놈이 들어왔다! <br>그는 바로 6살 지능의 딸바보 '용구'! <br>평생 죄만 짓고 살아온 7번방 패밀리들에게 떨어진 미션은 바로 <br>
			'용구' 딸 '예승'이를 외부인 절대 출입금지 교도소에 반.입.하.는.것!<br><br><br></div>


		<div class="slide">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				
				<%for(int i=0; i<9; i++) { %>
				<li data-target="#myCarousel" data-slide-to="<%=i%>" class="active"></li>
				<% } %>
			</ol>
			<div class="carousel-inner">
				
				<div class="item active">
					<img style="width: 700px; margin:0 auto;" src="./images/7Beon1.jpg">
				</div>
				<%for(int i=2; i<10; i++) {%>
				<div class ="item">
					<img style="width: 700px; margin:0 auto;" src="./images/7Beon<%=i%>.jpg" style="margin:0 auto;">
				</div>
				<% } %>
			</div>
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a>
			<a class="right carousel-control" href="#myCarousel" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right"></span>
			</a>
		</div>
	</div>
			
	
	
		<!--댓글-->
		<label style="margin-top: 15px;">전체 리플</label>
		<hr style="border: 1.5px solid gray;">
		<% 
			ArrayList<ReplyUserDTO> check = dao.replyList2(boardID);
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
			</tr>
			<hr>
			<%	/*비회원 리스트를 가져와서 조인 테이블 리스트의 ID값과 비교해서 비회원 댓글만 삭제창이 나오도록함*/
				for(int j=0; j<check.size(); j++) {
				dto2 = check.get(j);
				String checkId = dto2.getUserID();
					if(checkId.equals(id)) { %>
			<div class="cmt_mdf_del" data-type="cmt" style="float: right">
				<button type="button" class="btn_cmt_delete" onclick="dis()">삭제</button>
				<div id="cmt_delpw_box" class="cmt_delpw_box" data-type="cmt" style="margin: -16px 0 0 -242px">
					<input type="hidden" value="<%=checkId%>" name="cmt_ID" id="cmt_ID" class="cmt_ID">
					<input type="password" title="비밀번호" placeholder="비밀번호" id="cmt_password" name="cmt_password" class="cmt_delpw">
					<button type="button" id="btn_ok" class="btn_ok" onclick="deleteReply(<%=number%>)">확인</button> 
					<!-- 매개변수를 j로 했을때 동일아이디를 같은 숫자로 인식하는 문제 발생, number 인트 변수를 따로 설정해서 1씩 증가하도록 해서 해결-->
					<button type="button" class="btn_cmtpw_close">
						<span class="blind">닫기</span>
						<em class="sp_img icon_cmtpw_close"></em>
					</button>
				</div>
			</div>
			<% 
			number+=1; /*넘버값 0부터 1씩 증가하도록 선처리 후증가로 */
			break; } 
			}%>
			
		</table>

		<% } %>
		<hr>
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
			<form action="replyAction.jsp" name="Form" id="Form" class="form-horizontal" method="post">
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
		%>
		<!--비회원댓글작성-->
		<section style="width: 980px;" class="container">
			<form action="replyAction.jsp" id="Form" class="form-horizontal" method="post">
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
			style="position: fixed; width: 80px;"> <span class="glyphicon glyphicon-chevron-up"> </span>
		</a>
	</div>
	</div>
	 <script type="text/javascript">
	 
	 var replyPW = document.getElementsByClassName('cmt_delpw');
	 var replyID = document.getElementsByClassName('cmt_ID');
	 
	 
	 /*겪었던 함수실행문제 - id값을 담아서 함수를 실행했더니 자꾸 맨위의 댓글만 함수실행이 되어서 아래 댓글들은 함수실행이 안되는 문제를 겪음*/
	 
	 var deleteReply = function(i) {
		 location.href = 'replyDelete.jsp?cmt_ID=' +replyID[i].value + '&cmt_password=' + replyPW[i].value +'&boardID='+<%=boardID%>;
	 }
		 
	 
	 $(function(){
	    	$("#btn_ok").on("click",function(){
	    		
	    		$.ajax({
	    			url:"replyDelete.jsp",
	    			type:"cmt",
	    			success: function() {
	    				alert('입력되었습니다');
	    			}
	    		});
	    		return false;
	    	});
	    });
	 
    
    $(function(){
    	$("#Form").on("submit",function(){
    		var d=$("#Form").serialize();
    		
    		$.ajax({
    			url:"replyAction.jsp",
    			type:"post",
    			data:d,
    			success: function() {
    				location.reload(true);
    			}
    		});
    		return false;
    	});
    });
    
    /* function dis(){
        if($('.btn_cmt_delete').css('display') == 'none'){
        $('#cmt_delpw_box').show();
    }else{
        $('#cmt_delpw_box').hide();
    	}
    } */
    
</script>
</body>
</html>