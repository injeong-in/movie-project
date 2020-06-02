<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Movie.MovieDao" %>
<jsp:useBean id="movie" class="Movie.MovieDTO"></jsp:useBean>
<jsp:setProperty property="deleteName" name="movie" param="deleteName"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%  
		MovieDao dao = MovieDao.getInstance();
		PrintWriter script = response.getWriter();
		
		
		String deleteResult = dao.deleteProperty(movie);
		
		if(deleteResult.equals("-1")) {
			String str = "<script> alert('삭제오류입니다'); history.back(); </script>";
			script.println(str);
		}
		
		if(deleteResult.equals("0")){
			script.println("<script>");
			script.println("alert('삭제되었습니다')");
			script.println("location.href='MovieTable.jsp'");
			script.println("</script>");
		}
%>
</body>
</html>