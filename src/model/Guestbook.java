package model;

import java.sql.*;
import model.DBConnection;

public class Guestbook {
	public void addPost(String page, String name, String content, String time) {

		DBConnection dbc = new DBConnection();
		Connection conn = dbc.connect_mysql("KyotoExchangeDB");

		try {
			Statement stmt_row_count = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
					ResultSet.CONCUR_READ_ONLY);
			Statement stmt_insert = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);

			try {
				ResultSet row_count = stmt_row_count.executeQuery("SELECT * FROM guestbook");
				
				int id = 0;
				// before inserting
				while (row_count.next()) {
					id++;
				}				
				System.out.println(id);

				String sql = "INSERT INTO guestbook VALUES(" + "'" + id + "', '" + name + "', " + "'"
						+ content + "', " + "'" + time + "', '" + page + " ')";
				stmt_insert.executeUpdate(sql); // remember to use "Update"
				// 關閉連線
				row_count.close();
				row_count = null;
				stmt_insert.close();
				stmt_insert = null;
				stmt_row_count.close();
				stmt_row_count = null;
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
	
	public void addFeedback(String page, int post_id, String name, String content, String time) {

		DBConnection dbc = new DBConnection();
		Connection conn = dbc.connect_mysql("KyotoExchangeDB");

		try {
			Statement stmt_row_count = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
					ResultSet.CONCUR_READ_ONLY);
			Statement stmt_insert = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);

			try {
				ResultSet row_count = stmt_row_count.executeQuery("SELECT * FROM re_guestbook");
				
				int id = 0;
				// before inserting
				while (row_count.next()) {
					id++;
				}
				System.out.println(id);
				
				String sql = "INSERT INTO re_guestbook" + " VALUES(" +  id + ", " + "'" + name + "', " + "'"
						+ content + "', " + "'" + time + "', '" + page + "', " + post_id + ")";
				stmt_insert.executeUpdate(sql); // remember to use "Update"
				// 關閉連線
				row_count.close();
				row_count = null;
				stmt_insert.close();
				stmt_insert = null;
				stmt_row_count.close();
				stmt_row_count = null;
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
	
	public String addZero(String time) {
		String result = time;
		if (Integer.parseInt(time) < 10) {
			result = "0" + time;
		}
		return result;
	}
	
	public String[] showPost(String content){
		//String space_word[] = content.split(" "); // only a space!
		String space_word[] = content.split(""); // split all
		String space_word_all = "";
		for(int i = 0; i < space_word.length; i ++){
			if(space_word[i].equals(" ")){
				space_word[i] = "&nbsp;";
			}
			space_word_all = space_word_all + space_word[i];
		}
		String enter_word[] = space_word_all.split("\n"); // back slash
		return enter_word;
	}
	
	public boolean checkNull(String input_user, String input_content){
		if("".equals(input_user) || "".equals(input_content)){
			return false;
		}else{
			return true;
		}
	}
}
