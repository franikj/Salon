<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>  
    
<%
String id = request.getParameter("id");
//int no = Integer.parseInt(id);

Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
Connection conn = null; 

conn = DriverManager.getConnection("jdbc:sqlserver://VENERA;instanceName=MOON;databaseName=Salon;integratedSecurity=true");
Statement st=conn.createStatement();
st.executeUpdate("delete from Business.Customers where CustomerID='"+id+"'");
out.println("Data Deleted Successfully!");
response.sendRedirect("../clients");


%>
