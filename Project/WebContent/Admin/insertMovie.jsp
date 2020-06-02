<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Movie.MovieDao" %>
<jsp:useBean id="dto" class="Movie.MovieDTO"></jsp:useBean>
<jsp:setProperty property="title" name="dto" param="title"/>
<jsp:setProperty property="filmingLocation" name="dto" param="filmingLocation"/>
<jsp:setProperty property="figures" name="dto" param="figures"/>
<jsp:setProperty property="releasedYear" name="dto" param="releasedYear"/>
<jsp:setProperty property="audienceNumber" name="dto" param="audienceNumber"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%  
		MovieDao dao = MovieDao.getInstance();
		int result = dao.insertProperty(dto);
		PrintWriter script = response.getWriter();
		
		if(result == -1) {
			String str = "<script> alert('DB오류입니다'); history.back(); </script>";
			script.println(str);
		} else {
			script.println("<script>");
			script.println("alert('입력완료')");
			script.println("location.href='MovieTable.jsp'");
			script.println("</script>");
		}
			
%>
</body>
</html>