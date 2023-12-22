package chap01.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// /chap01/gugudan으로 접속하는 사용자에게 멋있는 구구단 페이지를 응답하는 서블릿을 만들어보세요
@WebServlet("/Gugudan")
public class GugudanServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");
		resp.setCharacterEncoding("utf-8");
		
		PrintWriter out = resp.getWriter();
		out.print("<!DOCTYPE html>");
		out.print("<html>");
		out.print("<html lang=\"ko\">");
		out.print("<head><meta charset=\"UTF-8\"><title>구구단!</title></head>");
//		out.print("<link rel=\"stylesheet\" href=\"./GugudanServlet.css\" />");
		
		/*
			- 웹의 절대 경로는 프로토콜 이름부터 시작되는 경로다
			- 상대 경로는 이 페이지를 접속했던 URL기준의 상대 경로다
			- a태그 뿐만이 아니라 link, img, script 태그 등은 페이지 
			  사용하는 것만으로도 서버로 요청을 보내 정적 자원을 받아와서 활용한다
			  		  
		 */
		out.print("<link rel=\"stylesheet\" href=\"./assets/gugudan.css\" />");
		out.print("<body>");
		out.print("<h2>구구단</h2>");
		out.print("<div id=\"gugudan\">");
//		for(int i= 2 ; i < 10; i++) {
//			out.print(getGugudan(i));
//		}
		
		for(int gop = 0; gop <=9; ++gop) {
			for(int dan = 2; dan <=9; ++dan) {
				if(gop == 0) {
					out.print(String.format("<div class=\"dan\">%d단</div>", dan));
				} else {
					out.print(String.format("<div>%d x %d = %-2d</div>", dan, gop, dan * gop));
				}	
			}
		}
		out.print("</div>");
		out.print("</body>");

	}

	private String getGugudans() {
		StringBuilder gugudan = new StringBuilder();
		gugudan.append("<pre>");
		for(int line = 0 ; line < 10 ; ++line) {
			int mul = line;
			for(int step = 2 ; step <= 9 ; ++step) {
				if(line == 0) {
					gugudan.append(String.format("%d단\t\t",step));
				} else {
					gugudan.append(String.format("%d x %d = %-2d\t", step, mul, step * mul));
				}	
			}gugudan.append("\n");
		}
		gugudan.append("</pre>");
		return gugudan.toString(); 
	}
	
	private String getGugudan(int num) {
		StringBuilder gugudan = new StringBuilder();
		gugudan.append("<div class=\"gugu\"><pre>");
		gugudan.append(num+"단\n\n");
		for(int i = 1 ; i < 10 ; i++) {
			gugudan.append(num+" x "+i+" : "+num*i+"\n");
		}
		gugudan.append("</pre></div>");
		return gugudan.toString();
	}
}
