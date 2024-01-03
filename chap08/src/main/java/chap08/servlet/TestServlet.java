package chap08.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import chap08.util.UriParser;
import chap08.webprocess.IndexWebProcess;
import chap08.webprocess.SearchDepartmentIdWebProcess;
import chap08.webprocess.SearchFirstNameWebProcess;
import chap08.webprocess.SearchLastNameWebProcess;
import chap08.webprocess.WebProcess;

@WebServlet("/test")
public class TestServlet extends HttpServlet{
protected static Map<String, WebProcess> uriMapping = new HashMap<>();
	
	static {
		uriMapping.put("GET::/",new IndexWebProcess());

		uriMapping.put("GET::/search",new IndexWebProcess());
		
		uriMapping.put("POST::/reset",new IndexWebProcess());
		uriMapping.put("POST::/frist_name",new SearchFirstNameWebProcess());
		uriMapping.put("POST::/last_name",new SearchLastNameWebProcess());
		uriMapping.put("POST::/department_id",new SearchDepartmentIdWebProcess());

	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		req.setCharacterEncoding("EUC-KR");
//		if(req.getMethod().equals("POST")) {
//			System.out.println("POST 방식 : "+req.getParameter("animal"));
//			resp.sendRedirect(req.getContextPath()+"/encoding.jsp");
//		} else {
//			System.out.println("GET 방식 : "+req.getParameter("animal"));
//			resp.sendRedirect(req.getContextPath()+"/encoding.jsp");
//		}
//		
//		resp.setCharacterEncoding("EUC-KR");
		
		req.setCharacterEncoding("EUC-KR");
		System.out.println("method : " + req.getMethod());
		String cmd = UriParser.getCmd(req);
		System.out.println(cmd);
		String nextPage = uriMapping.get(cmd).process(req);
		
		resp.setContentType("text/html; charset=EUC-KR");
		resp.setCharacterEncoding("EUC-KR");
		if(nextPage.startsWith("redirect::")) {
			resp.sendRedirect(nextPage.substring("redirect::".length()));
		} else {
			req.getRequestDispatcher(nextPage).forward(req, resp);			
		}
	}
}
