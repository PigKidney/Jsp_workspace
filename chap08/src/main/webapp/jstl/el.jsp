<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="chap08.model.Student, java.util.ArrayList" %>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	ArrayList<Student> stus = new ArrayList<>();

	// DB에서 학생 여러 행을 조회한 데이터라고 가정
	stus.add(new Student("A123", "김자바", 20, 80, 80, 80));
	stus.add(new Student("A235", "박이썬", 20, 70, 80, 80));
	stus.add(new Student("A555", "최씨플", 20, 80, 88, 80));
	stus.add(new Student("A611", "고틀린", 20, 80, 89, 80));
	stus.add(new Student("A999", "김고", 20, 70, 80, 90));
	stus.add(new Student("A757", "고로나", 20, 80, 100, 40));
	
	pageContext.setAttribute("students", stus);
	
	Student stu = new Student();

	// DB에서 학생 한명을 조회한 데이터라고 가정
	stu.setStu_age(15);
	stu.setStu_id("STU1234");
	stu.setStu_name("김말이");
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
		<li>JSP에서 어트리뷰트에 실려있는 값들을 간단하게 꺼내 쓸 수 있는 문법</li>
		<li>문법의 생김새가 Javascript의 format string과 똑같이 생겨서 JSP 내부에서는 충돌이 발생한다</li>
		<li>어트리뷰트에 객체가 들어있는 경우 해당 객체의 getter를 통해 속성을 꺼내 사용할 수 있다</li>
	</ul>
	
	<h5># EL로 객체를 호출해 사용하는 경우</h5>
	
	<ul>
		<li>${stu1}</li>
		<li>${stu1.stu_name}</li>
		<li>${stu1.stu_kor}</li>
		<li>${stu1.stu_math}</li>
	</ul>
	
	<h5># 반복문과 함께 활용해보기</h5>
	<table>
		<tr>
			<th>학번</th>
			<th>이름</th>
			<th>나이</th>
			<th>국어</th>
			<th>영어</th>
			<th>수학</th>
			
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
	
	<core:set var="food" value="파스타"/>
	<script type="text/javascript">
		const food = '육개장';
		console.log('오늘 메뉴는 ${food}입니다.');
		console.log('오늘 메뉴는 ${'${food}'}입니다.');

	</script>
</body>
</html>