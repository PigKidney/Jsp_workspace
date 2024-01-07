<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<h3># Quiz</h3>

	<ul>
		<li>이 페이지에 접속할 때 광고창 하나 뜸</li>
		<li>적당한 이미지 하나와 체크박스 버튼이 있음</li>
		<li>체크 박스를 체크하고 창을 닫으면 30초 동안 이 페이지에 접속하더라도 광고창이 뜨지 않음</li>
	</ul>
	
	<c:url value="/quiz/promotion.jsp" var="pmURL"/>
	
	<!-- JSP 페이지에서는 EL로 쿠키값을 쉽게 꺼내 쓸 수 있다 -->
	<!-- 체크박스 체크하면 value 값이 1인 쿠키추가되면서 if 문이 발동하지 않음 -->
	<c:if test="${cookie.nmpm.value != '1'}">
	
   <script>
      // open할 때 내가 연 새 창의 인스턴스를 반환한다
      const a = open('${pmURL}', '_blank', 'width=200,height=200');
      // a.close();
   </script>
	</c:if>

</body>
</html>