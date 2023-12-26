<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>


	<h3># 요구사항</h3>
	
	<ul>
		<li>아이디와 비밀번호를 입력하고 로그인 버튼을 눌러 로그인을 할 수 있다</li>
		<li>
			회원가입은 아이디와 비밀번호만 입력하면 완료된다
			(아이디 중복은 체크해야하고, 가입된 정보는 application 영역에 등록한다)
		</li>
		<li>로그인에 성공한 사람은 세션이 유지되는 동안 로그인이 계속해서 유지되어야 한다</li>
		<li>로그인 한 사람은 새로운 메모를 등록할 수 있고, 예전에 등록했던 메모들도 볼 수 있다</li>
		<li>서버를 재시작했을때 모든 회원정보 및 메모가 사라져도 상관 없다</li>
		<li>
			페이지 개수에 제한은 없으면 모든 내용은 quiz 폴더 밑에 만들 것
			(서블릿을 사용하고 싶다면 URL을 quiz로 맞출 것)
		</li>
	</ul>
	
	<h1>Wellcome to Index</h1>
	<%--
	아 이 디 	: <input id="IDInput" type="text" name="ID"><br>
	비밀번호	: <input id="passWordInput" type="password" name="password"><br>
	<button id="loginBtn">로그인</button> <br>
	<button id="joinBtn" onclick="location.href='/chap04/quiz/createId.jsp'">회원가입</button> <br>
	
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
		아 이 디 	: <input id="IDInput" type="text" name="ID"><br>
		비밀번호	: <input id="passWordInput" type="password" name="password"><br>
		<input type="submit" value="로그인">
	</form>


</body>
</html>