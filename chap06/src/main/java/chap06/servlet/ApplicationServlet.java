package chap06.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 	# Front Controller Design Pattern
 	
 	- 모든 요청을 하나의 서블릿에서 받고 URI에 따라 알맞은 페이지로 포워딩
 	- 요청 -> URI 식별 -> 처리 -> 포워딩 -> 뷰 생성 순서로 모든 요청을 처리할 수 있다
 */
public class ApplicationServlet extends HttpServlet{
	

	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 1. 요청을 받으면 URI를 통해 알맞은 처리로 안내한다
		String cmd = req.getRequestURI().substring(req.getContextPath().length());
		
		System.out.println(cmd);
		
		// 2. 원하는 코드로 처리한 후 뷰 페이지에서 필요한 데이터는 어트리뷰트에 실어 보낸다.
		if(cmd.equals("/hello")) {
			String keyword = req.getParameter("keyword");
			
			// DB에 접근해서 자료를 들고온 후 어트리뷰트에 실어 보낸다...
			Set<String> resultSet = new HashSet<>();
			resultSet.add("Smith A");
			resultSet.add("Smith B");
			resultSet.add("Smith C");
			
			req.setAttribute("result", resultSet);
			
			// 포워딩을 통해서는 WEV-INF 폴더에 접근할 수 있다
			req.getRequestDispatcher("/WEB-INF/views/hello.jsp").forward(req, resp);
		} else if (cmd.equals("/greeting/hi")) {
			
		} else if(cmd.equals("/pizza")) {
			List<Pizza> pizzas = new ArrayList<>();
			HashMap<String, Integer> price = new HashMap<>();
			price.put("L",35900);
			price.put("M",30000);
			pizzas.add(new Pizza("스노우 브리스킷 바비Q", price , "https://cdn.dominos.co.kr/admin/upload/goods/20231214_a0G7WsxF.jpg") );
			
			price.put("L",37900);
			price.put("M",31000);
			pizzas.add(new Pizza("스노우 블랙타이거 슈림프", price , "https://cdn.dominos.co.kr/admin/upload/goods/20231214_B8cGMt1w.jpg") );
			
			price.put("L",34900);
			price.put("M",29000);
			pizzas.add(new Pizza("스노우 와일드 와일드 웨스트 스테이크", price , "https://cdn.dominos.co.kr/admin/upload/goods/20231214_Y3W7J63w.jpg") );
			
			price.put("L",34900);
			price.put("M",29000);
			pizzas.add(new Pizza("브리스킷 바비Q", price , "https://cdn.dominos.co.kr/admin/upload/goods/20231215_965Hu68d.jpg") );
			
			req.setAttribute("pizzas", pizzas);
			req.getRequestDispatcher("/WEB-INF/views/pizza.jsp").forward(req, resp);
		} else if(cmd.equals("/add")) {
			
			
			req.getRequestDispatcher("/WEB-INF/views/pizza.jsp").forward(req, resp);
		}
		
		// 3. 포워딩
	}
	
	public class Pizza {
		String name;
		HashMap<String, Integer> price;
		String imgURL;
		
		public Pizza(String name , HashMap<String, Integer> price , String imgURL) {
			this.name = name;
			this.price = price;
			this.imgURL = imgURL;
		}
		
		public String getImgURL() {
			return imgURL;
		}
		
		public String getName() {
			return name;
		}
		
		public HashMap<String, Integer> getPrice() {
			return price;
		}
		
		public void setImgURL(String imgURL) {
			this.imgURL = imgURL;
		}
		
		public void setPrice(HashMap<String, Integer> price) {
			this.price = price;
		}
		
		public void setName(String name) {
			this.name = name;
		}
	}
}
