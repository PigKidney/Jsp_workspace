<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인</h1>

	<form action="/chap04/quiz/join.jsp" method="post">
		아 이 디 	: <input id="IDInput" type="text" name="ID"><br>
		비밀번호	: <input id="passWordInput" type="password" name="password"><br>
		<input type="submit" value="로그인">
	</form>
		<button onclick="location.href='/chap04/quiz/createId.jsp'">회원가입</button>
		
</body>
</html>