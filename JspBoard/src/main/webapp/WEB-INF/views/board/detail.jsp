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
	글 제목 : <input type="text" value="${detail.board_title}" readonly="readonly"/> <br> 
	글쓴사람 : <input type="text" value="${detail.board_writer}" readonly="readonly"/> <br> 
	조회수 : ${detail.view_count} 작성일 : ${detail.write_date} <br> 
	<textarea rows="10" cols="30">${detail.board_content}</textarea> <br> 
</body>
</html>