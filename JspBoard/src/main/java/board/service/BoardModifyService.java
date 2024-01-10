package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.BoardDAO;
import borad.dto.BoardDTO;

public class BoardModifyService implements Service{
	private static BoardModifyService instance = new BoardModifyService();
	
	public static BoardModifyService getInstance() {
		return instance;
	}
	
	private BoardModifyService() {}
	
	@Override
	public String service(HttpServletRequest request, HttpServletResponse response) {
	
		try {
			
			String board_id_str = request.getParameter("board_id");
			String board_title = request.getParameter("board_title");
			String board_content = request.getParameter("board_content");
		

			if(
				board_id_str==null || board_id_str.equals("") ||
				board_title==null || board_title.equals("") ||
				board_content==null || board_content.equals("") 
			) {
				return "redirect::/";
			}
			
			int board_id = Integer.parseInt(board_id_str);
			
			BoardDTO dto = new BoardDTO();
			
			dto.setBoard_id(board_id);
			dto.setBoard_title(board_title);
			dto.setBoard_content(board_content);
			
			if(BoardDAO.getInstacne().modify(dto) < 1) {
				throw new Exception("게시글 수정 도중 에러 발생");
			}
			System.out.println("수정완료");
			return "redirect::/detail?board_id="+board_id;
			
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect::/";

		}
	}
}
