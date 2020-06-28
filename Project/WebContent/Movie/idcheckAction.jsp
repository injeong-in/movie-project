<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Movie.Dao"%>
<jsp:useBean id="member" class="Movie.UserDTO"></jsp:useBean>
<jsp:setProperty property="userID" name="member" param="userID"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Dao dao = Dao.getInstance(); //데이터 연결객체 생성

		ArrayList<String> list = dao.idCheck(); //아이디 리스트 가져오기
		PrintWriter script = response.getWriter();
		String id = member.getUserID(); //브라우저 리퀘스트 입력값 담기
		
		int j = list.size()-1;
		
		String result = "<script> alert('중복된 아이디 입니다');" 
		+ "history.back(); </script>";
		
		String result2 = "<script> alert('사용가능한 아이디 입니다');" 
				+ "history.back(); </script>";
		
		int num = list.size();
		
		if (member.getUserID() == null || member.getUserPW() == null || member.getUserName() == null
				|| member.getEmail() == null || member.getPhoneNumber() == null) {
			script.println("<script>");
			script.println("alert('아이디를 입력해주세요')");
			script.println("history.back()");
			script.println("</script>");
			return;
		}		
				
		for (String str : list) {
			if (str.equals(id)) {
				script.println(result);
				return;
			}
		}
		
		for(int i=0; i<list.size(); i++) {
			String str = list.get(i);
			
			if(!str.equals(id) && j==i) {
				script.println(result2);
				return;
			}
		}
		
	%>
</body>
</html>