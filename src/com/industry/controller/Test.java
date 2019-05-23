package com.industry.controller;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Test {
	
	public static Connection connObj;
    public static String JDBC_URL = "jdbc:sqlserver://VENERA;instanceName=MOON;databaseName=Salon;integratedSecurity=true";
 
    public static void getDbConnection() {
    	
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connObj = DriverManager.getConnection(JDBC_URL);
            if(connObj != null) {
               DatabaseMetaData metaObj = (DatabaseMetaData) connObj.getMetaData();
               System.out.println("Driver Name?= " + metaObj.getDriverName() + ", Driver Version?= " + metaObj.getDriverVersion() + ", Product Name?= " + metaObj.getDatabaseProductName() + ", Product Version?= " + metaObj.getDatabaseProductVersion());
             String logq="select * from ADM.Administration";
    		PreparedStatement ps=connObj.prepareStatement(logq);
    			
    			ResultSet rs = ps.executeQuery();
    			 displayRow("PRODUCTS", rs);       
     
            }
        } catch(Exception sqlException) {
            sqlException.printStackTrace();
        }
    }
    
    public static void main(String[] args) {
        getDbConnection();
    }
 
    private static void displayRow(String title,
            ResultSet rs) throws SQLException {
        System.out.println(title);
        while (rs.next()) {
            System.out.println(rs.getString("Username") + " : " + rs.getString("Password"));
        }
    }
      
}
