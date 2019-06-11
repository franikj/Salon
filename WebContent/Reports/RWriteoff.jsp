<%@ page import="java.sql.*" %>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="../style.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="//cdn.jsdelivr.net/gh/dmhendricks/bootstrap-grid-css@4.1.3/dist/css/bootstrap-grid.min.css" />
<title>Writeoff Report</title>
<style>

  .box {
            display: flex;
            justify-content: space-between;
			width: 90%;  
			margin: 50px;     
          }

.box div {
  width: 100px;
  height: 100px;
}
input,
label {
    margin: .4rem 0;
}

.note {
    font-size: .8em;
}

</style>
</head>

<body>
<p><b></b></p>

<a href="../reports" class="btn btn-info" style="float: right; margin: 20px;">Back</a>
<p><br></p>
<p><br></p>
<form action="" method="post">
 <div class="box">
<h2 for="start"> Оберіть початкову дату:</h2> 
<input type="date" id="start" name="Date1"> 
<h2 for="start"> Оберіть кінцеву дату:</h2> 
<input type="date" id="end" name="Date2"> 
<button type="submit" class="btn btn-info" style="width: 100px; height: 50px;"> Ok</button> </div> 
<p><br></p>
</form>
</body> 
</html>

<%

String s=request.getParameter("Date1");
//out.println(s);
String n =request.getParameter("Date2");
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
Connection conn = null;
conn = DriverManager.getConnection("jdbc:sqlserver://VENERA;instanceName=MOON;databaseName=Salon;integratedSecurity=true");
Statement stmt = null;
PreparedStatement ps = null;
stmt = conn.createStatement();
ResultSet rss = null;
if (n!=null && s!=null)
{
conn = DriverManager.getConnection("jdbc:sqlserver://VENERA;instanceName=MOON;databaseName=Salon;integratedSecurity=true");
String query = "EXEC WriteoffReport @datefrom=?, @dateto=?" ;
ps = conn.prepareStatement(query);
//ps.setString(1, s);
ps.setString(1, s);
ps.setString(2, n);
rss = ps.executeQuery();
   out.println("<div style='background-color: white'>");
	out.println("<center><table BORDER=1 CELLPADDING=0 CELLSPACING=0 WIDTH=70% >"
	        +"<th><center>Категорія</center></th><th><center>Товар</center></th><th><center>Сума</center></th><th><center>Кількість</center></th></tr>");

	while(rss.next()){
	out.println("<td><center>"+rss.getString("Category")+"</center></td>"
			+ "<td><center>"+rss.getString("Product")+"</center></td>"
	         + "<td><center>"+rss.getString("Sum")+"</center></td>"
	         + "<td><center>"+rss.getString("Number")+"</center></td></tr>");
	}
	out.println("</table></center>");
	out.println("</div>");


} 

%>