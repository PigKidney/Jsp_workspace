<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>광고</title>
</head>
<body>
	<c:url value="/assets/img/Unknown.png" var="mokoko"></c:url>

	<img src="${mokoko}" alt="mokoko" width="100" />
	<div>
		<input id="nm_pm_chk" name="nm_pm" type="checkbox" /> 30초 동안 안보임
	</div>

	<script>
	const nmPm = document.querySelector('#nm_pm_chk');
	nmPm.addEventListener('click', (e)=>{
	
	// 체크박스는 checked 메서드를 통해 체크여부를 알 수 있음
	console.log(nmPm.checked);
	
	if(nmPm.checked===true){
		console.log('체크됨');
		
		// 클라이언트 측에서 직접 30초 쿠키 추가
		document.cookie ="nmpm2=1; max-age=30; path=/chap09/quiz2";
		window.close();
		// location.href='nmpm.jsp'; // 서버측으로 보내서 30초 쿠키 추가
	}
	
});

</script>



</body>
</html>