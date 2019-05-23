package com.industry.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class LoginDao 
{
	public static Connection con;
    public static String JDBC_URL = "jdbc:sqlserver://VENERA;instanceName=MOON;databaseName=Salon;integratedSecurity=true";
	
		public static boolean validate(String user_id, String pass_word )
		{
			boolean status = false;
			try
			{
				Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	            con = DriverManager.getConnection(JDBC_URL);
			
			String logq="select * from ADM.Administration where Username=? AND Password=?";
			PreparedStatement ps= con.prepareStatement(logq);
			ps.setString(1, user_id);
			ps.setString(2, pass_word);
			
			ResultSet rs = ps.executeQuery();
			status=rs.next();
			con.close();
			status = true;
			}
			catch(Exception e)
			{
				System.out.println(e);
			}
			return status;	
			
			
		}
		
		
		
		
	}


