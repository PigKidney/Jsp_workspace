package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.BoardDAO;
import borad.dto.BoardDTO;

public class BoardModifyFormService implements Service{
	private static BoardModifyFormService instance = new BoardModifyFormService();
	
	public static BoardModifyFormService getInstance() {
		return instance;
	}
	
	private BoardModifyFormService() {
		
	}
	
	@Override
	public String service(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			String board_id_str = request.getParameter("board_id");
			
			if(board_id_str==null || board_id_str.equals("")) {
				return "redirect::/";
			}
			int board_id = Integer.parseInt(request.getParameter("board_id"));
			
			BoardDTO oldData = BoardDAO.getInstacne().get(board_id);
			
			if(oldData != null) {
				request.setAttribute("oldData", oldData);
				return "/WEB-INF/views/board/modifyForm.jsp";			
			} else {
				return "redirect::/";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect::/";
		}
		
		
	}
}
