package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.showPost;
import model.Guestbook;

/**
 * Servlet implementation class Admin
 */
@WebServlet("/PostIndex")
public class PostIndex extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	showPost sp = new showPost();
	Guestbook gb = new Guestbook();
	
	protected void processLogin(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException{
    	System.out.println(this.getServletName());
    	request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		sp.show_post();
		int post_count = sp.count;
		
		String[] post_id = sp.post_id;
		String[] post_title = sp.post_title;
		String[] post_year = sp.post_year;
		String[] post_month = sp.post_month;
		String[] post_date = sp.post_date;
		String[] post_tag = sp.post_tag;
		String[] post_intro = sp.post_intro;
		
		// deal with post_intro, replacing "\n" with <br/>, and " " with &nbsp;
		// refer from Guestbook.showPost, but making String array a String
		for(int i = 0; i < post_intro.length; i ++){
			String space_word[] = post_intro[i].split(""); // split all
			String space_word_all = "";
			for(int j = 0; j < space_word.length; j ++){
				if(space_word[j].equals(" ")){
					space_word[j] = "&nbsp;";
				}
				if(space_word[j].equals("\n")){ // "\n" is only 1 char. 1 bit???
					space_word[j] = "<br/>";
				}
				space_word_all = space_word_all + space_word[j];
			}
			post_intro[i] = space_word_all;
		}
		
		int page_num = 0;
		String back_ability = "";
		String next_ability = "";
		String page_index = request.getParameter("page_index");
		System.out.println("page: " + page_index);
		if(page_index != null){
			page_num = Integer.parseInt(page_index) - 1;
		}
		
		// the init is NULL
		String[] post_id_index = new String[5];
		String[] post_title_index = new String[5];
		String[] post_year_index = new String[5];
		String[] post_month_index = new String[5];
		String[] post_date_index = new String[5];
		String[] post_tag_index = new String[5];
		String[] post_tagCode_index = new String[5];
		String[] post_intro_index = new String[5];
		
		boolean page_num_end = false;
		for(int i = 0; i < 5; i ++){
			if((page_num * 5 + i + 1) == post_count){
				page_num_end = true;
			}
			if((page_num * 5 + i + 1) > post_count){
				page_num_end = true;
				break;
			}
			post_id_index[i] = post_id[post_count - (page_num * 5 + i) - 1];
			post_title_index[i] = post_title[post_count - (page_num * 5 + i) - 1];
			post_year_index[i] = post_year[post_count - (page_num * 5 + i) - 1];
			post_month_index[i] = post_month[post_count - (page_num * 5 + i) - 1];
			post_date_index[i] = post_date[post_count - (page_num * 5 + i) - 1];
			post_tag_index[i] = post_tag[post_count - (page_num * 5 + i) - 1];
			if(post_tag_index[post_count - (page_num * 5 + i) - 1].equals("生活")){
				post_tagCode_index[i] = "life";
			}else if(post_tag_index[post_count - (page_num * 5 + i) - 1].equals("同志社")){
				post_tagCode_index[i] = "school";
			}else if(post_tag_index[post_count - (page_num * 5 + i) - 1].equals("旅行")){
				post_tagCode_index[i] = "travel";
			}
			post_intro_index[i] = post_intro[post_count - (page_num * 5 + i) - 1];
		}
		
		// back, next ability
		if(page_num == 0)
			back_ability = "disabled";
		if(page_num_end)
			next_ability = "disabled";
		
		request.setAttribute("post_count", post_count);
		request.setAttribute("post_id_index", post_id_index);
		request.setAttribute("post_title_index", post_title_index);
		request.setAttribute("post_year_index", post_year_index);
		request.setAttribute("post_month_index", post_month_index);	
		request.setAttribute("post_date_index", post_date_index);
		request.setAttribute("post_tag_index", post_tag_index);
		request.setAttribute("post_tagCode_index", post_tagCode_index);
		request.setAttribute("post_intro_index", post_intro_index);
		
		request.setAttribute("back_ability", back_ability);
		request.setAttribute("next_ability", next_ability);
		
		System.out.println(post_count);
		System.out.println(post_title_index[0]);
		System.out.println(post_title_index[1]);
		System.out.println(post_title_index[2]);
		System.out.println(post_title_index[3]);
		System.out.println(post_title_index[4]);
				
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			processLogin(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			processLogin(request, response);
	}

}
