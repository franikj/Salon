<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<!-- <form action="ChangePassword.jsp" method="post"> --> 
<div class="menu">
<a href="contact.jsp">Contact</a>
<a href="aboutus.jsp">About us</a>
<a href="index.jsp">Home</a>
<a href="index.jsp">Log out</a>
</div><br><br>
<center><h1>Пароль <span style="color: #e6b800"> V1</span></h1></center>
<%
String OldPassword = request.getParameter("OldPassword");
String Newpass = request.getParameter("newpassword");
String conpass = request.getParameter("conpassword");


Connection con = null;
Statement st = null;
String pass = "";
int id = 0;
try {
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bpd?user=root&useSSL=false");
st = con.createStatement();
ResultSet rs = st.executeQuery("select * from users where p_word= '"+ OldPassword + "'");
if (rs.next()) { 
pass = rs.getString("p_word");
} 
if(Newpass.equals(conpass))
{
if (pass.equals(OldPassword)) {
st = con.createStatement();
int i = st.executeUpdate("update users set p_word='"+ Newpass + "' where p_word IN ('"+pass+"')");
//out.println("Password changed successfully");
st.close();
con.close();
} else {
out.println("Old Password doesn't match");
}
/*}else{
out.println("new password and confirm new password is not matching");
}*/
}
} catch (Exception e) {
out.println(e);
}
%>
<center><h2>Password changed successfully</h2></center>
<a href="successful.jsp"><h2>Go back</h2></a>
</body>
</html>



