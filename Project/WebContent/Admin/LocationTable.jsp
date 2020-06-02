<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Movie.FmlDao"%>
<%
	request.setCharacterEncoding("UTF-8");
	FmlDao dao = FmlDao.getInstance();
	int i = 0;
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
</style>
<body>
	<section class="container">

		<form action="insertLocation.jsp" method="post">
			<h1>촬영지 정보입력</h1>
			<table border="1">
				<tr>
					<td><input type="text" name="locationName" placeholder="촬영지이름"></td>
				</tr>
				<tr>
					<td><input type="text" name="address" placeholder="주소"></td>
				</tr>
				<tr>
					<td><input type="text" name="country" placeholder="국가명"></td>
				</tr>
				<tr>
					<td><input type="text" name="movieName" placeholder="영화제목"></td>
				</tr>

			</table>
			<input type="submit" value="확인">

			<table border="1">
				<tr>
					<td><input type="text" name="locationID" placeholder="갱신번호"></td>
				</tr>

			</table>
			<input type="submit" value="확인">
		</form>



		<form action="deleteLocationAction.jsp" method="post">
			<h1>촬영지 정보삭제</h1>
			<h5 style="color: red;">둘다 입력하고 확인 누를것! ~_~</h5>
			<h5 style="color: gray;">확인 누르면 무조건 삭제됐다고 뜨니깐 주의하세욤 :)</h5>
			<table border="1">
				<tr>
					<td><input type="text" name="deleteLocation" placeholder="촬영지"></td>
				</tr>
				<tr>
					<td><input type="text" name="deleteMovie" placeholder="영화이름"></td>
				</tr>
			</table>
			<input type="submit" value="확인">
		</form>

		<br>
		<div>
			<h1>촬영지 정보 리스트</h1>
			<table border="1">
				<%
					while (i < 700) {
					i++;
					ArrayList<String> list = dao.getProperty(i);
				%>
				<tr>
					<%
						for (String str : list) {
					%>
					<td><%=str%></td>
					<%
						}
					}
					%>
				</tr>

			</table>
		</div>
	</section>
	
	<img class="image" src="../images/greenteck.jpg">

</body>
</html>