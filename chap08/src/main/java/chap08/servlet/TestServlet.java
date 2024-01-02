package chap08.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/test")
public class TestServlet extends HttpServlet{
	
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("EUC-KR");
		if(req.getMethod().equals("POST")) {
			System.out.println("POST 방식 : "+req.getParameter("animal"));
			resp.sendRedirect(req.getContextPath()+"/encoding.jsp");
		} else {
			System.out.println("GET 방식 : "+req.getParameter("animal"));
			resp.sendRedirect(req.getContextPath()+"/encoding.jsp");
		}
		
		resp.setCharacterEncoding("EUC-KR");
	}
}
