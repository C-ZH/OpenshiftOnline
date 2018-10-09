package controller;

import java.io.IOException;
import java.util.Map;
import java.util.Set;
import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.searchKeyword;

/**
 * Servlet implementation class Admin
 */
@WebServlet("/Search")
public class Search extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	searchKeyword sk = new searchKeyword();
	
	protected void processLogin(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
    	System.out.println(this.getServletName());
    	request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String keyword = request.getParameter("query");
		//String[] search_result = sk.search(keyword);
		Map<String, String> search_result = sk.search(keyword);
		//System.out.println(search_result[0]);
		
		int length = search_result.size();
		String[] keyword_page = new String[length];
		String[] keyword_title = new String[length];
		// 找出全部key，以下有點不懂
		Set<String> setKey = search_result.keySet();
		Iterator<String> iterator = setKey.iterator();
		int i = 0;
		while(iterator.hasNext()){
			String key = iterator.next();
			keyword_page[i] = key;
			i ++;
		}
		System.out.println(keyword_page[0]);
		for(int j = 0; j < keyword_page.length; j ++){
			keyword_title[j] = search_result.get(keyword_page[j]);
		}
		System.out.println(keyword_title[0]);
		
		request.setAttribute("keyword", keyword);
		//request.setAttribute("search_result", search_result);
		request.setAttribute("keyword_page", keyword_page);
		request.setAttribute("keyword_title", keyword_title);
		request.getRequestDispatcher("search_result.jsp").forward(request, response);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processLogin(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processLogin(request, response);
	}

}
