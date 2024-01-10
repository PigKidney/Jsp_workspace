package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.ReplyDAO;
import borad.dto.ReplyDTO;

public class ReplyAddService implements Service{
	private static ReplyAddService instance = new ReplyAddService();
	
	public static ReplyAddService getInstance() {
		return instance;
	}
	
	private ReplyAddService() {}
	
	@Override
	public String service(HttpServletRequest request, HttpServletResponse response) {
		try {
			String board_id_str = request.getParameter("board_id");
			if(
				board_id_str==null || board_id_str.equals("")
			) {
				return "redirect::/";
			}
			
			int board_id = Integer.parseInt(board_id_str);
			
			ReplyDTO dto = new ReplyDTO();
			dto.setBorard_id(board_id);
			dto.setReply_content(request.getParameter("reply_content"));
			dto.setReply_password(request.getParameter("reply_password"));
			dto.setReply_writer(request.getParameter("reply_writer"));
			
			ReplyDAO.getDao().add(dto);
			
			return "redirect::/detail?board_id="+board_id;
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect::/"; 
		}
		
		
	}

}
