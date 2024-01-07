<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
// 서버측에서 쿠키 추가하기


// 쿠키는 전부 문자열
Cookie cookie = new Cookie("nmpm", "1");
cookie.setMaxAge(30);
cookie.setHttpOnly(true); // HttpOnly는 JS 측에서 사용할 수 없게 한다(보안)

response.addCookie(cookie);


%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>꺼짐</title>
</head>
<body>

<script>
window.close();
</script>


</body>
</html>