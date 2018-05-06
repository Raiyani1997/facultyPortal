import java.sql.*;
import java.util.*;

public class Snippet {
	public static Connection getConnection() {
		try {
			//Class.forName("com.mysql.jdbc.Driver");
			//Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/facmanagement", "root", "Rahul1234"); 
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:fms/fms1234@localhost:1521");
			return con;
		}
		catch(Exception e) {
			return null;
		}
	}
	
}