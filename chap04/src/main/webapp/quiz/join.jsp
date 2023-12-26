<%@page import="java.util.HashMap"%>
<%@page import="java.io.Console"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%!
	private boolean isEmpty(String str) {
		if (str == null || str.trim().equals("")) {
			return true;
		}
		return false;
	}

//	private final String successHtml = "<h1>로그인 완료</h1>\n";%>
<%
	String ID = request.getParameter("ID");
	String password = request.getParameter("password");
	Boolean isLogigned = (Boolean) session.getAttribute("isLogined");
	
	if (isLogigned != null && isLogigned) {
		//out.print(successHtml);
		response.sendRedirect("chap04/quiz/main.jsp");
	} else {
		if (isEmpty(ID) || isEmpty(password)) {
			response.sendRedirect("/chap04/quiz/login.jsp");
		} else {
			if (ID.equals(password)) {
		session.setAttribute("isLogigned", true);
		//out.print(successHtml);
		response.sendRedirect("/chap04/quiz/main.jsp");
			} else {
		response.sendRedirect("/chap04/quiz/login.jsp");
			}
		}
	}
%>