<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입 양식</title>
</head>
<body>
	
	<button onclick="location.href='/chap04/quiz3/loginForm.jsp';">로그인 하러가기</button>
	<button onclick="location.href='/chap04/quiz3/registerForm.jsp';">회원가입</button>
	
	<h3>#모든 어플리케이션 영역 어트리뷰트 찍어보기</h3>
	<ul>
	<% 
		// scope.getAttributeNames() : 해당 영역의 모든 어트리뷰트 이름들을 꺼낼 수 있는 객체를 반환
		java.util.Enumeration<String> names = application.getAttributeNames();
		
		while(names.hasMoreElements()){
			String name = names.nextElement();
				out.print(String.format("<li>%s=%s</li>",name,application.getAttribute(name)));
		}
	%>
	</ul>
	
	<script>
		<%
			if(request.getParameter("error")!=null){ 
				if(request.getParameter("dup")!=null){
					out.print("alert('이미 사용중인 아이디입니다!')");					
				} else if(request.getParameter("disc")!=null){
					out.print("alert('아이디 비번 확인필요!')");
				} else {
					out.print("alert('회원 가입 실패!')");
				}
			}
		%>
	</script>
</body>
</html>