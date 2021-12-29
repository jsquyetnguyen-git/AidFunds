package context;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBContext {
	
	private final String serverName = "DESKTOP-OTNGK8O";
	private final String dbName = "donation";
	private final String portNumber = "1433";
	private final String instance = "SQLEXPRESS";// Leave this one empty if your sql is a single instance
	
	//Leave userID and password empty if database's not set user and password
	private final String userID = "sa";
	private final String password = "sa";
	
	
	public Connection getConnection() throws Exception {
		String url = "jdbc:sqlserver://" + serverName+ "\\" + instance  + ":" + portNumber + ";databaseName=" + dbName + ";integratedSecurity=true" ;
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		return DriverManager.getConnection(url,userID,password);
	}
	
	//Connection test
//	public static void main(String[] args) {
//		try {
//			System.out.println(new DBContext().getConnection());			
//		} catch (Exception e) {
//			System.out.println("Can not connect to database.");
//			e.printStackTrace();
//		}
//	}
}
