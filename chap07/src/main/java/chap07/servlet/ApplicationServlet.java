package chap07.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import chap07.dto.EmployeeDTO;
import chap07.dto.SoccerplayerDTO;
import chap07.util.JdbcConnection;
import chap07.util.UriParser;

public class ApplicationServlet extends HttpServlet{
	
	
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getContextPath();
		
		String cmd = UriParser.getCmd(req);
		
		if(cmd.equals("/")) {
			req.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(req, resp);
		} else if (cmd.equals("/dbtest/list")) {
			// DB에서 값을 꺼낸 후
			try(
				Connection conn = JdbcConnection.getConnection();
				PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM employees");
				ResultSet rs = pstmt.executeQuery();
			) {
				// DTO : 읽기/쓰기 가능
				// VO : 읽기 전용
				List<EmployeeDTO> employees = new ArrayList<>();
				
				while (rs.next()) {
					employees.add(new EmployeeDTO(
							rs.getInt("employee_id"), 
							rs.getString("first_name"), 
							rs.getString("last_name"),
							rs.getString("email"), 
							rs.getString("phone_number"), 
							rs.getDouble("salary"), 
							rs.getDouble("commission_pct"), 
							rs.getDate("hire_date"), 
							rs.getString("job_id"), 
							rs.getInt("manager_id"), 
							rs.getInt("department_id")));
				}
				
				// 처리 후 어트리뷰트에 데이터 적재
				req.setAttribute("employees", employees);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			// 포워딩
			req.getRequestDispatcher("/WEB-INF/views/dbtest/list.jsp").forward(req, resp);
		} else if (cmd.equals("/quiz/list")) {
			// DB에서 값을 꺼낸 후
			try(
				Connection conn = JdbcConnection.getConnection();
				PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM soccerplayer");
				ResultSet rs = pstmt.executeQuery();
			) {
				List<SoccerplayerDTO> soccerplayers = new ArrayList<>();
				
				while (rs.next()) {
					soccerplayers.add(new SoccerplayerDTO(
							rs.getInt("PLAYER_ID"), 
							rs.getString("PLAYER_KOR_NAME"),
							rs.getString("PLAYER_POSITION"), 
							rs.getInt("PLAYER_BACK_NUMBER"), 
							rs.getString("COUNTRY_ID"), 
							rs.getInt("TEAM_ID")
							));
				}
				
				// 처리 후 어트리뷰트에 데이터 적재
				req.setAttribute("soccerplayers", soccerplayers);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			// 포워딩
			req.getRequestDispatcher("/WEB-INF/views/quiz/list.jsp").forward(req, resp);
		} else if (cmd.equals("/player/add")) {
			req.setCharacterEncoding("EUC-KR");
			String playerName = req.getParameter("PLAYER_KOR_NAME");
			String position = req.getParameter("PLAYER_POSITION");
			String playerNumStr = req.getParameter("PLAYER_BACK_NUMBER");
			String countryId = req.getParameter("COUNTRY_ID");
			String teamIDStr = req.getParameter("TEAM_ID");
			
			// 파라미터 값이 안전한지 체크
			if(playerName == null || position == null || playerNumStr == null || countryId == null || teamIDStr == null ||
					playerName.equals("") || position.equals("") || playerNumStr.equals("") || countryId.equals("") || teamIDStr.equals("")) {
				throw new ServletException("파라미터 값이 이상함");
			}
			
			int playerNum = Integer.parseInt(playerNumStr);
			int teamID = Integer.parseInt(teamIDStr);
			System.out.println(playerName);
			System.out.println(position);
			System.out.println(playerNumStr);
			System.out.println(countryId);
			System.out.println(teamIDStr);

			try (Connection conn = JdbcConnection.getConnection()) {
				String sql = "INSERT INTO soccerplayer VALUES (soccerplayer_id_seq.nextval,?,?,?,?,?)";
				try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
					pstmt.setString(1, playerName);
					pstmt.setString(2, position);
					pstmt.setInt(3, playerNum);
					pstmt.setString(4, countryId);
					pstmt.setInt(5, teamID);
					pstmt.executeUpdate();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			resp.setContentType("text/html; charset=EUC-KR");
			resp.setCharacterEncoding("EUC-KR");
			resp.sendRedirect(req.getContextPath() + "/quiz/list");
		} else if (cmd.equals("/player/clear")) {
			String playerIdStr = req.getParameter("PLAYER_ID");
			if(playerIdStr == null || playerIdStr.equals("")) {
				throw new ServletException("파라미터 값이 이상함");
			}
			int playerId = Integer.parseInt(playerIdStr);
			try (Connection conn = JdbcConnection.getConnection()) {
				String sql = "DELETE FROM soccerplayer WHERE PLAYER_ID = ?";
				try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
					pstmt.setInt(1, playerId);
					pstmt.executeUpdate();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			resp.sendRedirect(req.getContextPath() + "/quiz/list");
		} else if (cmd.equals("/player/modify")) {
			String playerIdStr = req.getParameter("PLAYER_ID");
			
			if(playerIdStr == null || playerIdStr.equals("")) {
				throw new ServletException("파라미터 값이 이상함");
			}
			
			int playerId = Integer.parseInt(playerIdStr);
		
			System.out.println(playerId);
	
			try (Connection conn = JdbcConnection.getConnection();) {
				String sql = "SELECT * FROM soccerplayer WHERE PLAYER_ID=?";
				try (PreparedStatement pstmt = conn.prepareStatement(sql);) {
					pstmt.setInt(1, playerId);
					SoccerplayerDTO soccerplayer = new SoccerplayerDTO();
					try(ResultSet rs = pstmt.executeQuery();) {
						while (rs.next()) {
							soccerplayer.setPLAYER_ID(rs.getInt("PLAYER_ID"));
							soccerplayer.setPLAYER_KOR_NAME(rs.getString("PLAYER_KOR_NAME"));
							soccerplayer.setPLAYER_POSITION(rs.getString("PLAYER_POSITION"));
							soccerplayer.setPLAYER_BACK_NUMBER(rs.getInt("PLAYER_BACK_NUMBER"));
							soccerplayer.setCOUNTRY_ID(rs.getString("COUNTRY_ID"));
							soccerplayer.setTEAM_ID(rs.getInt("TEAM_ID"));
						}
						
					}
					req.setAttribute("soccerplayer", soccerplayer);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			req.getRequestDispatcher("/WEB-INF/views/quiz/modify.jsp").forward(req, resp);
		}
	}
}
