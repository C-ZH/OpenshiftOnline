package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.net.URLEncoder;
import java.net.URLDecoder;

import model.Guestbook;

import java.util.Calendar;

/**
 * Servlet implementation class AddPost
 */
@WebServlet("/AddPost")
public class AddPost extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	Guestbook gb = new Guestbook();
	
	protected void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
    	System.out.println(this.getServletName());
    	
    	request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		//取得傳送時間
		Calendar thisMonth=Calendar.getInstance(); 
		String year=String.valueOf(thisMonth.get(Calendar.YEAR));
		String month=String.valueOf(thisMonth.get(Calendar.MONTH) + 1); // from 0
		month = gb.addZero(month);
		String day=String.valueOf(thisMonth.get(Calendar.DAY_OF_MONTH));
		day = gb.addZero(day);
		//because AWS, Taiwan should plus 8
		String hour=String.valueOf(thisMonth.get(Calendar.HOUR_OF_DAY) + 8);
		hour = gb.addZero(hour);
		String minute=String.valueOf(thisMonth.get(Calendar.MINUTE));
		minute = gb.addZero(minute);
		String second=String.valueOf(thisMonth.get(Calendar.SECOND));
		second = gb.addZero(second);
		
		String table_name = request.getParameter("table_name");
		String user = request.getParameter("user");
		String content = request.getParameter("content");
		String time = year + "/" + month + "/" + day + "  "
					+ hour + ":" + minute + ":" + second; 
		
		if(gb.checkNull(user, content)){	
			gb.addPost(table_name, user, content, time);
			String page = "article/" + URLEncoder.encode(request.getParameter("page"), "UTF-8");
			page = page.replaceAll("\\+", " ");
			response.sendRedirect(page);
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

}
