<%@ page import="java.sql.*" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" type="text/css" href="style.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="//cdn.jsdelivr.net/gh/dmhendricks/bootstrap-grid-css@4.1.3/dist/css/bootstrap-grid.min.css" />
  <%@ include file="../go.jsp" %>
  <%@ include file="../Show/SR.jsp" %>
<title>Report</title>
<style>
h1
{	font-family: 'Yanone Kaffeesatz', sans-serif;
	color: 	#404040 ;
	font-size: 30px;
}

</style>
</head>

<body>
<center><h1> Генератор звітів</h1></center>
<br>
<form  action="./Reports/RProducts.jsp">
<div class="col-md-6"> 
<center><input id="in" type= "submit" name="submit" value="Товари"></input><br><br></center>
</div>
</form>
<form  action="./Reports/RServices.jsp">
<div class="col-md-6"> 
<center><input id="in" type= "submit" name="submit" value="Посуги"></input><br><br></center>
</div>
</form>
<form  action="./Reports/RSales.jsp">
<div class="col-md-6"> 
<center><input id="in" type= "submit" name="submit" value="Продаж"></input><br><br></center>
</div>
</form>
</body> 
</html>