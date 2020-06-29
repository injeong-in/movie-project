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
		
		
		/*아무것도 입력하지 않았을때*/
		if (member.getUserID() == null) {
			script.println("<script>");
			script.println("alert('아이디를 입력해주세요')");
			script.println("history.back()");
			script.println("</script>");
			return;
		}		
		
		/*아이디 중복 체크*/
		for (String str : list) {
			if (str.equals(id)) {
				script.println(result);
				return;
			}
		}
		
		
		/*아이디 중복값 없을때*/
		for(int i=0; i<list.size(); i++) {
			String str = list.get(i);
			
			//j는 리스트의 사이즈 숫자와 같다. 즉 for문의 i가 리스트사이즈만큼 끝까지 돌았을때만 중복값이 없는것으로 확인한다.
			if(!str.equals(id) && j==i) {
				script.println(result2);
				return;
			}
		}
		
	%>
</body>
</html>