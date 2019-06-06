<%@ page import="java.sql.*" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page language="java" contentType="text/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="//cdn.jsdelivr.net/gh/dmhendricks/bootstrap-grid-css@4.1.3/dist/css/bootstrap-grid.min.css" />
<title>Add</title>
<body>

<p><br></p>
<form action="" method="post">
	<div class="container">
	<h2> Add new product category</h2>
	<div class="form-group" style="wigth: 80%;">
		<label>Name</label>
		<input type="text" class="form-control" name="Name" placeholder=""/>
	</div>
	<button type="submit" class="btn btn-primary"> Ok</button>
	<a href="./Show/Show.jsp" class="btn btn-default">Back</a>
	</div>
</form>
</body>
</html>
<%

//String a = request.getParameter("ProductCategoryID");
String b = request.getParameter("Name");
Connection conn = null;
Statement st = null;
PreparedStatement stmt = null;
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
if (b!=null)
{
	
try {
conn = DriverManager.getConnection("jdbc:sqlserver://VENERA;instanceName=MOON;databaseName=Salon;integratedSecurity=true");
//String data = "insert into Sales.ProductCategory (Name) values (N'"+"?')";
String data = "EXEC Sales.INS_Categories @Name =?";
stmt = conn.prepareStatement(data);

stmt.setString(1, b);

stmt.executeUpdate();
response.sendRedirect("./Show/Show.jsp");
System.out.println(b);
System.out.println(data);
}
catch (Exception e) {
	System.out.println(e.toString());
}
}


%>