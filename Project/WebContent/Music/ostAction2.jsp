<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Music.musicDao" %>
<%@ page import="Music.musicDTO" %>

<jsp:useBean id="dto" class="Music.musicDTO"></jsp:useBean>
<jsp:setProperty property="movieTitle" name="dto" param="q_search"/>

<%

	String title = request.getParameter("q_search");
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="../js/jquery-2.1.3.min.js"></script>
<title>Insert title here</title>
<style>
/*검색창 디자인*/
body {
	margin: 0;
	padding: 0;
}

.header {
	height: 50vh;
	background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)),
		url(image.jpg);
	background-size: cover;
	background-position: center;
	display: flex;
	justify-content: center;
	align-items: center;
	font-family: sans-serif;
}

h1 {
	color: #fff;
	margin-bottom: 70px;
	font-size: 45px;
	letter-spacing: 2px;
	text-align: center;
}

.search-field {
	height: 50px;
	padding: 10px;
	border: none;
	border-radius: 25px;
	outline: none;
}

.business {
	width: 400px;
}

.location {
	width: 200px;
}

.search-btn {
	height: 50px;
	width: 150px;
	background: #ffeb3b;
	border: none;
	color: #000;
	border-radius: 25px;
}

.search-btn: hover {
	background: #ffc107;
	cusor: pointer;
}

.form-box {
	background: rgba(0, 0, 0, 0.5);
	padding: 30px;
}

.pad {
	position: relative;
	border: 1px solid red;
}

.pad img {
	margin-left: 15px;
}

.pad a {
	display: inline-block;
	font-weight: bold;
	font-size: 20px;
	position: absolute;
	padding: 14px 2px 15px 50px;
}


.image {
	position: absolute;
	left: 770px;
}
</style>

</head>
<body>
<%  
			musicDao dao = musicDao.getInstance();
			String value = dao.goStraight(title);
			PrintWriter script = response.getWriter();
			if(value.equals("0")) {
				ArrayList<musicDTO> list = dao.getProperty(title);
				dto = list.get(0);
				int url = dto.getBoardID();
				script.println("<script>");
				script.println("location.href='ost-"+url+".jsp'");
				script.println("</script>");
				return;
			}
			
			if(value.equals("-1")) {
				script.println("<script>");
				script.println("location.href='ost-search.jsp'");
				script.println("</script>");
			}
			
%>
	
</body>
</html>