<%@ page import="com.mysql.*" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Successful_Page</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<form action="index.jsp" method="post"> 
<div class="menu">
<a href="contact.jsp">Contact</a>
<a href="aboutus.jsp">About us</a>
<a href="index.jsp">Home</a>
<a href="index.jsp">Log out</a>
</div><br><br>
<center><h1>Security programs and data <span style="color: #e6b800"> Lab #1</span></h1></center>
<center><h2>Hello, friend</h2></center>
<center><input id="in" type= "submit" value="Change password" name="Change password" onclick="document.forms[0].action = 'ChangePassword.jsp'; return true;" ></input><br><br></center>
<center><div class="cat" style="size: 5%">
    <img src="cat.jpg">
    </div>
 </center>
</form>
</body>
</html>