package model;

import java.sql.*;
import java.util.HashMap;
import java.util.Map;

public class searchKeyword {
	
	public Map search(String keyword) {

		DBConnection dbc = new DBConnection();
		Connection conn = dbc.connect_mysql("KyotoExchangeDB");

		try {
			Statement stmt_search = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			Statement memo_stmt_search = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			try {
				String sql = "SELECT * FROM article WHERE (title LIKE '%" + keyword + "%'OR content LIKE '%" + keyword + "%');";
				ResultSet rs = stmt_search.executeQuery(sql);
				String memo_sql = "SELECT * "
						+ "FROM (SELECT * FROM memo "
						+ "UNION "
						+ "SELECT * FROM nihongo "
						+ "UNION "
						+ "SELECT * FROM recipe) AS M "
						+ "WHERE (M.title LIKE '%" + keyword + "%'OR M.content LIKE '%" + keyword + "%');";
				ResultSet memo_rs = memo_stmt_search.executeQuery(memo_sql);

				String id = "";
				String title = "";
				Map<String, String> keyword_articles = new HashMap<>();
				
				int count = 0;
				int memo_count = 0;
				if(rs.last())
					count = rs.getRow(); // move to the last row
				rs.first(); // return to the first row
				if(memo_rs.last())
					memo_count = memo_rs.getRow(); // move to the last row
				memo_rs.first(); // return to the first row

				if(count == 0 && memo_count == 0){
					title = "搜尋字詞無符合的結果！";
					System.out.println(title);
					keyword_articles.put(null, title);
					
					// 關閉連線
					stmt_search.close();
					stmt_search = null;
					memo_stmt_search.close();
					memo_stmt_search = null;
					conn.close();
				}else{
					//String[] keyword_articles;
					//keyword_articles = new String[count];
					
					for(int i = 0; i < count; i++){
						id = rs.getString("article_id");
						title = rs.getString("title");
						
						//keyword_articles[i] = rs.getString("article_id");
						keyword_articles.put(id, title); // key is article_id, value is title
						rs.next();
					}
					for(int i = 0; i < memo_count; i++){
						id = "memo/" + memo_rs.getString("article_id"); // to enter another layer of folders
						title = memo_rs.getString("title");
						
						//keyword_articles[i] = rs.getString("article_id");
						keyword_articles.put(id, title); // key is article_id, value is title
						memo_rs.next();
					}
					//System.out.println(keyword_articles[0]);
					
					// 關閉連線
					stmt_search.close();
					stmt_search = null;
					memo_stmt_search.close();
					memo_stmt_search = null;
					conn.close();
				}
				return keyword_articles;
				
			} catch (Exception ex) {
				System.out.println("can't read data");
				System.out.println(ex.toString());
				return null;
			}
		} catch (Exception e) {
			System.out.println("can't create statement");
			System.out.println(e.toString());
			return null;
		}
	}
}
