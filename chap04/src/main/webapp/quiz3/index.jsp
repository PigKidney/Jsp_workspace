<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������ ���</title>
</head>
<body>
	
	<button onclick="location.href='/chap04/quiz3/loginForm.jsp';">�α��� �Ϸ�����</button>
	<button onclick="location.href='/chap04/quiz3/registerForm.jsp';">ȸ������</button>
	
	<h3>#��� ���ø����̼� ���� ��Ʈ����Ʈ ����</h3>
	<ul>
	<% 
		// scope.getAttributeNames() : �ش� ������ ��� ��Ʈ����Ʈ �̸����� ���� �� �ִ� ��ü�� ��ȯ
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
					out.print("alert('�̹� ������� ���̵��Դϴ�!')");					
				} else if(request.getParameter("disc")!=null){
					out.print("alert('���̵� ��� Ȯ���ʿ�!')");
				} else {
					out.print("alert('ȸ�� ���� ����!')");
				}
			}
		%>
	</script>
</body>
</html>