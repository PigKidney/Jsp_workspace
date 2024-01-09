package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeletePopupService implements Service{
	private static DeletePopupService instance = new DeletePopupService();
	
	public static DeletePopupService getInstance() {
		return instance;
	}
	
	private DeletePopupService() {}
	
	
	@Override
	public String service(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		return "/WEB-INF/views/board/deletePopup.jsp";
	}
}
