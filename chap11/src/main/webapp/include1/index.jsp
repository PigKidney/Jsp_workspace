<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- JSP:include�� forwardó�� webapp���� ��θ� ����ؾ� �Ѵ� -->
<jsp:include page="./top.jsp" />

<h1>Index.jsp</h1>


<p>
	Lorem ipsum dolor sit amet, consectetur adipisicing elit.
	Accusantium molestias ullam doloremque et recusandae! Expedita sequi
	voluptatem sapiente facilis deleniti deserunt qui sit labore maxime
	atque suscipit cumque numquam perferendis!
</p>

<p>�ڹٽ�ũ��Ʈ�� Ŭ���̾�Ʈ���� �۵��ϴ� ����̱� ������ 3������ ������ ���� �ʴ´�.</p>
<p>
	����� �ϳ��� ���������� �ٸ� ���������� �ϼ��� ����� �������� ���̱� ������ 
	�� jsp �������� �ϼ��ϱ� ���� ���� �� �������� ���� �����ؾ� �Ѵ�(ex: jstl, page...)
</p>

<c:forEach begin="0" end="9" var="i">
	<p>paragraph${i} , ${fruit}</p>
</c:forEach>



<jsp:include page="./bottom.jsp" />
