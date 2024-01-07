<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="chap08.dao.EmployeeDAO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    	//파라미터 요청
    	String searchQuery = request.getParameter("searchQuery");
    	String searchType = request.getParameter("searchType");
    	
    	
    	System.out.println(searchQuery);
    	System.out.println(searchType);
    	
    	//DB가서 꺼내기
    	EmployeeDAO dao = new EmployeeDAO();
    	
    	//꺼낸 값 세팅
    	request.setAttribute("emps",dao.search(searchType,searchQuery));
    	//back 과 front의 분리
%>
    
    <%--forward() --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<h3># 검색결과</h3>

<c:forEach items="${emps}" var="emp">
	<div>${emp }</div>
</c:forEach>

</body>
</html>