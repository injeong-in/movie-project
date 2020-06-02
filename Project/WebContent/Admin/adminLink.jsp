<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%  
			
			
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
	a {
	font-size: 20px;
	
	}
	a: hover {
	background:url('../images/minions.png');
	}
	
	div {
	margin-bottom: 10px;
	}
	
	.container {
		  position: absolute; 
		  padding: 20px; 
		  width: 485px; 
		  background-color: #EEEFF1; 
		  border-radius: 5px; 
		  top: 50%; 
		  left: 50%; 
		  transform: translate(-50%, -50%); 
	}
	
</style>
</head>
<body>
	<section class="container">
	<h1 style="color: red;">주말을
	 다바쳐 만든</h1>
	<h1>DB 관리자 페이지</h1>
	<h5 style="color: red;">삭제할때 확인 누르면 무조건 삭제됐다고 뜨니깐 주의! :)</h5>
	<div><a href="http://192.168.0.54/Project/Admin/LocationTable.jsp">촬영지 DB입력 페이지</a></div>
	<div><a href="http://192.168.0.54/Project/Admin/MovieTable.jsp">영화 DB입력 페이지</a></div>
	<div><a href="http://192.168.0.54/Project/Admin/GenreTable.jsp">장르 DB입력 페이지</a></div>
	<div><a href="http://192.168.0.54/Project/Admin/insertActor.jsp">영화배우 DB입력 페이지</a></div>
	<img src="../images/maru.png">
	</section>
</body>
</html>