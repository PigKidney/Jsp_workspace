<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
	<h1>ȸ������</h1>
	
	�� �� �� 	: <input id="IDInput" type="text" name="ID"><br>
	��й�ȣ	: <input id="passWordInput" type="password" name="password"><br>
	<button id="createBtn">ȸ������</button> <br>
	
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