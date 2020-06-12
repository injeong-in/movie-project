<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="Movie.Dao"%>
<jsp:useBean id="user" class="Movie.UserDTO"></jsp:useBean>
<jsp:setProperty property="userID" name="user" param="userID" />
<jsp:setProperty property="userPW" name="user" param="userPW" />
<%
	request.setCharacterEncoding("UTF-8");

	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	
	PrintWriter script = response.getWriter();
	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입페이지</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<style>
table {
	position: absolute;
	padding: 20px;
	width: 500px;
	background-color: #EEEFF1;
	border-radius: 5px;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}
</style>

</head>
<body>

	<form id="fm" onsubmit="return check(this);"
		action="memberJoinAction.jsp" method="post">
		<table border="1">
			<h1 style="text-align: center; margin-top: 190px;">회원가입</h1>
			<th colspan="2" align="center" bgcolor="darkgray" spanstyle="color: white">회원 기본 정보</th>
			<tr>
				<td align="center">ID</td>
				<td><input type="text" name="userID" id="userID"></td>
			</tr>
			
			<tr>
				<td align="center">아이디 중복검사</td>
				<td><input type="button" value="확인" onclick="idFind2()"></td>
			</tr>
			
			<tr>
				<td align="center">PW</td>
				<td><input type="password" name="userPW"></td>
			</tr>
			<tr>
				<td align="center">PW확인</td>
				<td><input type="password" placeholder="영어+특수문자+숫자를 섞어서 (8~16)자리" name="correctPassword"></td>
			</tr>
			<tr>
				<td align="center">이름</td>
				<td><input type="text" name="userName"></td>
			</tr>
			<tr>
				<td align="center">이메일</td>
				<td><input type="email" name="email"></td>
			</tr>
			<tr>
				<td align="center">연락처</td>
				<td><input type="text" name="phone"></td>
			</tr>
			<tr>

				<td colspan="2" align="center"><input type="submit"
					name="join-button" value="회원가입"> <input type="button"
					value="검사" onclick="check()"> <input type="button"
					value="초기화" onclick="inputClear()"></td>
			</tr>

		</table>
	</form>
	<%
		if (userID != null) {
	%>
	<div class="logout">
		<h1>로그아웃 하시겠습니까?</h1>
		<form action="logoutAction.jsp" method="get">
			<input type="submit" name="logout-button" value="로그아웃">
		</form>
	</div>
	<%
		} else {
	%>

	<div>
		기존의 계정이 있으시다면?
		<form action="login.jsp" method="get">
			<input type="submit" name="login-button" value="로그인 하러가기">
		</form>
	</div>


	<%
		}
	%>

	<script>
	var text ="";
	var count = 0;
	
	function print() {
	    alert("asdf")
	}
	
	function idFind() {
	      let inputId = document.getElementsByName('userID');
	      location.href = 'idcheckAction.jsp?userID=' + inputId[0].value;
	   }
	
	function idFind2() {
		var userID = $('#userID').val();
		$.ajax ({
			type:'POST',
			url:'idcheckAction.jsp',
			data: {userID: userID},
			success: function(result) {
				if(result ==1) {
					$('#checkMessage').html('사용할 수 있는 아이디입니다.');
					$('#checkType').attr('class', 'modal-content panel-success');
				} else {
					$('#checkMessage').html('사용할 수 없는 아이디입니다.');
					$('#checkType').attr('class', 'modal-content panel-warning');
				}
				$('#checkModal').modal("show");
			}
		});
	}
	
	
	function inputClear() {				
		document.getElementById("fm").reset();
	}
	
	
	function check() {
		count ++;
		//dom객체 찾기
		var userID = document.getElementsByName("userID");
		var userPW = document.getElementsByName("userPW");
		var correctPassword = document.getElementsByName("correctPassword");
		var userName = document.getElementsByName("userName");
		var email = document.getElementsByName("email");
		var phone = document.getElementsByName("phone");

		//정규표현식
		var idPattern = /^[a-zA-Z0-9]{4,12}$/;
		var pwPattern = /^[a-zA-Z0-9]{4,12}$/;
		var emailPattern = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
		var phonePattern = /(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/g;
		
		//아이디 유효성 검사
		if (idPattern.test(userID[0].value) == true) {
			text += "ID : " + userID[0].value + "\n";
			
		} else { 
			alert("아이디를 잘못 입력 하셨습니다.");
		}
		
		
		//비밀번호 유효성 검사
		if((pwPattern.test(userPW[0].value) == true) && 
            (pwPattern.test(correctPassword[0].value) == true)
            && (userPW[0].value == correctPassword[0].value))
               text += "PW : " + userPW[0].value + "\n";
              
     	 else 
                 alert("패스워드가 일치 하지 않습니다.");
		
		
		//이메일 유효성 검사
		if (emailPattern.test(email[0].value) == true) {
			text += "EMAIL : " + email[0].value + "\n";
		} else {
			alert("이메일을 잘못 입력 하셨습니다.");
		}
		
		
		//폰번호 유효성 검사
		if (phonePattern.test(phone[0].value) == true) {
			text += "PHONE : " + phone[0].value + "\n";
		} else {
			alert("폰번호 형식이 잘못 되었습니다.");
		}
		
		alert(text);
		
		if(count == 0+count)
	        text = [];
	}
	
	
</script>


</body>
</html>