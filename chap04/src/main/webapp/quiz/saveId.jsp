<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%
	class Users{
		String id;
		String password;
		String memo;
		
		Users(){
		}
		
		Users(String id, String password){
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
	String ID = request.getParameter("ID");
	String password = request.getParameter("password");
	
	if(application.getAttribute(ID)==null){
		application.setAttribute(ID, new Users(ID,password));	
		response.sendRedirect("/chap04/quiz/login.jsp");
		%>
		<script>
		alert("ȸ������ �Ϸ�");
		</script>
		<%
	} else if(application.getAttribute(ID)!=null){
		%>
		<script>
		alert("�̹� �����ϴ� ���̵��Դϴ�");
		</script>
		<%
		response.sendRedirect("/chap04/quiz/createId.jsp");
	}
%>