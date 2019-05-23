<%@ page import="com.mysql.*" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Deactivate</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<form action="Deactivatecontroller" method="post"></form>
<div class="menu">
<a href="contact.jsp">Contact</a>
<a href="aboutus.jsp">About us</a>
<a href="index.jsp">Home</a>
<a href="index.jsp">Log out</a>
</div><br><br>
<center><h1>Security programs and data <span style="color: #e6b800"> Lab #1</span></h1></center>
<center><h2> You login as admin </h2></center>
<center><h2>Enter username </h2></center>
<center><input name="username" type="text" id="isactive"></center>
<center><input id="in"  type="submit" name="submit" value="Deactivate"></input></center> 
</body>
</html>