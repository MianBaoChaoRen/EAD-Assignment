package model;

import java.sql.Connection;
import java.sql.DriverManager;

public class connDB {
	public static Connection getConnectionDB() throws Exception{
		// Step1: Load JDBC Driver
		Class.forName("com.mysql.jdbc.Driver");
		// Step 2: Define Connection URL
		String connURL ="jdbc:mysql://localhost/assignment_spit?user=root&password=1234";
		// Step 3 : Establish connection URL
		Connection conn = DriverManager.getConnection(connURL);
		return conn;
	}
}
