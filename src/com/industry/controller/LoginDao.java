package com.industry.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class LoginDao 
{
	public static Connection con;
    public static String JDBC_URL = "jdbc:sqlserver://VENERA;instanceName=MOON;databaseName=Salon;integratedSecurity=true;sslProtocol=TLSv1.2;";
	
		public static boolean validate(String Username, String Password )
		{
			boolean status = false;
			try {
	            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	            con = DriverManager.getConnection(JDBC_URL);
	           
	    		String logq="SELECT * FROM ADM.Administration WHERE Username=? AND Password=?";
				PreparedStatement pss= con.prepareStatement(logq);
				pss.setString(1, Username);
				pss.setString(2, Password);
	    			ResultSet rs = pss.executeQuery();
	    		status=rs.next();
	    
				
	            }
			catch(Exception sqlExeption)
			{
				 sqlExeption.printStackTrace();
			}
		
	        
		    		return status;
	            }
}


