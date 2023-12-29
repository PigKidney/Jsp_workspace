<%@page import="chap07.dto.EmployeeDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.List, chap07.dto.EmployeeDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Employee list</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/dbtest/css/empList.css">
</head>
<body>
	<h3># All Employees</h3>
	<div class="emp-list">
	<%
		Object employees = request.getAttribute("employees");
		
	if(employees != null){
 		out.print("<div class=\"name\">employee_id</div>"
				+ "<div class=\"name\">first_name</div>"
				+ "<div class=\"name\">last_name</div>"
				+ "<div class=\"name\">email</div>"
				+ "<div class=\"name\">phone_number</div>"
				+ "<div class=\"name\">salary</div>"
				+ "<div class=\"name\">commission_pct</div>"
				+ "<div class=\"name\">hire_date</div>"
				+ "<div class=\"name\">job_id</div>"
				+ "<div class=\"name\">manager_id</div>"
				+ "<div class=\"name\">department_id</div>");
 		for(EmployeeDTO emp : (List<EmployeeDTO>)employees){
			out.print(emp.getDivRow());
		}
	} else {
		out.print("<div>No employees here.</div>");
	}
	
	%>
	</div>
</body>
</html>