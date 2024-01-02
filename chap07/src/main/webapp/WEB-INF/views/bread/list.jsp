<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.List, chap07.dto.BreadDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bread/css/bread.css">
</head>
<body>

	<h3># All Breads</h3>
	
	
	<div id="bread-list">
	<div class="tag">이 름</div>
	<div class="tag">가 격</div>
	<%
		for (BreadDTO bread : (List<BreadDTO>) request.getAttribute("breads") ){
			out.print(String.format("<div>%s</div> <div>%d</div>", bread.getBread_name(), bread.getBread_price()));
		}
	%>
	</div>
</body>
</html>






