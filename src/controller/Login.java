package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.logInOut;

/**
 * Servlet implementation class Admin
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	logInOut log = new logInOut();
	
	protected void processLogin(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
    	System.out.println(this.getServletName());
    	request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String error_message = "";
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		error_message = log.checkNull(id, pw);
		if (("".equals(error_message))) {
			error_message = log.login(id, pw);
		}else{
			request.setAttribute("error_message", error_message);
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		
		if (!("".equals(error_message))) {
			request.setAttribute("error_message", error_message);
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}else{
			// get authority
			request.getSession().setAttribute("isAdmin", true);
			response.sendRedirect("index.jsp");
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processLogin(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processLogin(request, response);
	}

}
