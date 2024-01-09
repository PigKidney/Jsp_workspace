package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.BoardDAO;
import borad.dto.BoardDTO;

public class BoardDeletService implements Service{
	private static BoardDeletService instance = new BoardDeletService();
		
	public static BoardDeletService getInstance() {
		return instance;
	}
	
	private BoardDeletService() {}
	
	
	@Override
	public String service(HttpServletRequest request, HttpServletResponse response) {
		try {
			String board_id_str = request.getParameter("board_id");
			String board_title = request.getParameter("board_title");
			String board_content = request.getParameter("board_content");
			String board_password = request.getParameter("board_password");

			//------------------------------------------------------------------------ 파라미터 검사용
			/*
			System.out.println("board_id : "+board_id_str);
			System.out.println("board_password : "+ board_password);
			System.out.println(board_title);
			System.out.println(board_content);
			*/
			//------------------------------------------------------------------------

			if(
					board_id_str==null || board_id_str.equals("") ||
					board_title==null || board_title.equals("") ||
					board_content==null || board_content.equals("") 
					) {
				return "redirect::/list";
			}
			
			int board_id = Integer.parseInt(request.getParameter("board_id"));
			
			// --------------------------------------------------------- 완전히 삭제용
			/*
			BoardDTO ori = BoardDAO.getInstacne().get(board_id);
			if(ori.getBoard_password().equals(board_password)) {
				if(BoardDAO.getInstacne().shifttDelete(board_id) < 1) {
					throw new Exception("게시글 삭제 도중 에러 발생");
				}
	
			}else {
				throw new Exception("지우려는 글의 비밀번호와 일치하지 않습니다!!");
			}
			*/
			// ---------------------------------------------------------
			BoardDTO dto = new BoardDTO();
			
			dto.setBoard_id(board_id);
			dto.setBoard_title(board_title);
			dto.setBoard_content("delete::"+board_content);
			
			if(BoardDAO.getInstacne().delete(dto) < 1) {
				throw new Exception("게시글 삭제 도중 에러 발생");
			}
//			return "/WEB-INF/views/board/index.jsp";
			
			return "redirect::/list";
		} catch (Exception e) {
			e.printStackTrace();
			return "/WEB-INF/views/board/deleteFail.jsp";
		}
	}
}
