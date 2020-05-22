<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Movie.ActorDao" %>
<jsp:useBean id="actor" class="Movie.ActorDTO"></jsp:useBean>
<jsp:setProperty property="deleteName" name="actor" param="deleteName"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%  
		ActorDao dao = ActorDao.getInstance();
		PrintWriter script = response.getWriter();
		
		
		String deleteResult = dao.deleteProperty(actor);
		
		if(deleteResult.equals("-1")) {
			String str = "<script> alert('삭제오류입니다'); history.back(); </script>";
			script.println(str);
		}
		
		if(deleteResult.equals("0")){
			script.println("<script>");
			script.println("alert('삭제되었습니다')");
			script.println("location.href='insertActor.jsp'");
			script.println("</script>");
		}
%>
</body>
</html>