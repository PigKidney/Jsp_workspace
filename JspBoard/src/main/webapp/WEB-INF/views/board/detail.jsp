<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h3>��ȸ �ߵ�</h3>
	�� ���� : <input type="text" value="${detail.board_title}" readonly="readonly"/> <br> 
	�۾���� : <input type="text" value="${detail.board_writer}" readonly="readonly"/> <br> 
	��ȸ�� : ${detail.view_count} �ۼ��� : ${detail.write_date} <br> 
	<textarea rows="10" cols="30">${detail.board_content}</textarea> <br> 
</body>
</html>