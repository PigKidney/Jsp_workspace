<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>�α���</h1>

	<form action="/chap04/quiz/join.jsp" method="get">
		�� �� �� 	: <input id="IDInput" type="text" name="loginId"><br>
		��й�ȣ	: <input id="passWordInput" type="password" name="loginPassword"><br>
		<input type="submit" value="�α���">
	</form>
		<button onclick="location.href='/chap04/quiz/createId.jsp'">ȸ������</button>
		
</body>
</html>