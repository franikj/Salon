package com.industry.controller;

import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;


public class Report {

	public static void perday() {

		try {
			
		//	ResultSet rs = st.executeQuery("Select * from Sales.Purchases");

			try {
			      Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			}catch (ClassNotFoundException e) {
			System.out.println("Where is your MySQL JDBC Driver?");
			e.printStackTrace();
			return;
			}
			System.out.println("MySQL JDBC Driver Registered!");
			Connection con = null;

			try {
			            con = DriverManager.getConnection(
								"jdbc:sqlserver://VENERA;instanceName=MOON;databaseName=Salon;integratedSecurity=true");
			            Statement stmt = con.createStatement();
			            ResultSet rs;
			            Connection conn;
			            rs = stmt.executeQuery("Select PurchaseID, ProductID, Price from Sales.Purchases");
			            
				            System.out.print("<!DOCTYPE html>"
			  + "<html>"
			  + "<body>"
			+ "<h1>Report 1</h1> <table border = '2' width = '70%'>");
			 System.out.print("<tr> <td><b>Publish House</b></td>  <td><b>Book name</b></td> <td><b>ISBN</b></td> </tr> ");
				            while ( rs.next() ) {
			String publishing = rs.getString("PurchaseID");
			String bookName = rs.getString("ProductID");
			String ISBN = rs.getString("Price");
		//	conn.Insert(publishing, bookName, ISBN);
			System.out.println(" <tr><td>" + publishing + "</td> <td>" + bookName + "</td> <td>"  + ISBN + "</td></tr>");
			                           };
			}catch (SQLException e) {
			System.out.println("Connection Failed! Check output console");
			e.printStackTrace();
			return;
			}

			if (con != null) {
			System.out.println("You made it, take control your database now!");
			}
		}	catch (Exception ee){
			
		}
	}		
	
	public static void perweek() {}
	
	public static void permonth() {}
}
