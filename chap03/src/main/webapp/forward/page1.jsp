<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h3>Page1.jsp</h3>
	
	<p>
		<%=request.getParameter("firstName")%> <br>
		<% out.print(request.getParameter("lastName")); %>
		
	</p>
</body>
</html>