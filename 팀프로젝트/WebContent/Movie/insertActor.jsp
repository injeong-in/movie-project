<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Movie.ActorDao"%>
<jsp:useBean id="actor" class="Movie.ActorDTO"></jsp:useBean>
<jsp:setProperty property="name" name="actor" />
<%
	request.setCharacterEncoding("UTF-8");
ActorDao dao = ActorDao.getInstance();
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

		<form action="insertActorAction.jsp" method="post">
			<h1>영화배우 정보입력</h1>
			<table border="1">
				<tr>
					<td><input type="text" name="name" placeholder="배우이름"></td>
				</tr>
				<tr>
					<td><input type="text" name="gender" placeholder="성별(남 or여)"></td>
				</tr>
				<tr>
					<td><input type="text" name="country" placeholder="국적"></td>
				</tr>
				<tr>
					<td><input type="text" name="movie" placeholder="영화제목"></td>
				</tr>

			</table>
			<input type="submit" value="확인">

			<table border="1">
				<tr>
					<td><input type="text" name="actorID" placeholder="갱신번호"></td>
				</tr>

			</table>
			<input type="submit" value="확인">
		</form>



		<form action="deleteActorAction.jsp" method="post">
			<h1>영화배우 정보삭제</h1>
			<table border="1">
				<tr>
					<td><input type="text" name="deleteName" placeholder="배우이름"></td>
				</tr>
			</table>
			<input type="submit" value="확인">
		</form>

		<br>
		<div>
			<h1>배우정보 리스트</h1>
			<table border="1">
				<%
					while (i < 100) {
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




</body>
</html>