<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>


	<h3># �䱸����</h3>
	
	<ul>
		<li>���̵�� ��й�ȣ�� �Է��ϰ� �α��� ��ư�� ���� �α����� �� �� �ִ�</li>
		<li>
			ȸ�������� ���̵�� ��й�ȣ�� �Է��ϸ� �Ϸ�ȴ�
			(���̵� �ߺ��� üũ�ؾ��ϰ�, ���Ե� ������ application ������ ����Ѵ�)
		</li>
		<li>�α��ο� ������ ����� ������ �����Ǵ� ���� �α����� ����ؼ� �����Ǿ�� �Ѵ�</li>
		<li>�α��� �� ����� ���ο� �޸� ����� �� �ְ�, ������ ����ߴ� �޸�鵵 �� �� �ִ�</li>
		<li>������ ����������� ��� ȸ������ �� �޸� ������� ��� ����</li>
		<li>
			������ ������ ������ ������ ��� ������ quiz ���� �ؿ� ���� ��
			(������ ����ϰ� �ʹٸ� URL�� quiz�� ���� ��)
		</li>
	</ul>
	
	<h1>Wellcome to Index</h1>
	<%--
	�� �� �� 	: <input id="IDInput" type="text" name="ID"><br>
	��й�ȣ	: <input id="passWordInput" type="password" name="password"><br>
	<button id="loginBtn">�α���</button> <br>
	<button id="joinBtn" onclick="location.href='/chap04/quiz/createId.jsp'">ȸ������</button> <br>
	
	<script type="text/javascript">
	const loginBtn = document.getElementById("loginBtn");
	const IDInput = document.getElementById("IDInput");
	const passWordInput = document.getElementById("passWordInput");

	loginBtn.addEventListener('click', (e) => {
		location.href = 
			'/chap04/quiz/join.jsp?ID='+ IDInput.value +'&scope=ID'+'&password='+ passWordInput.value +'&scope=password';
	});
	</script>
	 --%>
	<form action="/chap04/quiz/join.jsp" method="post">
		�� �� �� 	: <input id="IDInput" type="text" name="ID"><br>
		��й�ȣ	: <input id="passWordInput" type="password" name="password"><br>
		<input type="submit" value="�α���">
	</form>


</body>
</html>