<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Movie.GenreDao"%>
<jsp:useBean id="movie" class="Movie.GenreDTO"></jsp:useBean>


<%
	request.setCharacterEncoding("UTF-8");
	GenreDao dao = GenreDao.getInstance();
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

		<form action="insertGenre.jsp" method="post">
			<h1>장르 입력</h1>
			<table border="1">
				<tr>
					<td><input type="text" name="releasedYear" placeholder="개봉년도"></td>
				</tr>
				<tr>
					<td><input type="text" name="actionMovie" placeholder="액션영화"></td>
				</tr>
				<tr>
					<td><input type="text" name="horror" placeholder="호러"></td>
				</tr>
				<tr>
					<td><input type="text" name="romance" placeholder="로맨스"></td>
				</tr>
				<tr>
					<td><input type="text" name="animation" placeholder="애니메이션"></td>
				</tr>
				<tr>
					<td><input type="text" name="comedy" placeholder="코미디"></td>
				</tr>
				<tr>
					<td><input type="text" name="musical" placeholder="뮤지컬"></td>
				</tr>
				<tr>
					<td><input type="text" name="family" placeholder="가족"></td>
				</tr>
				<tr>
					<td><input type="text" name="drama" placeholder="드라마"></td>
				</tr>

			</table>
			<input type="submit" value="확인">
		</form>



		<form action="deleteGenreAction.jsp" method="post">
			<h1>장르 삭제</h1>
			<h5 style="color: gray;">확인 누르면 무조건 삭제됐다고 뜨니깐 주의하세욤 :)</h5>
			<table border="1">
				<tr>
					<td><input type="text" name="deleteYear" placeholder="개봉년도"></td>
				</tr>
			</table>
			<input type="submit" value="확인">
		</form>

		<br>
		<div>
			<h1>장르별 영화 리스트</h1>
			<table border="1">
				<% int year = 2000;
					while(year < 2020) {
						
					ArrayList<String> list = dao.getProperty(year);
				for (int i=0; i<list.size(); i++) { 
					String str = list.get(i);
				%>
					<td><%=str%></td>
					<%
						if(i%9 == 8 ) {%>
					<tr>
					<td style="background-color: red"></td>
					<td style="background-color: gray"></td>
					<td style="background-color: gray"></td>
					<td style="background-color: gray"></td>
					<td style="background-color: gray"></td>
					<td style="background-color: gray"></td>
					<td style="background-color: gray"></td>
					<td style="background-color: gray"></td>
					<td style="background-color: gray"></td>
					</tr>
						<% }
						}
				year++;
					}
						%>
					
			</table>
		</div>
		
	</section>
	<br><br><br><br><br><br>
	<img class="image" src="../images/minions.png" width="200px">


</body>
</html>