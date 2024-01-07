package chap08.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import chap08.util.UriParser;
import chap08.webprocess.IndexWebProcess;
import chap08.webprocess.ListWebProcess;
import chap08.webprocess.SearchWebProcess;
import chap08.webprocess.WebProcess;

public class ServletSearch extends HttpServlet{

	static Map<String, WebProcess> uriMapping = new HashMap<>();
	
	static {		
			uriMapping.put("GET::/", new IndexWebProcess());
			uriMapping.put("GET::/quiz/list", new ListWebProcess());
			uriMapping.put("POST::/quiz/search", new SearchWebProcess());	
		}
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getContextPath();
		System.out.println("method:" +  req.getMethod());
		String cmd = UriParser.getCmd(req);
		
		//1. uri를 문자열 형태로 전달받는다
		//2. 해당 uri에 알밪은 처리를 한다(DB작업 등 ..)
		//3. 내가 다음으로 가야할 뷰 페이지를 반환하는 메서드
		// 위 3가지를 묶어 webprocess를 만들어봄
		
		String nextPage = uriMapping.get(cmd).process(req);
		
		if(nextPage.startsWith("redirect::")) {
			resp.sendRedirect(nextPage.substring("redirect::".length()));
		}else {
			req.getRequestDispatcher(nextPage).forward(req, resp);
		}
		
	}
}
