package test.exam;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/fortune")
public class FortuneServlet extends HttpServlet{
    @Override
    protected void service(HttpServletRequest req,
        HttpServletResponse resp) throws ServletException, IOException {
	        //가
	        RequestDispatcher rd=req.getRequestDispatcher("/test/fortune.jsp");
	        rd.forward(req, resp);
        }
}