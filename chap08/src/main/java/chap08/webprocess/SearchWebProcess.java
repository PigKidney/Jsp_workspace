package chap08.webprocess;

import javax.servlet.http.HttpServletRequest;

public class SearchWebProcess implements WebProcess{

	@Override
	public String process(HttpServletRequest request) {
		return "/quiz/search.jsp";
	}
}
