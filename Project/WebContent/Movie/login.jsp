<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Movie.Dao" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	
table { 
		  position: absolute; 
		  padding: 20px; 
		  width: 300px; 
		  background-color: #EEEFF1; 
		  border-radius: 5px; 
		  top: 50%; 
		  left: 50%; 
		  transform: translate(-50%, -50%); 
} 
	
</style>

</head>
<body>
	
	<form action="loginAction.jsp" method="post">
		<table border="1">
		<h1 style="text-align: center; margin-top: 250px;">로그인</h1>
			<tr>
				<td>ID</td>
				<td><input type="text" name="userID" placeholder="입력하세요"></td>
			</tr>
			<tr>
				<td>PW</td>
				<td><input type="password" name="userPW"></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" name="login-button" value="로그인"></td>
			</tr>
		</table>
	</form>

</body>
</html>