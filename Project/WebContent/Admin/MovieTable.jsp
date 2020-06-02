<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Movie.MovieDao"%>
<jsp:useBean id="movie" class="Movie.ActorDTO"></jsp:useBean>


<%
	request.setCharacterEncoding("UTF-8");
	MovieDao dao = MovieDao.getInstance();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.container {
	display: flex;
	justify-content: space-around;
}


.image {
		  position: absolute; 
		  padding: 20px; 
		  border-radius: 5px; 
		  top: 70%; 
		  left: 50%; 
		  transform: translate(-50%, -50%); 
}
</style>
<body>
	<section class="container">
	
		<form action="insertMovie.jsp" method="post">
			<h1>영화정보 입력</h1>
			<table border="1">
				<tr>
					<td><input type="text" name="title" placeholder="영화제목"></td>
				</tr>
				<tr>
					<td><input type="text" name="filmingLocation" placeholder="장소"></td>
				</tr>
				<tr>
					<td><input type="text" name="figures" placeholder="총수입액"></td>
				</tr>
				<tr>
					<td><input type="text" name="releasedYear" placeholder="개봉년도"></td>
				</tr>
				<tr>
					<td><input type="text" name="audienceNumber" placeholder="관객집개수"></td>
				</tr>

			</table>
			<input type="submit" value="확인">
		</form>



		<form action="deleteMovieAction.jsp" method="post">
			<h1>영화 정보삭제</h1>
			<h5 style="color: gray;">확인 누르면 무조건 삭제됐다고 뜨니깐 주의하세욤 :)</h5>
			<table border="1">
				<tr>
					<td><input type="text" name="deleteName" placeholder="영화제목"></td>
				</tr>
			</table>
			<input type="submit" value="확인">
		</form>

		<br>
		<div>
			<h1>영화정보 리스트</h1>
			<table border="1">
				<%
					ArrayList<String> list = dao.getProperty();
				for (int i=0; i<list.size(); i++) { 
					String str = list.get(i);
				%>
					<td><%=str%></td>
					<%
						if(i%5 == 4 ) {%>
					<tr>
					<td style="background-color: red"></td>
					<td style="background-color: orange"></td>
					<td style="background-color: yellow"></td>
					<td style="background-color: green"></td>
					<td style="background-color: blue"></td>
					</tr>
						<% }
						}
						%>
					
			</table>
		</div>
	</section>
	
	<img class="image" src="../images/sango.jpg">

</body>
</html>