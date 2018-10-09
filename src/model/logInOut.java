package model;

import java.sql.*;
import model.DBConnection;;

public class logInOut {
	
	public String checkNull(String input_id, String input_pw){
		String error_message = "";
		if("".equals(input_id) || "".equals(input_pw))
			error_message = "請輸入帳號與密碼";

		return error_message;
	}
	
	public String login(String ID, String pw){
		
		DBConnection dbc = new DBConnection();
		Connection conn = dbc.connect_mysql("KyotoExchangeDB");

		String error_message = "輸入帳號錯誤，查無此帳號";

		try {
			Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

			try {
				ResultSet user_map = stmt.executeQuery("SELECT * FROM user");
				while (user_map.next()) {
					if (ID.equals(user_map.getString("ID"))) {
						if (pw.equals(user_map.getString("password"))) {
							error_message = "";
							break;
						} else {
							error_message = "輸入密碼錯誤";
						}

					}
				}

				// 關閉連線
				user_map.close();
				user_map = null;
				stmt.close();
				stmt = null;
				conn.close();
				return error_message;
			} catch (Exception ex) {
				System.out.println("can't read data");
				System.out.println(ex.toString());
				error_message = "can't read data";
				return error_message;
			}
		} catch (Exception e) {
			System.out.println("can't create statement");
			System.out.println(e.toString());
			error_message = "can't create statement";
			return error_message;
		}
	}
}
