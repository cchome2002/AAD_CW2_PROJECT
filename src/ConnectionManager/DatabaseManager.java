package ConnectionManager;

import java.sql.*;

public class DatabaseManager {

	 private static Connection conn = null;
     private static Statement statement = null;
     //private static PreparedStatement preparedStatement = null;
     private static ResultSet resultSet = null;
     private static String driver = "com.mysql.jdbc.Driver";
     private static String dbURL = "jdbc:mysql://127.0.0.1:3306/";

     public static void getSystemConn () throws Exception{
    
    	String connString = dbURL + "System_DB_Test_Model";
    	  
        String username = "root";
        String password = "root"; 
        
        try 
        {
        	Class.forName(driver).newInstance();
		    conn  = DriverManager.getConnection(connString, username, password);
        } 
        catch (Exception e) 
        {
            System.err.println("Got an exception! ");
            System.err.println(e.getMessage());
        }
        
     }
     
     public static void getCharityConn (String dbName) throws Exception{
     
    	String connString = dbURL + dbName;
    	 
        String username = "root";
        String password = "root";
        
        try 
        {
        	Class.forName(driver).newInstance();
		    conn  = DriverManager.getConnection(connString, username, password);
		    
        } 
        catch (Exception e) 
        {
            System.err.println("Got an exception! ");
            System.err.println(e.getMessage());
        }
        
     }
     
     public static void closeConn() throws Exception{
    	 try
    	 {
    		 conn.close();
    	 }
    	 catch (Exception e) 
         {
             System.err.println("Got an exception! ");
             System.err.println(e.getMessage());
         }
     }
     
     public static String readCharityDataV2() throws Exception {
         
    	 String result = "";
    	 
        	 getCharityConn("Charity_Db_Test_Model");
        	 statement = conn.createStatement();
        	 
        	 resultSet = statement.executeQuery
        	("SELECT Username as u,COUNT(*) as c FROM( SELECT Users.Username AS Username,Filled_Form.User_Id as UserID, count(Filled_Form.Filled_Form_Id) as TotalInputs FROM 	Filled_Form INNER JOIN Form ON Filled_Form.Form_Id = Form.Form_Id INNER JOIN Form_Fields ON Filled_Form.Field_Id = Form_Fields.Field_Id	INNER JOIN Users ON Filled_Form.User_Id = Users.User_Id WHERE	Users.isActive = 1  AND Filled_Form.isActive = 1 AND Form_Fields.isActive = 1 AND Form.isActive = 1 GROUP BY Filled_Form.`Timestamp`) AS TEMP GROUP BY UserID");	
           
        	   
        	 while(resultSet.next())
        	 {
        		result += String.format("['%s',%d],", resultSet.getString("u"), resultSet.getInt("c"));
        	 }
        	          
        	 closeConn();
             	 
    	 return result;
     }
         
}
