<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Movie.GenreDao" %>
<jsp:useBean id="dto" class="Movie.GenreDTO"></jsp:useBean>
<jsp:setProperty property="releasedYear" name="dto" param="releasedYear"/>
<jsp:setProperty property="actionMovie" name="dto" param="actionMovie"/>
<jsp:setProperty property="horror" name="dto" param="horror"/>
<jsp:setProperty property="romance" name="dto" param="romance"/>
<jsp:setProperty property="comedy" name="dto" param="comedy"/>
<jsp:setProperty property="animation" name="dto" param="animation"/>
<jsp:setProperty property="musical" name="dto" param="musical"/>
<jsp:setProperty property="family" name="dto" param="family"/>
<jsp:setProperty property="drama" name="dto" param="drama"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%  
		GenreDao dao = GenreDao.getInstance();
		int result = dao.insertProperty(dto);
		PrintWriter script = response.getWriter();
		
		if(result == -1) {
			String str = "<script> alert('DB오류입니다'); history.back(); </script>";
			script.println(str);
		} else {
			script.println("<script>");
			script.println("alert('입력완료')");
			script.println("location.href='GenreTable.jsp'");
			script.println("</script>");
		}
			
%>
</body>
</html>