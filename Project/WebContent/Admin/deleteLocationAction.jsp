<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Movie.FmlDao" %>
<jsp:useBean id="dto" class="Movie.FmlDTO"></jsp:useBean>
<jsp:setProperty property="deleteMovie" name="dto" param="deleteMovie"/>
<jsp:setProperty property="deleteLocation" name="dto" param="deleteLocation"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%  
		FmlDao dao = FmlDao.getInstance();
		PrintWriter script = response.getWriter();
		
		
		String deleteResult = dao.deleteProperty(dto);
		
		if(deleteResult.equals("-1")) {
			String str = "<script> alert('삭제오류입니다'); history.back(); </script>";
			script.println(str);
		}
		
		if(deleteResult.equals("0")){
			script.println("<script>");
			script.println("alert('삭제되었습니다')");
			script.println("location.href='LocationTable.jsp'");
			script.println("</script>");
		}
%>
</body>
</html>