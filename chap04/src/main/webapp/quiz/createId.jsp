<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
	<h1>회원가입</h1>
	
	<form action="/chap04/quiz/join.jsp" method="post">
		아 이 디 	: <input id="IDInput" type="text" name="ID"><br>
		비밀번호	: <input id="passWordInput" type="password" name="password"><br>
		<input type="submit" value="회원가입">
	</form>
	

</body>
</html>