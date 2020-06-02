<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="genre" class="Movie.GenreDTO"></jsp:useBean>
<%@ page import="Movie.GenreDao" %>
<jsp:setProperty property="deleteYear" name="genre" param="deleteYear"/>
<%  
			
			
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%  
		GenreDao dao = GenreDao.getInstance();
		PrintWriter script = response.getWriter();
		
		
		String deleteResult = dao.deleteProperty(genre);
		
		if(deleteResult.equals("-1")) {
			String str = "<script> alert('삭제오류입니다'); history.back(); </script>";
			script.println(str);
		}
		
		if(deleteResult.equals("0")){
			script.println("<script>");
			script.println("alert('삭제되었습니다')");
			script.println("location.href='GenreTable.jsp'");
			script.println("</script>");
		}
%>
</body>
</html>