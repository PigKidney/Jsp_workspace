<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Update bread</title>
</head>
<body>
	<h3># 빵 가격 수정</h3>
	
	<form action="./update" method="post">
		이름 : <input type="text" name="bread_name"> <br>
		가격 : <input type="number" min="0" step="100" name="bread_price"> <br>
		<input type="submit" value="수정하기"/>
	</form>
</body>
</html>