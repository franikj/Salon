package com.industry.controller;

import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;


public class Report {

	public static void perday() {
		
		List data = new ArrayList();

		try {
			Connection con = null;
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			con = DriverManager.getConnection(
					"jdbc:sqlserver://VENERA;instanceName=MOON;databaseName=Salon;integratedSecurity=true");
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("Select * from Sales.Purchases");

			while (rs.next()) {
				String id = rs.getString("PurchasesiD");
				String name = rs.getString("ProductID");
				String address = rs.getString("Number");
				String contactNo = rs.getString("Price");
				data.add(id + " " + name + " " + address + " " + contactNo);

			}
			
			
			writeToFile(data, "J:/data.txt");
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	private static void writeToFile(java.util.List<String> list, String path) {
		BufferedWriter out = null;
		try {
			
			File file = new File(path);
			out = new BufferedWriter(new FileWriter(file, true));
			for (String s : list) {
				out.write(s);
				out.newLine();

			}
			out.close();
		} catch (IOException e) {
		}
	}		
	
	public static void perweek() {}
	
	public static void permonth() {}
}
