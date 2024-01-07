package chap08.webprocess;

import javax.servlet.http.HttpServletRequest;

public class ListWebProcess implements WebProcess{
@Override
public String process(HttpServletRequest request) {
	
	return "/quiz/list.jsp";
}
}
