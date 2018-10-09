package controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.createMetadata;

/**
 * Servlet implementation class AddPost
 */
@WebServlet("/NewMemo")
public class NewMemo extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	createMetadata meta = new createMetadata();
	
	protected void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
    	System.out.println(this.getServletName());
    	
    	request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String title = request.getParameter("title");
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String date = request.getParameter("date");
		String tag = request.getParameter("tag");
		String content = request.getParameter("content");

		meta.memo_create(title, year, month, date, tag, content);
		response.sendRedirect("index.jsp");
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

}
