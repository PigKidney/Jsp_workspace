<%@page import="chap07.dto.EmployeeDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.List, chap07.dto.EmployeeDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Employee list</title>
</head>
<body>
	<h3># All Employees</h3>
	
	<%
		Object employees = request.getAttribute("employees");
		
	if(employees != null){
		
		for(EmployeeDTO emp : (List<EmployeeDTO>)employees){
			out.print(String.format("<div>%s</div>", emp));
		}
	} else {
		out.print("<div>No employees here.</div>");
	}
	
	%>
</body>
</html>