<%@ page import="java.sql.*, com.industry.controller.*" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="./style.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="//cdn.jsdelivr.net/gh/dmhendricks/bootstrap-grid-css@4.1.3/dist/css/bootstrap-grid.min.css" />
<title>Schedule</title>

<style type="text/css">

table.table th {
    background-color: #DBD8D8;
    background-image: url(../Content/SiteImages/1.png);
}

table.table th:hover {
    background-color: #73C6B6;
    background-image: none;
}

</style>
</head>
<body>
<br>
<div class="container" style="width: 80%; margin-right: 20px">
<div class="col-md-6"> 
<a href="./Add/Acustomers.jsp" class="btn btn-primary" style="margin: 25px 0px;">Add</a>
</div>
<body>
<table id="mytable" class="table" style="background-color:white;">
	<thead>
	<tr>
		
		<th onclick="sortTable(1)">Date</th>
		<th onclick="sortTable(2)">Employee</th>
		<th onclick="sortTable(3)">Customer</th>
		<th>Service</th>
		<th>Price</th>
		
		</tr>
	</thead>
	
	<%
	try {
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
    Connection con = null;
    con = DriverManager.getConnection("jdbc:sqlserver://VENERA;instanceName=MOON;databaseName=Salon;integratedSecurity=true");
    Statement stmt = null;
    stmt = con.createStatement();
    
    String query = "select * from dd";
    ResultSet rs = null;
    response.setCharacterEncoding("UTF-8");
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html;charset=UTF-8");
    rs = stmt.executeQuery(query);
  
	while(rs.next()){
		%>

	<tr>
	
	<td><%=rs.getString("Date") %></td>
	<td><%=rs.getString("hh") %></td>
	<td><%=rs.getString("jj") %></td>
	<td><%=rs.getString("Name") %></td>
	<td><%=rs.getString("Price") %></td>
	
	<td style="width: 20%"> 
	<a href="./Edit/Ecustomers.jsp?u=<%=rs.getString("CustomerID")%>"> <button type = "button" class="btn btn-warning">Edit</button></a>
	<a href="./Delete/Dcustomers.jsp?id=<%=rs.getString("CustomerID")%>" > <button type = "button" onclick="return confirm('Ви впевнені, що хочете видалити товар?');" class="btn btn-danger">Delete</button></a>
	 
	</td>
	</tr>
	</table>

<% 

}
con.close();
} catch (Exception e) {
e.printStackTrace();
}
%>


</body> 



</html>
