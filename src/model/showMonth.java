package model;

import java.sql.*;

public class showMonth {
	
	public int count;
	public int count_1;
	public int count_10;
	public int count_100;
	public int memo_count;
	
	public String[] month_title_1;
	public String[] month_page_1;
	public String[] month_title_10;
	public String[] month_page_10;
	public String[] month_title_100;
	public String[] month_page_100;
	
	public String[] memo_month_title;	
	public String[] memo_month_page;
	
	public void show_month(String year, String month) {

		DBConnection dbc = new DBConnection();
		Connection conn = dbc.connect_mysql("KyotoExchangeDB");


		try {
			Statement stmt_search = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			// Search for MONTH
			try {
					String sql = "SELECT * FROM article WHERE (year='" + year + "' AND month='" + month +"');";
					ResultSet rs = stmt_search.executeQuery(sql);
					
					String[] month_title;	
					String[] month_page;
					
					//init
					count = 0;
					count_1 = 0;
					count_10 = 0;
					count_100 = 0;
					
					if(rs.last())
						count = rs.getRow(); // move to the last row
					rs.first(); // return to the first row
					System.out.println(count);
					
					month_title = new String[count];
					month_page = new String[count];
					
					// to divide 1, 10 and 100
					for(int i = 0; i < count; i ++){
						month_title[i] = rs.getString("title");
						month_page[i] = rs.getString("article_id");
					
						int char_length = month_page[i].length();
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
					
					if(count_1 == 0)
						count_1 = 1;
					if(count_10 == 0)
						count_10 = 1;
					if(count_100 == 0)
						count_100 = 1;
					month_title_1 = new String[count_1];
					month_page_1 = new String[count_1];
					month_title_10 = new String[count_10];
					month_page_10 = new String[count_10];
					month_title_100 = new String[count_100];
					month_page_100 = new String[count_100];
					
					int j = 0;
					int k = 0;
					int l = 0;
					for(int i = 0; i < count; i ++){
						int char_length = month_page[i].length();
						if(char_length == 9){
							month_page_1[j] = month_page[i];
							month_title_1[j] = month_title[i];
							j ++;
						}
						else if(char_length == 10){
							month_page_10[k] = month_page[i];
							month_title_10[k] = month_title[i];
							k ++;
						}
						else if(char_length == 11){
							month_page_100[l] = month_page[i];
							month_title_100[l] = month_title[i];
							l ++;
						}
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
	
	public void show_allmemo_month(String year, String month) {

		DBConnection dbc = new DBConnection();
		Connection conn = dbc.connect_mysql("KyotoExchangeDB");

		try {
			Statement stmt_search = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			// Search for MONTH
			try {
					// Notice the SPACE between char when changing line
					String sql = "SELECT * "
							+ "FROM (SELECT * FROM memo "
							+ "UNION "
							+ "SELECT * FROM nihongo "
							+ "UNION "
							+ "SELECT * FROM recipe) AS M "
							+ "WHERE (M.year='" + year + "' AND M.month='" + month +"');";
					ResultSet rs = stmt_search.executeQuery(sql);
					
					// inti
					memo_count = 0;
					if(rs.last())
						memo_count = rs.getRow(); // move to the last row
					rs.first(); // return to the first row
					System.out.println(memo_count);
					// without the following if-else, we cannot hold the null resultset
					// besides, why can't we get the correct memo_month_title[0] when it's not null resultset without if-else?
					if(memo_count == 0){
						memo_month_title = new String[1];
						memo_month_page = new String[1];
					}else{
						memo_month_title = new String[memo_count];
						memo_month_page = new String[memo_count];
					}
					
					// to divide 1, 10 and 100
					for(int i = 0; i < memo_count; i ++){
						memo_month_title[i] = rs.getString("title");
						memo_month_page[i] = rs.getString("article_id");
					
						/*
						int char_length = month_page[i].length();
						if(char_length == 9){
							count_1 ++;
						}
						else if(char_length == 10){
							count_10 ++;
						}
						else if(char_length == 11){
							count_100 ++;
						}
						*/
						rs.next();
					}
					/*
					if(count_1 == 0)
						count_1 = 1;
					if(count_10 == 0)
						count_10 = 1;
					if(count_100 == 0)
						count_100 = 1;
					month_title_1 = new String[count_1];
					month_page_1 = new String[count_1];
					month_title_10 = new String[count_10];
					month_page_10 = new String[count_10];
					month_title_100 = new String[count_100];
					month_page_100 = new String[count_100];
					
					int j = 0;
					int k = 0;
					int l = 0;
					for(int i = 0; i < count; i ++){
						int char_length = month_page[i].length();
						if(char_length == 9){
							month_page_1[j] = month_page[i];
							month_title_1[j] = month_title[i];
							j ++;
						}
						else if(char_length == 10){
							month_page_10[k] = month_page[i];
							month_title_10[k] = month_title[i];
							k ++;
						}
						else if(char_length == 11){
							month_page_100[l] = month_page[i];
							month_title_100[l] = month_title[i];
							l ++;
						}
						
					}
					*/
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
