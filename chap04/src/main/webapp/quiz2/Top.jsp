<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String id = (String)session.getAttribute("id");
	String center = request.getParameter("center");
%>
<%
	if(id!=null){
		%>
		<%=id %> ��
		<button onclick="location.href='Main.jsp?logout=1'">�α׾ƿ�</button>
		<%
	}else if(center==null){
		//center�� ���� �����ϴ� ��쿡�� �α��ι�ư�� ���.
		//ó���� �����ְ� �α��� ��ư�� ������ LoginForm.jsp�� �Ѿ�� Top.jsp�� �ִ� �α��� ��ư�� �״�� ����.
		%>
		<button onclick="location.href='Main.jsp?center=LoginForm.jsp'">�α���</button>
		<% 
	}	
	else{
		%>
	<%} 
	%>
</body>
</html>