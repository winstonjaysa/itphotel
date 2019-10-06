package com.lx.DbConnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionProvider {
	private static Connection con = null;

	public static Connection getConeection() {
		if (con != null)
			return con;
		else {
			try {
				String driver = "com.mysql.jdbc.Driver";
				String url = "jdbc:mysql://localhost:3306/hoteldb";
				String user = "root";
				String password = "";
				Class.forName(driver);

				con = DriverManager.getConnection(url, user, password);
			} catch (ClassNotFoundException e) {
				System.out.println(e);
			} catch (SQLException e) {
				System.out.println(e);
			}
			return con;
		}
	}
}
