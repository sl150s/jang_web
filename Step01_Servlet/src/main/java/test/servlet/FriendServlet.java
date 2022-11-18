package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/friends/list")
public class FriendServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//친구목록(sample data)
		List<String> names=new ArrayList<>();
		names.add("김구라");
		names.add("해골");
		names.add("원숭이");
		
		
		// 응답 인코딩 설정
		resp.setCharacterEncoding("utf-8");
		// 응답 컨텐트 설정
		resp.setContentType("text/html; charset=utf-8");
		// 클라이언트의 웹브라우저에 문자열을 출력할수 있는 객체의 참조값 얻어내기
		PrintWriter pw = resp.getWriter();
		pw.println("<!doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset=\"utf-8\">");
		pw.println("<title></title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<ul>");
		//names에 들어있는 친구목록을 활용해서 친구목록을 출력해 보세요.(ul, li 요소 활용) 
		for(int i =0; i<names.size(); i++) {
			String tmp = names.get(i);
			pw.println("<li>"+tmp+"</li>");
		}
		
		//확장 for문을 활용하면
		for(String tmp:names) {
			pw.println("<li>"+tmp+"</li>");
		}
		pw.println("</ul>");
		pw.println("</body>");
		pw.println("</html>");
		pw.close();// 닫아주기
	}
}
