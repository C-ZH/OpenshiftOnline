package model;

import java.sql.*;

public class DBConnection {
	
	public Connection connect_mysql(String database) {
		String driver = "com.mysql.jdbc.Driver";
		/*
		String url = "jdbc:mysql://127.0.0.1:3306/" + database;
		String user = "root";// String user = "root";
		String password = "123456";// String password = "123456";
		*/
		//String url = "jdbc:mysql://webappdb.cwn64nqrbhdx.ap-northeast-1.rds.amazonaws.com:3306/" + database + "?useUnicode=true&characterEncoding=utf-8";
		String host = "mysql"; // for OpenShift Online internal
		//String host = "mysql-exchange-kyoto-doshisha.7e14.starter-us-west-2.openshiftapps.com"; // for OpenShift Online external
		int port = 3306;
		String url = "jdbc:mysql://" + host + ":" + port + "/" + database + "?useUnicode=true&characterEncoding=utf-8";
		String user = "pokemonking";// String user = "root";
		String password = "pokemonsuki";// String password = "123456";
		

		try {
			// 讀取mysqlDriver驅動程式
			Class.forName(driver); //.newInstance();
			try {
				Connection conn = DriverManager.getConnection(url, user, password);
				
				return conn;
			} catch (Exception e) {
				System.out.println("can't content mysql database");
				System.out.println(e.toString());
				
				return null;
			}

		} catch (Exception e) {
			System.out.println("can't load mysql driver");
			System.out.println(e.toString());
			
			return null;
		}
	}
	
	// why must use "SQLException" ???
	public void cleanConnectionObj(ResultSet rs, Statement stmt, Connection conn){
		if (rs != null) {
	        try {
	            rs.close();
	        } catch (SQLException e) { /* ignored */}
	    }
	    if (stmt != null) {
	        try {
	            stmt.close();
	        } catch (SQLException e) { /* ignored */}
	    }
	    if (conn != null) {
	        try {
	            conn.close();
	        } catch (SQLException e) { /* ignored */}
	    }
	}
}
