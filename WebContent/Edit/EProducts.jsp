<%@ page import="java.sql.*" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page language="java" contentType="text/html"%>
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
</head> 
<body>

<%
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
Connection conn = null;
conn = DriverManager.getConnection("jdbc:sqlserver://VENERA;instanceName=MOON;databaseName=Salon;integratedSecurity=true");
Statement st = null;
PreparedStatement stmt = null;
ResultSet res = null;
%>


<form action="" method="post">
<%

st = conn.createStatement();
String u = request.getParameter("u");

try {
if (u != null) {
//int num = Integer.parseInt(u);
long num = Long.parseLong(u);
String data = "Select * from Sales.Products where ProductID='"+num+"'";
res = st.executeQuery(data);

while(res.next()){
%>
	<div class="container">
<p><br></p>
	<img src="<%= request.getContextPath() %>/images/edit.jpg" slyle="margin: 20px;">  <h3>ID : <%=res.getString("ProductID")%></h3>
	
	<div class="form-group">
	<input type="hidden" name="ProductID" value=<%=res.getString("ProductID") %>>
	</div>
	<div class="form-group" style="wigth: 80%;">
		<label>Name</label>
		<input type="text" class="form-control" name="Name" value=<%=res.getString("Name")%>>
	</div>	
		<div class="form-group" style="wigth: 80%;">
		<label>Price1</label>
		<input type="number" class="form-control" name="PurchasePrice" value=<%=res.getString("PurchasePrice")%>>
	</div>
		<div class="form-group" style="wigth: 80%;">
		<label>Price 2</label>
		<input type="number" class="form-control" name="SellingPrice" value=<%=res.getString("SellingPrice")%>>
	</div>
	
		<div class="form-group" style="wigth: 80%;">
		<label>Amount</label>
		<input type="number" class="form-control" name="Amount" value=<%=res.getString("Amount")%>>
	</div>
<%
}

}

else { 
	
}}

catch (Exception e) {
	
	out.println(e);
	
	System.out.println("null value");
    out.println("<script type=\"text/javascript\">");  
	out.println("alert('Id cannot be null');");  
	out.println("</script>");	
	 
	
}
%>
	<button type="submit" class="btn btn-warning"> Ok</button>
	<a href="/Login-Registration_Form-master/products" class="btn btn-default">Back</a>
	</div>
</form>
</body>
</html>

<%
String a = request.getParameter("ProductID");
String b = request.getParameter("Name");
String c = request.getParameter("PurchasePrice");
String d = request.getParameter("SellingPrice");
String e = request.getParameter("Amount");
if (a!=null && b!=null && c!=null && d!=null && e!=null)
{
	String query = "update Sales.Products set Name=?, PurchasePrice=?, SellingPrice=?, Amount=? where ProductID='"+a+"'";	
stmt = conn.prepareStatement(query);
stmt.setString(1, b);
stmt.setString(2, c);
stmt.setString(3, d);
stmt.setString(4, e);
response.setCharacterEncoding("UTF-8");
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");
stmt.executeUpdate();
response.sendRedirect("../products");
}

%>



