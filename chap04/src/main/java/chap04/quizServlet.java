package chap04;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/quiz")
public class quizServlet extends HttpServlet {
	class Users {
		String id = "";
		String password = "";
		String memo = "";

		Users() {
		}

		Users(String id, String password) {
			this.id = id;
			this.password = password;
		}

		private String getId() {
			return this.id;
		}

		private String getPassword() {
			return this.password;
		}

		private String getMemo() {
			return this.memo;
		}

		private void setId(String id) {
			this.id = id;
		}

		private void setPassword(String password) {
			this.password = password;
		}

		private void setMemo(String memo) {
			this.memo = memo;
		}

	}

	// doGet() : GET방식 요청을 받으면 호출되는 메서드
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// GET방식 요청의 암묵적인 뜻 : DB에서 꺼낸 데이터를 내놔라
		System.out.println("GET방식 요청이 왔습니다...");

		resp.getWriter().append("<p>요청은 GET방식이었습니다.</p>");
	}

	// doPost() : POST방식 요청을 받으면 호출되는 메서드
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// POST방식 요청의 암묵적인 뜻 : 받은 데이터를 DB에 INSERT해라
		System.out.println("POST방식 요청이 왔습니다...");
		resp.getWriter().append("<p>요청은 POST방식이었습니다.</p>");

	}
}
