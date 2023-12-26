<%@page import="java.util.HashMap"%>
<%@page import="java.io.Console"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%!
public class User{
	String id="";
	String password="";
	String memo="";
	
	User(){
	}
	
	User(String id, String password){
		this.id = id;
		this.password = password;
	}
	private String getId(){
		return this.id;
	}
	private String getPassword(){
		return this.password;
	}
	private String getMemo(){
		return this.memo;
	}
	private void setId(String id){
		this.id = id;
	}
	private void setPassword(String password){
		this.password = password;
	}
	private void setMemo(String memo){
		this.memo = memo;
	}
	
}
	HashMap<String, User> users = new HashMap<>();

%>

<%
	
	String ID = request.getParameter("ID");
	String password = request.getParameter("password");
	if(ID!=null){
		if(application.getAttribute(ID)==null){
			users.put(ID, new User(ID,password));
			application.setAttribute(ID, users);
	
			response.sendRedirect("/chap04/quiz/login.jsp");
		
		} else if(application.getAttribute(ID)!=null){
			response.sendRedirect("/chap04/quiz/createId.jsp");
		}
		
	}
	
		
	String loginId = request.getParameter("loginId");
	String loginPassword = request.getParameter("loginPassword");
	if(loginId!=null){
		if(application.getAttribute(loginId)==null){
			response.sendRedirect("/chap04/quiz/login.jsp");
		} else {
			application.setAttribute(ID, users);

			User u1 = (User)application.getAttribute(loginId);
			if(u1.getPassword().equals(loginPassword)){
				
				response.sendRedirect("/chap04/quiz/main.jsp");
			} else{
				response.sendRedirect("/chap04/quiz/login.jsp");
			}
		} 		
	}

	String memo = request.getParameter("memo");
	if(memo!=null){
		if(application.getAttribute(loginId)==null){
			response.sendRedirect("/chap04/quiz/login.jsp");
		} else {
			User u1 = (User)application.getAttribute(loginId);
			if(u1.getPassword().equals(loginPassword)){
				response.sendRedirect("/chap04/quiz/main.jsp");
			} else{
				response.sendRedirect("/chap04/quiz/login.jsp");
			}
		} 		
	}
	
%>
