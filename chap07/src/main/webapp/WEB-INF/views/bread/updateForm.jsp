<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Update bread</title>
</head>
<body>
	<h3># �� ���� ����</h3>
	
	<form action="./update" method="post">
		�̸� : <input type="text" name="bread_name"> <br>
		���� : <input type="number" min="0" step="100" name="bread_price"> <br>
		<input type="submit" value="�����ϱ�"/>
	</form>
</body>
</html>