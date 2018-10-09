package model;

import java.sql.*;

public class showPost {
	
	public String[] post_id;
	public String[] post_title;
	public String[] post_year;
	public String[] post_month;
	public String[] post_date;
	public String[] post_tag;
	public String[] post_intro;
	
	public int count;
	
	public void show_post() {

		DBConnection dbc = new DBConnection();
		Connection conn = dbc.connect_mysql("KyotoExchangeDB");


		try {
			Statement stmt_search = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			// Search for MONTH
			try {
					String sql = "SELECT * FROM article;";
					ResultSet rs = stmt_search.executeQuery(sql);
					
					String[] post_id_1;
					String[] post_title_1;
					String[] post_year_1;
					String[] post_month_1;
					String[] post_date_1;
					String[] post_tag_1;
					String[] post_intro_1;
					
					String[] post_id_10;
					String[] post_title_10;
					String[] post_year_10;
					String[] post_month_10;
					String[] post_date_10;
					String[] post_tag_10;
					String[] post_intro_10;
					
					String[] post_id_100;
					String[] post_title_100;
					String[] post_year_100;
					String[] post_month_100;
					String[] post_date_100;
					String[] post_tag_100;
					String[] post_intro_100;
					
					//init
					count = 0;
					int count_1 = 0;
					int count_10 = 0;
					int count_100 = 0;
					
					if(rs.last())
						count = rs.getRow(); // move to the last row
					rs.first(); // return to the first row
					System.out.println(count);
					
					post_id = new String[count];
					post_title = new String[count];
					post_year = new String[count];
					post_month = new String[count];
					post_date = new String[count];
					post_tag = new String[count];
					post_intro = new String[count];
						
					// to divide 1, 10 and 100
					for(int i = 0; i < count; i ++){
						post_id[i] = rs.getString("article_id");
						post_title[i] = rs.getString("title");
						post_year[i] = rs.getString("year");
						post_month[i] = rs.getString("month");
						post_date[i] = rs.getString("date");
						post_tag[i] = rs.getString("tag");
						post_intro[i] = rs.getString("intro");
							
						int char_length = post_id[i].length();
						if(char_length == 9){
							count_1 ++;
						}
						else if(char_length == 10){
							count_10 ++;
						}
						else if(char_length == 11){
							count_100 ++;
						}
						rs.next();
					}
					
					// set i but not use "if" => because id using "if", these will become local var
					boolean has1 = true, has10 = true, has100 = true;
					if(count_1 == 0){
						count_1 = 1;
						has1 = false;
					}
					if(count_10 == 0){
						count_10 = 1;
						has10 = false;
					}
					if(count_100 == 0){
						count_100 = 1;
						has100 = false;
					}
					post_id_1 = new String[count_1];
					post_title_1 = new String[count_1];
					post_year_1 = new String[count_1];
					post_month_1 = new String[count_1];
					post_date_1 = new String[count_1];
					post_tag_1 = new String[count_1];
					post_intro_1 = new String[count_1];
					
					post_id_10 = new String[count_10];
					post_title_10 = new String[count_10];
					post_year_10 = new String[count_10];
					post_month_10 = new String[count_10];
					post_date_10 = new String[count_10];
					post_tag_10 = new String[count_10];
					post_intro_10 = new String[count_10];
					
					post_id_100 = new String[count_100];
					post_title_100 = new String[count_100];
					post_year_100 = new String[count_100];
					post_month_100 = new String[count_100];
					post_date_100 = new String[count_100];
					post_tag_100 = new String[count_100];
					post_intro_100 = new String[count_100];
					if(!has1)
						count_1 = 0;
					if(!has10)
						count_10 = 0;
					if(!has100)
						count_100 = 0;
					
					int j = 0;
					int k = 0;
					int l = 0;
					for(int i = 0; i < count; i ++){
						int char_length = post_id[i].length();
						if(char_length == 9){
							post_id_1[j] = post_id[i];
							post_title_1[j] = post_title[i];
							post_year_1[j] = post_year[i];
							post_month_1[j] = post_month[i];
							post_date_1[j] = post_date[i];
							post_tag_1[j] = post_tag[i];
							post_intro_1[j] = post_intro[i];
							j ++;
						}
						else if(char_length == 10){
							post_id_10[k] = post_id[i];
							post_title_10[k] = post_title[i];
							post_year_10[k] = post_year[i];
							post_month_10[k] = post_month[i];
							post_date_10[k] = post_date[i];
							post_tag_10[k] = post_tag[i];
							post_intro_10[k] = post_intro[i];
							k ++;
						}
						else if(char_length == 11){
							post_id_100[l] = post_id[i];
							post_title_100[l] = post_title[i];
							post_year_100[l] = post_year[i];
							post_month_100[l] = post_month[i];
							post_date_100[l] = post_date[i];
							post_tag_100[l] = post_tag[i];
							post_intro_100[l] = post_intro[i];
							l ++;
						}
					}
					
						for(int a = 0; a < count_1; a ++){
							post_id[a] = post_id_1[a];
							post_title[a] = post_title_1[a];
							post_year[a] = post_year_1[a];
							post_month[a] = post_month_1[a];
							post_date[a] = post_date_1[a];
							post_tag[a] = post_tag_1[a];
							post_intro[a] = post_intro_1[a];
						}
						for(int b = 0; b < count_10; b ++){
							post_id[count_1 + b] = post_id_10[b];
							post_title[count_1 + b] = post_title_10[b];
							post_year[count_1 + b] = post_year_10[b];
							post_month[count_1 + b] = post_month_10[b];
							post_date[count_1 + b] = post_date_10[b];
							post_tag[count_1 + b] = post_tag_10[b];
							post_intro[count_1 + b] = post_intro_10[b];
						}
						for(int c = 0; c < count_100; c ++){
							post_id[count_1 + count_10 + c] = post_id_100[c];
							post_title[count_1 + count_10 + c] = post_title_100[c];
							post_year[count_1 + count_10 + c] = post_year_100[c];
							post_month[count_1 + count_10 + c] = post_month_100[c];
							post_date[count_1 + count_10 + c] = post_date_100[c];
							post_tag[count_1 + count_10 + c] = post_tag_100[c];
							post_intro[count_1 + count_10 + c] = post_intro_100[c];
						}
						
				// 關閉連線
				stmt_search.close();
				stmt_search = null;
				conn.close();
			} catch (Exception ex) {
				System.out.println("can't read data");
				System.out.println(ex.toString());
			}
		} catch (Exception e) {
			System.out.println("can't create statement");
			System.out.println(e.toString());
		}
	}
}
