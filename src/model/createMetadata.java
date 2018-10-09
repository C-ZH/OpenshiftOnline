package model;

import java.sql.*;
import model.DBConnection;

public class createMetadata {
	// for diary article
	public void create(String title, String year, String month, String date, String tag, String intro, String content) {

		DBConnection dbc = new DBConnection();
		Connection conn = dbc.connect_mysql("KyotoExchangeDB");

		try {
			Statement stmt_insert = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			Statement stmt_count = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);

			try {
				String sql = "SELECT * FROM article;";
				ResultSet rs = stmt_count.executeQuery(sql);
				int count = 1;
				if(rs.last())
					count = rs.getRow() + 1; // move to the last row
				rs.first(); // return to the first row
				String article_id = "article_" + count;
				
				sql = "INSERT INTO article VALUES(" + "'" + article_id + "', '" + title + "', '" + year + "', " + "'"
						+ month + "', " + "'" + date + "', " + "'" + tag + "', '" + intro + "', '" + content + "')";
				stmt_insert.executeUpdate(sql); // remember to use "Update"
				// 關閉連線
				stmt_insert.close();
				stmt_insert = null;
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
	
	// for recipe
	public void recipe_create(String recipe_title, String recipe_year, String recipe_month, String recipe_date,
			String recipe_tag, String recipe_content) {

		DBConnection dbc = new DBConnection();
		Connection conn = dbc.connect_mysql("KyotoExchangeDB");

		try {
			Statement stmt_insert = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			Statement stmt_count = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);

			try {
				String sql = "SELECT * FROM recipe;";
				ResultSet rs = stmt_count.executeQuery(sql);
				int count = 1;
				if(rs.last())
					count = rs.getRow() + 1; // move to the last row
				rs.first(); // return to the first row
				String recipe_id = "";
				if(count < 10)
					recipe_id = "recipe_0" + count;
				else
					recipe_id = "recipe_" + count;
				
				sql = "INSERT INTO recipe VALUES(" + "'" + recipe_id + "', '" + recipe_title + "', '" + recipe_year + "', " + "'"
						+ recipe_month + "', " + "'" + recipe_date + "', " + "'" + recipe_tag + "', '" + recipe_content + "')";
				stmt_insert.executeUpdate(sql); // remember to use "Update"
				// 關閉連線
				stmt_insert.close();
				stmt_insert = null;
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
	
	// for memo
	public void memo_create(String memo_title, String memo_year, String memo_month, String memo_date, 
			String memo_tag, String memo_content) {

		DBConnection dbc = new DBConnection();
		Connection conn = dbc.connect_mysql("KyotoExchangeDB");

		try {
			Statement stmt_insert = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			Statement stmt_count = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);

			try {
				String sql = "SELECT * FROM memo;";
				ResultSet rs = stmt_count.executeQuery(sql);
				int count = 1;
				if(rs.last())
					count = rs.getRow() + 1; // move to the last row
				rs.first(); // return to the first row
				String memo_id = "";
				if(count < 10)
					memo_id = "memo_0" + count;
				else
					memo_id = "memo_" + count;
				
				sql = "INSERT INTO memo VALUES(" + "'" + memo_id + "', '" + memo_title + "', '" + memo_year + "', " + "'"
						+ memo_month + "', " + "'" + memo_date + "', " + "'" + memo_tag + "', '" + memo_content + "')";
				stmt_insert.executeUpdate(sql); // remember to use "Update"
				// 關閉連線
				stmt_insert.close();
				stmt_insert = null;
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
	
	// for nihongo
	public void nihongo_create(String nihongo_title, String nihongo_year, String nihongo_month, String nihongo_date, 
			String nihongo_tag, String nihongo_content) {

		DBConnection dbc = new DBConnection();
		Connection conn = dbc.connect_mysql("KyotoExchangeDB");

		try {
			Statement stmt_insert = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			Statement stmt_count = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);

			try {
				String sql = "SELECT * FROM nihongo;";
				ResultSet rs = stmt_count.executeQuery(sql);
				int count = 1;
				if(rs.last())
					count = rs.getRow() + 1; // move to the last row
				rs.first(); // return to the first row
				String nihongo_id ="";
				if(count < 10)
					nihongo_id = "nihongo_0" + count;
				else
					nihongo_id = "nihongo_" + count;
				
				sql = "INSERT INTO nihongo VALUES(" + "'" + nihongo_id + "', '" + nihongo_title + "', '" + nihongo_year + "', " + "'"
						+ nihongo_month + "', " + "'" + nihongo_date + "', " + "'" + nihongo_tag + "', '" + nihongo_content + "')";
				stmt_insert.executeUpdate(sql); // remember to use "Update"
				// 關閉連線
				stmt_insert.close();
				stmt_insert = null;
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
