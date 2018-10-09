package controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.deletePost;

/**
 * Servlet implementation class AddPost
 */
@WebServlet("/DeleteFeedback")
public class DeleteFeedback extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	deletePost del = new deletePost();
	
	protected void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
    	System.out.println(this.getServletName());
    	
    	request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		//String table_name = request.getParameter("table_name");
		int re_post_id = Integer.parseInt(request.getParameter("re_post_id"));
		del.deleteReRow(re_post_id);
		String page = "article/" + URLEncoder.encode(request.getParameter("page"), "UTF-8");
		page = page.replaceAll("\\+", " ");
		response.sendRedirect(page);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

}
