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
@WebServlet("/Logout")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	logInOut log = new logInOut();
	
	protected void clear(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
    	System.out.println(this.getServletName());
    	request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		// remove session
		request.getSession().invalidate();
		
		response.sendRedirect("index.jsp");
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		clear(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		clear(request, response);
	}

}
