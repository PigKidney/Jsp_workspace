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
	<h3>조회 잘됨</h3>
	글 제목 : <input type="text" value="${detail.board_title}" readonly="readonly" name="board_title" form="deleteForm"/> <br> 
	글쓴사람 : <input type="text" value="${detail.board_writer}" readonly="readonly"/> <br> 
	조회수 : ${detail.view_count} 작성일 : ${detail.write_date} <br> 
	<textarea rows="10" cols="30" readonly="readonly" name="board_content" form="deleteForm">${detail.board_content}</textarea> <br> 
	
		<input id="inputPassword" name="board_password"/>
		<button id="modiBtn">수정하기</button>
		<button id="delBtn">삭제하기</button>
		<button id="delBtn2">삭제하기(팝업)</button>
		
	
	<input type="hidden" name="board_password" value="${detail.board_password}" id="hiddenPassword" form="deleteForm"/>
	<input type="hidden" name="board_id" value="${detail.board_id}" form="deleteForm"/>
	<input type="hidden" name="check_password" value="${detail.board_password}" form="deleteForm"/>
	
	<form id="deleteForm" action="./delete" method="post"></form>
	
	<c:url value="/resources/board/js/detail.js" var="detailJS"></c:url>
		<c:url value="/resources/board/js/sha256.js" var="sha256"></c:url>
	
	<script>
		//'' -> 문자열 숫자 차이 
		const boardPassword = '${detail.board_password}';
		const board_id = ${detail.board_id};
	</script>
	<script src="${sha256}"></script>
	<script src="${detailJS}"></script>
</body>
</html>