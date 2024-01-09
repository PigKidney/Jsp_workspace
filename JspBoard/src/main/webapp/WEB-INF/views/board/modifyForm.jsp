<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�� �����ϱ�</title>
</head>
<body>
	<h3>�� �����ϱ�</h3>
	
	�� ���� : <input type="text" name="board_title" value="${oldData.board_title}" form="modiForm"/> <br> 
	�۾���� : "${oldData.board_writer}" <br> 
	��ȸ�� : ${oldData.view_count} �ۼ��� : ${oldData.write_date} <br> 
	<textarea rows="10" cols="30" name="board_content" form="modiForm">${oldData.board_content}</textarea> <br> 
	
	<button id="modiConfirmBtn">����</button>
	<button id="listBtn">���</button>
	
	<!-- POST����� ?id=10 ������� �Ķ���͸� ���� �� ��� hiddenŸ�� input�� ����ؾ� �Ѵ�  -->	
	<input type="hidden" name="board_id" value="${oldData.board_id}" form="modiForm">
	<form id="modiForm" action="./modify" method="post"></form>
	
	<c:url value="/resources/board/js/modi.js" var="modiJS"/>
	<script src="${modiJS}"></script>
</body>
</html>