package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.BoardDAO;
import board.secure.SecureTools;
import borad.dto.BoardDTO;

public class BoardWriteService implements Service{
	private static BoardWriteService instance = new BoardWriteService();
	
	public static BoardWriteService getInstance() {
		return instance;
	}
	
	private BoardWriteService() {}
	
	BoardDTO dto = new BoardDTO();	

	
	@Override
	public String service(HttpServletRequest request, HttpServletResponse response) {
		String board_title = request.getParameter("board_title");
		String board_writer = request.getParameter("board_writer");
		String board_password = request.getParameter("board_password");
		String board_content = request.getParameter("board_content");

//		System.out.println(board_title);
//		System.out.println(board_writer);
//		System.out.println(board_password);
//		System.out.println(board_content);
		// 필요하다면 입력값에 대한 검사를 진행한다
		if(
			board_title == null || board_title.equals("") || 
			board_writer == null || board_writer.equals("") || 
			board_password == null || board_password.equals("") || 
			board_content == null || board_content.equals("")) {
			
		}
		
		dto.setBoard_title(board_title);
		dto.setBoard_writer(board_writer);
		// Setter에서 Hash작업을 하면 DB에서 값을 꺼내 조회할때도 Hash를 적용하여 바람직하지 않다
		dto.setBoard_password(SecureTools.genHashPassword(board_password));
		dto.setBoard_content(board_content);
		
		int result = BoardDAO.getInstacne().write(dto);
		
		
		return "redirect::/";
	}
}
