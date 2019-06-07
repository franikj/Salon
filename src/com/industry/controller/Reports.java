package com.industry.controller;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Reports
 */
@WebServlet("/Reports")
public class Reports extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Reports() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String button = request.getParameter("button");

        if ("button1".equals(button)) {
            
        	
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
        	
        	
        	
        } else if ("button2".equals(button)) {
            Report.perweek();
        } else if ("button3".equals(button)) {
            Report.permonth();
        } else {
            // ???
        }

        request.getRequestDispatcher("./Reports").forward(request, response);
		
	}
	
	
	
	
	
	
}
