<%@page import="org.apache.tomcat.util.digester.EnvironmentPropertySource"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�޸���</title>
</head>
<body>
<% String str = session.getAttribute("memo").toString(); %>
	<h1>�޸���</h1>
	<form action="/chap04/quiz/join.jsp" method="post">
		<textarea id="memo" rows="50" cols="150" name="memo"></textarea><br>
		<input type="submit" value="����" id="saveBtn">
	</form>
		<button id="loadData">�ҷ�����</button>
		<button id="logoutBtn" onclick="location.href='/chap04/quiz/login.jsp'">�α׾ƿ�</button>
	
	<script type="text/javascript">
		const logoutBtn = document.getElementById("logoutBtn");
		logoutBtn.addEventListener('click', (e) => {
			HttpSession userSession = request.getSession();
			userSession.invalidate();
			response.sendRedirect("/chap04/quiz/login.jsp");
		});
		const memo = document.getElementById('memo');
		const saveBtn = document.getElementById("saveBtn");
		saveBtn.addEventListener('click', (e) => {
			memo.value = session.getAttribute("user").getMemo().toString();
			memo.append(session.getAttribute("user").getMemo().toString());
		});
		const loadData = document.getElementById('loadData');
		loadData.addEventListener('click', (e) => {
			memo.value = str;
		});
	</script>
</body>
</html>