package ViewPage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ViewPage/main")
public class MainPage extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
request.setCharacterEncoding("UTF-8");
	HttpSession session = request.getSession(true);
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		
		//redirect
		
		//forward
		request
		.getRequestDispatcher("/ViewPage/main.jsp")
		.forward(request,response);
		
	}
}
