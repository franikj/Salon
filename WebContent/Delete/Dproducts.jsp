<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="java.sql.*" %>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="../style.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="//cdn.jsdelivr.net/gh/dmhendricks/bootstrap-grid-css@4.1.3/dist/css/bootstrap-grid.min.css" />
<title>Edit</title>
<style type="text/css">
#centered {
  position: fixed; /* or absolute */
  top: 200px;
  left: 600px;
}
</style>
</head>

<%


String id = request.getParameter("d");
long no = Long.parseLong(id);

Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
Connection conn = null;
conn = DriverManager.getConnection("jdbc:sqlserver://VENERA;instanceName=MOON;databaseName=Salon;integratedSecurity=true");
PreparedStatement st = null;
String data = ("delete from Sales.Products where ProductID='"+id+"'");
st = conn.prepareStatement(data);
try {
int i = st.executeUpdate();
if (i > 0) {
    System.out.println("success");
    response.sendRedirect("../products");
} else {
    System.out.println("stuck somewhere");
    out.println("<script type=\"text/javascript\">");  
	out.println("alert('Error');");  
	out.println("</script>");	
}
}
catch (Exception e) {
	%>
	<div id="centered">
		<h1> Помилка!</h1>
	
<p> Ви не можете видалити товар <a href="../products" class="btn btn-default">Назад</a></p>
	</div>
	<%
}
%>

