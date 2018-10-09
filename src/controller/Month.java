package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;
import model.showMonth;

/**
 * Servlet implementation class Admin
 */
@WebServlet("/Month")
public class Month extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	showMonth sm = new showMonth();
	
	protected void processLogin(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException{
    	System.out.println(this.getServletName());
    	request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String year = (String) request.getAttribute("year");
		String month = (String) request.getAttribute("month");
		String monthArticle = (String) request.getAttribute("month_page");
		System.out.println(year);
		System.out.println(month);
		
		sm.show_month(year, month);
		sm.show_allmemo_month(year, month);
		int count = sm.count;
		int count_1 = sm.count_1;
		int count_10 = sm.count_10;
		int count_100 = sm.count_100;
		int memo_count = sm.memo_count;
		
		String[] month_title_1 = sm.month_title_1;
		String[] month_title_10 = sm.month_title_10;
		String[] month_title_100 = sm.month_title_100;
		String[] month_page_1 = sm.month_page_1;
		String[] month_page_10 = sm.month_page_10;
		String[] month_page_100 = sm.month_page_100;
		String[] memo_month_title = sm.memo_month_title;
		String[] memo_month_page = sm.memo_month_page;
		
		request.setAttribute("page_count", count);
		request.setAttribute("page_count_1", count_1);
		request.setAttribute("page_count_10", count_10);
		request.setAttribute("page_count_100", count_100);
		request.setAttribute("memo_count", memo_count);
		
		request.setAttribute("month_page_1", month_page_1);
		request.setAttribute("month_page_10", month_page_10);
		request.setAttribute("month_page_100", month_page_100);
		
		request.setAttribute("month_title_1", month_title_1);
		request.setAttribute("month_title_10", month_title_10);
		request.setAttribute("month_title_100", month_title_100);
		
		request.setAttribute("memo_month_title", memo_month_title);
		request.setAttribute("memo_month_page", memo_month_page);
		
		System.out.println(month_title_1[0]);
		System.out.println(month_title_10[0]);
		System.out.println(memo_month_title[0]);
				
		request.getRequestDispatcher(monthArticle).forward(request, response);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			processLogin(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			processLogin(request, response);
	}

}
