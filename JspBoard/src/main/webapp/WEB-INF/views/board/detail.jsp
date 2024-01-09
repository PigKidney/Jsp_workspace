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
	�� ���� : <input type="text" value="${detail.board_title}" readonly="readonly" name="board_title" form="deleteForm"/> <br> 
	�۾���� : <input type="text" value="${detail.board_writer}" readonly="readonly"/> <br> 
	��ȸ�� : ${detail.view_count} �ۼ��� : ${detail.write_date} <br> 
	<textarea rows="10" cols="30" readonly="readonly" name="board_content" form="deleteForm">${detail.board_content}</textarea> <br> 
	
		<input id="inputPassword" name="board_password"/>
		<button id="modiBtn">�����ϱ�</button>
		<button id="delBtn">�����ϱ�</button>
		<button id="delBtn2">�����ϱ�(�˾�)</button>
		
	
	<input type="hidden" name="board_password" value="${detail.board_password}" id="hiddenPassword" form="deleteForm"/>
	<input type="hidden" name="board_id" value="${detail.board_id}" form="deleteForm"/>
	<input type="hidden" name="check_password" value="${detail.board_password}" form="deleteForm"/>
	
	<form id="deleteForm" action="./delete" method="post"></form>
	
	<c:url value="/resources/board/js/detail.js" var="detailJS"></c:url>
		<c:url value="/resources/board/js/sha256.js" var="sha256"></c:url>
	
	<script>
		//'' -> ���ڿ� ���� ���� 
		const boardPassword = '${detail.board_password}';
		const board_id = ${detail.board_id};
	</script>
	<script src="${sha256}"></script>
	<script src="${detailJS}"></script>
</body>
</html>