<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="chap08.model.Student, java.util.ArrayList" %>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	ArrayList<Student> stus = new ArrayList<>();

	// DB���� �л� ���� ���� ��ȸ�� �����Ͷ�� ����
	stus.add(new Student("A123", "���ڹ�", 20, 80, 80, 80));
	stus.add(new Student("A235", "���̽�", 20, 70, 80, 80));
	stus.add(new Student("A555", "�־���", 20, 80, 88, 80));
	stus.add(new Student("A611", "��Ʋ��", 20, 80, 89, 80));
	stus.add(new Student("A999", "���", 20, 70, 80, 90));
	stus.add(new Student("A757", "���γ�", 20, 80, 100, 40));
	
	pageContext.setAttribute("students", stus);
	
	Student stu = new Student();

	// DB���� �л� �Ѹ��� ��ȸ�� �����Ͷ�� ����
	stu.setStu_age(15);
	stu.setStu_id("STU1234");
	stu.setStu_name("�踻��");
	stu.setStu_kor(100);
	stu.setStu_eng(80);
	stu.setStu_math(70);

	pageContext.setAttribute("stu1", stu);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>EL</title>
</head>
<body>

	<h3># JSP Expression Language (EL)</h3>
	
	<ul>
		<li>JSP���� ��Ʈ����Ʈ�� �Ƿ��ִ� ������ �����ϰ� ���� �� �� �ִ� ����</li>
		<li>������ ������� Javascript�� format string�� �Ȱ��� ���ܼ� JSP ���ο����� �浹�� �߻��Ѵ�</li>
		<li>��Ʈ����Ʈ�� ��ü�� ����ִ� ��� �ش� ��ü�� getter�� ���� �Ӽ��� ���� ����� �� �ִ�</li>
	</ul>
	
	<h5># EL�� ��ü�� ȣ���� ����ϴ� ���</h5>
	
	<ul>
		<li>${stu1}</li>
		<li>${stu1.stu_name}</li>
		<li>${stu1.stu_kor}</li>
		<li>${stu1.stu_math}</li>
	</ul>
	
	<h5># �ݺ����� �Բ� Ȱ���غ���</h5>
	<table>
		<tr>
			<th>�й�</th>
			<th>�̸�</th>
			<th>����</th>
			<th>����</th>
			<th>����</th>
			<th>����</th>
			
		</tr>
		<core:forEach items="${students}" var="student">
		<tr>
			<th>${student.stu_id}</th>
			<th>${student.stu_name}</th>
			<th>${student.stu_age}</th>
			<th>${student.stu_kor}</th>
			<th>${student.stu_eng}</th>
			<th>${student.stu_math}</th>
			
		</tr>
		</core:forEach>
		
	</table>
	
	<core:set var="food" value="�Ľ�Ÿ"/>
	<script type="text/javascript">
		const food = '������';
		console.log('���� �޴��� ${food}�Դϴ�.');
		console.log('���� �޴��� ${'${food}'}�Դϴ�.');

	</script>
</body>
</html>