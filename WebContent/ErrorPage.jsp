<%@ page import="java.sql.*" %>
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
<title>Show</title>

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

<table id="mytable" class="table" style="background-color:white;">
	<thead>
		<tr>
		<th>ID</th>
		<th onclick="sortTable(1)">Категорія</th>
		<th onclick="sortTable(2)">Назва товару</th>
		<th>Кількість</th>
		<th>Ціна закупки</th>
		<th>Ціна продажу</th>
		<th>Опис</th>
		<th>Дата</th>
		<th class="text-center"></th>
		</tr>
	</thead>
	<tbody>
	<%
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
    Connection conn = null;
    conn = DriverManager.getConnection("jdbc:sqlserver://VENERA;instanceName=MOON;databaseName=Salon;integratedSecurity=true");
    Statement stmt = null;
    stmt = conn.createStatement();
    ResultSet rs = null;
    
    String f = request.getParameter("ProductID"); 
    int no = Integer.parseInt(f);

   
    String query = "select * from ShowProducts where ProductID='"+no+"'";
   // String ss = rs.getString("ProductID");
    response.setCharacterEncoding("UTF-8");
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html;charset=UTF-8");
    rs = stmt.executeQuery(query);
	while(rs.next()){
		%>

	<tr>
	<td><%=rs.getString("ProductID") %></td>
	<td><%=rs.getString("Category") %></td>
	<td><%=rs.getString("Product") %></td>
	<td><%=rs.getString("Amount") %></td>
	<td><%=rs.getString("PurchasePrice") %></td>
	<td><%=rs.getString("SellingPrice") %></td>
	<td><%=rs.getString("Description") %></td>
	<td><%=rs.getString("ModDate") %></td>
	<td style="width: 20%"> 
	<a href='./Edit/EProducts.jsp?u=<%=rs.getString("ProductID")%>' class="btn btn-warning">Змінити</a>
	<a href='./Delete/Dproducts.jsp?d=<%=rs.getString("ProductID")%>' onclick="return confirm('Ви впевнені, що хочете видалити товар?');" class="btn btn-danger">Видалити</a>
	
	</td>
	</tr>
	
	<%
	}
	
	
	%>
	</tbody>
</table>

</div>
</body> 
</html>