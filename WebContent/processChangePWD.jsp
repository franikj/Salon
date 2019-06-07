<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" type="text/css" href="style.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="//cdn.jsdelivr.net/gh/dmhendricks/bootstrap-grid-css@4.1.3/dist/css/bootstrap-grid.min.css" />
</head>
<body>
<!-- <form action="ChangePassword.jsp" method="post"> --> 

<center><h1>Зміна Паролю</h1></center>
<%
String OldPassword = request.getParameter("OldPassword");
String Newpass = request.getParameter("newpassword");
String conpass = request.getParameter("conpassword");


Connection con = null;
Statement st = null;
String pass = "";
int id = 0;
try {
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
con = DriverManager.getConnection("jdbc:sqlserver://VENERA;instanceName=MOON;databaseName=Salon;integratedSecurity=true;");
st = con.createStatement();
ResultSet rs = st.executeQuery("select * from ADM.Administration where Password= '"+ OldPassword + "'");
if (rs.next()) { 
pass = rs.getString("Password");
} 
if(Newpass.equals(conpass))
{
			if (pass.equals(OldPassword)) {
st = con.createStatement();
int i =st.executeUpdate("update ADM.Administration set Password='"+ Newpass + "' where Password IN ('"+pass+"')");
	out.println("<script type=\"text/javascript\">");  
	out.println("alert('Successful');");  
	out.println("</script>");
response.sendRedirect("./");

st.close();
con.close();
			} else {
	 	System.out.println("stuck somewhere");
	    out.println("<script type=\"text/javascript\">");  
		out.println("alert('Old Password doesn't match');");  
		out.println("</script>");		
		
		out.println("<script type=\"text/javascript\">");  
		out.println("window.history.go(-1);");  
		out.println("</script>");	

						}
}else{

out.println("<script type=\"text/javascript\">");  
		out.println("alert('new password and confirm new password is not matching');");  
		out.println("</script>");	

		
		out.println("<script type=\"text/javascript\">");  
		out.println("window.history.go(-1);");  
		out.println("</script>");	
}

} catch (Exception e) {
out.println(e);
						}
%>
<center><a href="./" class="btn btn-info"><h2>Go back</h2></a></center>
</body>
</html>



