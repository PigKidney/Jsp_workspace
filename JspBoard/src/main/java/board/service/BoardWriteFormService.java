package board.service;

import javax.servlet.http.HttpServletRequest;

public class BoardWriteFormService implements Service{
	
	private static BoardWriteFormService instance = new BoardWriteFormService();
	
	public static BoardWriteFormService getInstance () {
		return instance;
	}
	
	private BoardWriteFormService() {
	}
	
	@Override
	public String service(HttpServletRequest request) {
		
		return "/WEB-INF/views/board/writeForm.jsp";
	}
}
