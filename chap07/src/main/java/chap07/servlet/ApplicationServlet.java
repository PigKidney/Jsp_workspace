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
		}
	}
}
