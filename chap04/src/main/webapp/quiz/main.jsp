<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�޸���</title>
</head>
<body>
	<h1>�޸���</h1>
	
	<textarea id="memo" rows="50" cols="150"></textarea><br>
	<button id="saveData">�޸�����</button>
	<button id="loadData">�ҷ�����</button>
	<button id="logoutBtn" onclick="location.href='/chap04/quiz/login.jsp'">�α׾ƿ�</button>
	
	<script type="text/javascript">
		const logoutBtn = document.getElementById("logoutBtn");
		logoutBtn.addEventListener('click', (e) => {
			HttpSession userSession = request.getSession();
			userSession.invalidate();
		});
		
		
		const saveData = document.getElementById("saveData");
		saveData.addEventListener('click', (e) => {
			session.setAttribute("memo", memo.value);
		})
		
		const loadData = document.getElementById("loadData");
		loadData.addEventListener('click', (e) => {
			session.getAttribute("memo");
		})
	</script>
</body>
</html>