package context;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBContent {
	private final String url = "jdbc:mysql://localhost:3306/shoesdatabase";
	private final String userName = "root";
	private final String password = "12345";
	
	public Connection getConnection() throws Exception{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(url, userName, password);
            System.out.println("getConnection: " + connection);
            return connection;
		
	}
	
}
