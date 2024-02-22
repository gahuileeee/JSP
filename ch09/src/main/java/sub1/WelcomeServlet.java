package sub1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WelcomeServlet extends HttpServlet{

	private static final long serialVersionUID = 5067275711331021041L;

	@Override
	public void init() throws ServletException {
		System.out.println("WelcomServlet init...");
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			//Get 요청이 들어올 때
			System.out.println("WelcomServlet doGet()...");
			
			//HTML 출력
			resp.setContentType("text/html;charset=utf-8"); //browser가 아 html 문서이구나를 알게 됨
			
			PrintWriter writer = resp.getWriter();
			writer.println("<html>");
			writer.println("<head>");
			writer.println("<meta charset='utf-8'>");
			writer.println("<title>WelcomServlet</title>");
			writer.println("</head>");
			writer.println("<body>");
			writer.println("<h3>WelcomServlet<h3>");
			writer.println("<a href='./1.servletTest.jsp'>Servlet 메인</a>");
			writer.println("<a href='./hello.do'>HelloServlet</a>");
			writer.println("<a href='./welcome.do'>WelcomeServlet</a>");
			writer.println("<a href='./greeting.do'>GreetingServlet</a>");
			writer.println("</body>");
			writer.println("</html>");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("WelcomServlet doPost...");
	}
	
	@Override
	public void destroy() {
		System.out.println("WelcomServlet destory...");
	}
}
