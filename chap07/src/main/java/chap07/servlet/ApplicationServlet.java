package chap07.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import chap07.util.UriParser;
import chap07.webprocess.BreadAddFormWebProcess;
import chap07.webprocess.BreadAddWebProcess;
import chap07.webprocess.BreadListWebProcess;
import chap07.webprocess.DBtestWebProcess;
import chap07.webprocess.IndexWebProcess;
import chap07.webprocess.WebProcess;

public class ApplicationServlet extends HttpServlet{
	
	protected static Map<String, WebProcess> uriMapping = new HashMap<>();
	
	static {
		// (1) 전달받은 URI(cmd)에 따라 알맞은 처리를 꺼내줄 수 있는 맵을 생성해두면
		// if문을 안 쓸 수 있다 (커맨드 패턴)
		uriMapping.put("GET::/",new IndexWebProcess());
		uriMapping.put("GET::/dbtest/list",new DBtestWebProcess());
		uriMapping.put("GET::/dbtest/bread/list",new BreadListWebProcess());
		uriMapping.put("GET::/dbtest/bread/add",new BreadAddFormWebProcess());
		uriMapping.put("POST::/dbtest/bread/add",new BreadAddWebProcess());


	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getContextPath();
		System.out.println("method : " + req.getMethod());
		String cmd = UriParser.getCmd(req);
		
		// 1. uri를 문자열 형태로 전달받는다
		// 2. 해당 uri에 알맞은 처리를 한다(DB작업 등...)
		// 3. 내가 다음으로 가야할 뷰 페이지로 포워드 하거나 리다이렉트 한다
		
		String nextPage = uriMapping.get(cmd).process(req);
		
		req.getRequestDispatcher(nextPage).forward(req, resp);
		
		
		
		// if문을 사용할때의 문제점 - 끝도 없이 늘어나기 때문에 소스코드가 길어져서 유지보수가 힘들다
		// 결론 : 엄청나게 늘어날 수 있는 if문은 제거해야 한다 => 인터페이스와 Map을 활용
		
//		if(cmd.equals("/")) {
//			req.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(req, resp);
//		} else if (cmd.equals("/dbtest/list")) {
//			// DB에서 값을 꺼낸 후
//			try(
//				Connection conn = JdbcConnection.getConnection();
//				PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM employees");
//				ResultSet rs = pstmt.executeQuery();
//			) {
//				// DTO : 읽기/쓰기 가능
//				// VO : 읽기 전용
//				List<EmployeeDTO> employees = new ArrayList<>();
//				
//				while (rs.next()) {
//					employees.add(new EmployeeDTO(
//							rs.getInt("employee_id"), 
//							rs.getString("first_name"), 
//							rs.getString("last_name"),
//							rs.getString("email"), 
//							rs.getString("phone_number"), 
//							rs.getDouble("salary"), 
//							rs.getDouble("commission_pct"), 
//							rs.getDate("hire_date"), 
//							rs.getString("job_id"), 
//							rs.getInt("manager_id"), 
//							rs.getInt("department_id")));
//				}
//				
//				// 처리 후 어트리뷰트에 데이터 적재
//				req.setAttribute("employees", employees);
//			} catch (SQLException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//			// 포워딩
//			req.getRequestDispatcher("/WEB-INF/views/dbtest/list.jsp").forward(req, resp);
//		} else if (cmd.equals("/quiz/list")) {
//			// DB에서 값을 꺼낸 후
//			try(
//				Connection conn = JdbcConnection.getConnection();
//				PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM soccerplayer");
//				ResultSet rs = pstmt.executeQuery();
//			) {
//				List<SoccerplayerDTO> soccerplayers = new ArrayList<>();
//				
//				while (rs.next()) {
//					soccerplayers.add(new SoccerplayerDTO(
//							rs.getInt("PLAYER_ID"), 
//							rs.getString("PLAYER_KOR_NAME"),
//							rs.getString("PLAYER_POSITION"), 
//							rs.getInt("PLAYER_BACK_NUMBER"), 
//							rs.getString("COUNTRY_ID"), 
//							rs.getInt("TEAM_ID")
//							));
//				}
//				
//				// 처리 후 어트리뷰트에 데이터 적재
//				req.setAttribute("soccerplayers", soccerplayers);
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//			// 포워딩
//			req.getRequestDispatcher("/WEB-INF/views/quiz/list.jsp").forward(req, resp);
//		} else if (cmd.equals("/player/add")) {
//			req.setCharacterEncoding("EUC-KR");
//			String playerName = req.getParameter("PLAYER_KOR_NAME");
//			String position = req.getParameter("PLAYER_POSITION");
//			String playerNumStr = req.getParameter("PLAYER_BACK_NUMBER");
//			String countryId = req.getParameter("COUNTRY_ID");
//			String teamIDStr = req.getParameter("TEAM_ID");
//			
//			// 파라미터 값이 안전한지 체크
//			if(playerName == null || position == null || playerNumStr == null || countryId == null || teamIDStr == null ||
//					playerName.equals("") || position.equals("") || playerNumStr.equals("") || countryId.equals("") || teamIDStr.equals("")) {
//				throw new ServletException("파라미터 값이 이상함");
//			}
//			
//			int playerNum = Integer.parseInt(playerNumStr);
//			int teamID = Integer.parseInt(teamIDStr);
//			System.out.println(playerName);
//			System.out.println(position);
//			System.out.println(playerNumStr);
//			System.out.println(countryId);
//			System.out.println(teamIDStr);
//
//			try (Connection conn = JdbcConnection.getConnection()) {
//				String sql = "INSERT INTO soccerplayer VALUES (soccerplayer_id_seq.nextval,?,?,?,?,?)";
//				try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
//					pstmt.setString(1, playerName);
//					pstmt.setString(2, position);
//					pstmt.setInt(3, playerNum);
//					pstmt.setString(4, countryId);
//					pstmt.setInt(5, teamID);
//					pstmt.executeUpdate();
//				}
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//			resp.setContentType("text/html; charset=EUC-KR");
//			resp.setCharacterEncoding("EUC-KR");
//			resp.sendRedirect(req.getContextPath() + "/quiz/list");
//		} else if (cmd.equals("/player/clear")) {
//			String playerIdStr = req.getParameter("PLAYER_ID");
//			if(playerIdStr == null || playerIdStr.equals("")) {
//				throw new ServletException("파라미터 값이 이상함");
//			}
//			int playerId = Integer.parseInt(playerIdStr);
//			try (Connection conn = JdbcConnection.getConnection()) {
//				String sql = "DELETE FROM soccerplayer WHERE PLAYER_ID = ?";
//				try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
//					pstmt.setInt(1, playerId);
//					pstmt.executeUpdate();
//				}
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//			resp.sendRedirect(req.getContextPath() + "/quiz/list");
//		} else if (cmd.equals("/player/modify")) {
//			String playerIdStr = req.getParameter("PLAYER_ID");
//			
//			if(playerIdStr == null || playerIdStr.equals("")) {
//				throw new ServletException("파라미터 값이 이상함");
//			}
//			
//			int playerId = Integer.parseInt(playerIdStr);
//		
//			System.out.println(playerId);
//			req.setAttribute("ID", playerId);
//			try (Connection conn = JdbcConnection.getConnection();) {
//				String sql = "SELECT * FROM soccerplayer WHERE PLAYER_ID=?";
//				try (PreparedStatement pstmt = conn.prepareStatement(sql);) {
//					pstmt.setInt(1, playerId);
//					SoccerplayerDTO soccerplayer = new SoccerplayerDTO();
//					try(ResultSet rs = pstmt.executeQuery();) {
//						while (rs.next()) {
//							soccerplayer.setPLAYER_ID(rs.getInt("PLAYER_ID"));
//							soccerplayer.setPLAYER_KOR_NAME(rs.getString("PLAYER_KOR_NAME"));
//							soccerplayer.setPLAYER_POSITION(rs.getString("PLAYER_POSITION"));
//							soccerplayer.setPLAYER_BACK_NUMBER(rs.getInt("PLAYER_BACK_NUMBER"));
//							soccerplayer.setCOUNTRY_ID(rs.getString("COUNTRY_ID"));
//							soccerplayer.setTEAM_ID(rs.getInt("TEAM_ID"));
//						}
//						
//					}
//					req.setAttribute("soccerplayer", soccerplayer);
//				}
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//			req.getRequestDispatcher("/WEB-INF/views/quiz/modify.jsp").forward(req, resp);
//		} else if (cmd.equals("/player/change")) {
//			String playerIdStr = (String) req.getAttribute("ID");
//			
//			if(playerIdStr == null || playerIdStr.equals("")) {
//				throw new ServletException("파라미터 값이 이상함");
//			}
//			
//			int playerId = Integer.parseInt(playerIdStr);
//		
//			System.out.println(playerId);
//	
//			try (Connection conn = JdbcConnection.getConnection();) {
//				String sql = "UPDATE soccerplayer SET PLAYER_KOR_NAME=? , PLAYER_POSITION=?, PLAYER_BACK_NUMBER=? ,COUNTRY_ID=?"
//						+ ", TEAM_ID=?  WHERE PLAYER_ID=?";
//				try (PreparedStatement pstmt = conn.prepareStatement(sql);) {
//					pstmt.setString(1, req.getParameter("PLAYER_KOR_NAME"));   
//					pstmt.setString(2, req.getParameter("PLAYER_POSITION"));
//					pstmt.setInt(3, Integer.parseInt(req.getParameter("PLAYER_BACK_NUMBER")));
//					pstmt.setString(4, req.getParameter("COUNTRY_ID"));
//					pstmt.setInt(5, Integer.parseInt(req.getParameter("TEAM_ID")));
//					pstmt.setInt(6, playerId);
//					
//					pstmt.executeUpdate();
//				}
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//			req.getRequestDispatcher("/quiz/list").forward(req, resp);
//		} else if (cmd.equals("/dbtest/bread/list")) {
//			
//			// 포워딩
//			req.getRequestDispatcher("/WEB-INF/views/bread/list.jsp").forward(req, resp);
//		}
	}
}
