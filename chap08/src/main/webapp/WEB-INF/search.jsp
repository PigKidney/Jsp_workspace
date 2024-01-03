<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.List, chap08.dto.EmployeeDTO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>사원 검색해보기</title>
</head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/empList.css">

<body>
	<h3># Search</h3>
	
	<ul>
		<li>검색을 통해 사원들을 조회할 수 있는 페이지를 만들어 보세요</li>
		<li>검색할 수 있는 컬럼 : first_name, last_name, department_name</li>
		<li>검색어를 직접 입력하고 검색 버튼을 누르면 사원들이 조회되어야 한다</li>
	</ul>
	
	<form action="./reset" method="post">
		<input type="submit" value="전부조회"/>
	</form>
	<div class="emp-list">
	<%
		Object employees = request.getAttribute("employees");
	/* 	EmployeeDTO emps = (EmployeeDTO)request.getAttribute("emp");
		out.print(emps); */
	if(employees != null ){
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
	} /* else if(emps != null){
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
		out.print(emps.getDivRow());
	} */ else {
		out.print("<div>No employees here.</div>");
	}
	%>
	</div>
	
   
	<form action="./frist_name" method="post">
		frist_name : <input type="text" name="first_name">
		<input type="submit" value="검색하기"/>
	</form>
	
	<form action="./last_name" method="post">
		last_name : <input type="text" name="last_name">
		<input type="submit" value="검색하기"/>
	</form>
	
	<form action="./department_id" method="post">
		department_id : <input type="text" name="department_id">
		<input type="submit" value="검색하기"/>
	</form>
</body>
</html>