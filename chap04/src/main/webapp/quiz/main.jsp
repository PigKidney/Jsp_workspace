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
	<h1>�޸���</h1>
	<form action="/chap04/quiz/join.jsp" method="post">
		<textarea id="memo" rows="50" cols="150" name="memo"><% out.append(session.getAttribute("memo").toString()); %></textarea><br>
		<input type="submit" value="����">
	</form>
		<!-- <button id="loadData">�ҷ�����</button> -->
		<button id="logoutBtn" onclick="location.href='/chap04/quiz/login.jsp'">�α׾ƿ�</button>
	
	<script type="text/javascript">
		const logoutBtn = document.getElementById("logoutBtn");
		logoutBtn.addEventListener('click', (e) => {
			HttpSession userSession = request.getSession();
			userSession.invalidate();
			response.sendRedirect("/chap04/quiz/login.jsp");
		});
	
	</script>
</body>
</html>