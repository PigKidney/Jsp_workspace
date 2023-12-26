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
	
	아 이 디 	: <input id="IDInput" type="text" name="ID"><br>
	비밀번호	: <input id="passWordInput" type="password" name="password"><br>
	<button id="createBtn">회원가입</button> <br>
	
	<script type="text/javascript">
	const loginBtn = document.getElementById("createBtn");
	const IDInput = document.getElementById("IDInput");
	const passWordInput = document.getElementById("passWordInput");

	createBtn.addEventListener('click', (e) => {
		location.href = 
			'/chap04/quiz/join.jsp?ID='+ IDInput.value +'&scope=ID'+'&password='+ passWordInput.value +'&scope=password';
	});
	</script>
</body>
</html>