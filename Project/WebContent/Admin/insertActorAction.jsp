<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Movie.ActorDao" %>
<jsp:useBean id="actor" class="Movie.ActorDTO"></jsp:useBean>
<jsp:setProperty property="name" name="actor" param="name"/>
<jsp:setProperty property="gender" name="actor" param="gender"/>
<jsp:setProperty property="country" name="actor" param="country"/>
<jsp:setProperty property="movie" name="actor" param="movie"/>
<jsp:setProperty property="actorID" name="actor" param="actorID"/>
<jsp:setProperty property="birthday" name="actor" param="birthday"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%  
		ActorDao dao = ActorDao.getInstance();
		int result = dao.insertProperty(actor);
		System.out.println(result);
		PrintWriter script = response.getWriter();
		
		if(result == -1) {
			String str = "<script> alert('DB오류입니다'); history.back(); </script>";
			script.println(str);
		} else {
			script.println("<script>");
			script.println("alert('입력완료')");
			script.println("location.href='insertActor.jsp'");
			script.println("</script>");
		}
			
		
		String actorID = dao.modifyIdNumber(Integer.parseInt("actorID"));
		if(actorID.equals("-1")) {
			String str = "<script> alert('DB오류입니다'); history.back(); </script>";
			script.println(str);
		} else {
			script.println("<script>");
			script.println("alert('ID갱신완료')");
			script.println("location.href='insertActor.jsp'");
			script.println("</script>");
		}
%>
</body>
</html>