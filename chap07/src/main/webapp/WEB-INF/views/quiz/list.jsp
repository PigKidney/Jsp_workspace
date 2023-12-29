<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.List, chap07.dto.SoccerplayerDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/quiz/css/soccerplayersList.css">

</head>
<body>
	<h3># All Soccer Players</h3>
	<div class="player-list">
	<%
		Object soccerplayers = request.getAttribute("soccerplayers");
		
	if(soccerplayers != null){
 		out.print("<div class=\"name\">PLAYER_ID</div>"
				+ "<div class=\"name\">PLAYER_KOR_NAME</div>"
				+ "<div class=\"name\">PLAYER_POSITION</div>"
				+ "<div class=\"name\">PLAYER_BACK_NUMBER</div>"
				+ "<div class=\"name\">COUNTRY_ID</div>"
				+ "<div class=\"name\">TEAM_ID</div>");
 		for(SoccerplayerDTO player : (List<SoccerplayerDTO>)soccerplayers){
			out.print(player.getDivRow());
		}
	} else {
		out.print("<div>No player here.</div>");
	}
	
	%>
	</div>
	<br>
	<div>
		이름 : <input type="text" name="PLAYER_KOR_NAME" form="player"> 
		포지션 : <input type="text" name="PLAYER_POSITION" form="player">
		등번호 : <input type="number" name="PLAYER_BACK_NUMBER" form="player"> 
		국가코드 : <input type="text" name="COUNTRY_ID" form="player"> 
		팀번호 : <input type="number" name="TEAM_ID" form="player"> 
		<form action="<%=request.getContextPath() %>/player/add" method="POST" id="player"></form>
	<span>선수 추가하기 : </span>
	<button type="submit" form="player">입력</button>
	</div>
	
	<br>
	<div>
		방출할 선수 등록번호 : <input type="number" name="PLAYER_ID" form="clear"> <button type="submit" form="clear">방출</button>
		<form action="<%=request.getContextPath() %>/player/clear" method="POST" id="clear"></form>
	</div>
	
	<br>
	<div>
		정보수정 선수 등록번호 : <input type="number" name="PLAYER_ID" form="modify"> <button type="submit" form="modify">수정</button>
		<form action="<%=request.getContextPath() %>/player/modify" method="POST" id="modify"></form>
	</div>
</body>
</html>