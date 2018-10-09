package model;

import java.sql.*;

public class deletePost {
	
	public void deleteRow(int post_id) {

		DBConnection dbc = new DBConnection();
		Connection conn = dbc.connect_mysql("KyotoExchangeDB");

		try {
			Statement stmt_del = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			Statement stmt_adjust = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			try {
				String sql = "DELETE FROM guestbook WHERE post_id=" + "'" + post_id + "';";
				// after removing, change id;
				String adj = "UPDATE guestbook SET post_id = post_id - 1 WHERE post_id > " + post_id + ";";
				stmt_del.executeUpdate(sql); // remember to use "Update"
				stmt_adjust.executeUpdate(adj);
				
				// remove feedbacks in the same post
				sql = "SELECT * FROM re_guestbook WHERE post_id=" + "'" + post_id + "';";
				ResultSet rs = stmt_del.executeQuery(sql);
				int re_adj = 0; // because after removing 1 row of rs, the re_post_id in rs doesn't change along deletion
				while(rs.next()){
					int re_post_id = rs.getInt("re_post_id");
					// connection twice is OK?
					deleteReRow(re_post_id - re_adj);
					re_adj ++;
				}
				// adjust the FK
				adj = "UPDATE re_guestbook SET post_id = post_id - 1 WHERE post_id > " + post_id + ";";
				stmt_adjust.executeUpdate(adj);
				
				// 關閉連線
				stmt_del.close();
				stmt_del = null;
				stmt_adjust.close();
				stmt_adjust = null;
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
	
	public void deleteReRow(int re_post_id) {

		DBConnection dbc = new DBConnection();
		Connection conn = dbc.connect_mysql("KyotoExchangeDB");

		try {
			Statement stmt_del = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			Statement stmt_adjust = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			try {
				String sql = "DELETE FROM re_guestbook WHERE re_post_id=" + "'" + re_post_id + "';";
				// after removing, change id;
				String adj = "UPDATE re_guestbook SET re_post_id = re_post_id - 1 WHERE re_post_id > " + re_post_id + ";";

				stmt_del.executeUpdate(sql); // remember to use "Update"
				stmt_adjust.executeUpdate(adj);
				
				// 關閉連線
				stmt_del.close();
				stmt_del = null;
				stmt_adjust.close();
				stmt_adjust = null;
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
