<%@page import="java.util.HashMap"%>
<%@page import="java.io.Console"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%!
public class User{
	String id="";
	String password="";
	String memo="start";
	
	public User(){
	}
	
	public User(String id, String password){
		this.id = id;
		this.password = password;
	}
	public String getId(){
		return this.id;
	}
	public String getPassword(){
		return this.password;
	}
	public String getMemo(){
		return this.memo;
	}
	public void setId(String id){
		this.id = id;
	}
	public void setPassword(String password){
		this.password = password;
	}
	public void setMemo(String memo){
		this.memo = memo;
	}
	
}
	HashMap<String, User> users = new HashMap<>();

%>

<%
	
	String ID = request.getParameter("ID");
	String password = request.getParameter("password");
	if(ID!=null){
		if(users.containsKey(ID)==false){
			users.put(ID, new User(ID,password));
			application.setAttribute(ID, users);
			response.sendRedirect("/chap04/quiz/login.jsp");
		} else if(users.containsKey(ID)==true){
			response.sendRedirect("/chap04/quiz/createId.jsp");
		}
	}
	
		
	String loginId = request.getParameter("loginId");
	String loginPassword = request.getParameter("loginPassword");
	users.containsKey(loginId);
	if(loginId!=null){
		if(users.containsKey(loginId)==false){
			response.sendRedirect("/chap04/quiz/login.jsp");
		} else if(users.containsKey(loginId)==true){
			if(users.get(loginId).getPassword().equals(loginPassword)){
				/* session.setAttribute(session.getId(), users.get(loginId).getMemo()); */
				session.setAttribute("id", loginId);
				session.setAttribute("memo", users.get(loginId).getMemo().toString());
				/* response.getWriter().write(users.get(loginId).getMemo()); */
 				response.sendRedirect("/chap04/quiz/main.jsp");
			} else{
				response.sendRedirect("/chap04/quiz/login.jsp");
			}
		} 		
	}

 	String memo = request.getParameter("memo");
	if(memo!=null){
		users.get(session.getAttribute("id")).setMemo(memo);
		/* session.setAttribute("memo", users.get(session.getAttribute("id")).getMemo().toString()); */
		response.sendRedirect("/chap04/quiz/main.jsp");
	}
	
%>
