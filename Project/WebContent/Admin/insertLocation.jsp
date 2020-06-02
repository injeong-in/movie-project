<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Movie.FmlDao" %>
<jsp:useBean id="dto" class="Movie.FmlDTO"></jsp:useBean>
<jsp:setProperty property="locationName" name="dto" param="locationName"/>
<jsp:setProperty property="address" name="dto" param="address"/>
<jsp:setProperty property="country" name="dto" param="country"/>
<jsp:setProperty property="movieName" name="dto" param="movieName"/>
<jsp:setProperty property="locationID" name="dto" param="locationID"/>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%  
		FmlDao dao = FmlDao.getInstance();
		int result = dao.insertProperty(dto);
		System.out.println(result);
		PrintWriter script = response.getWriter();
		
		if(result == -1) {
			String str = "<script> alert('DB오류입니다'); history.back(); </script>";
			script.println(str);
		} else {
			script.println("<script>");
			script.println("alert('입력완료')");
			script.println("location.href='LocationTable.jsp'");
			script.println("</script>");
		}
			
		
		String actorID = dao.modifyIdNumber(Integer.parseInt("locationID"));
		if(actorID.equals("-1")) {
			String str = "<script> alert('DB오류입니다'); history.back(); </script>";
			script.println(str);
		} else {
			script.println("<script>");
			script.println("alert('ID갱신완료')");
			script.println("location.href='LocationTable.jsp'");
			script.println("</script>");
		}
%>
</body>
</html>