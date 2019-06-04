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
</head>
<body>
<p><br></p>
<div class="container" style="width: 80%; margin-right: 40px">
<div class="col-md-6"> 
<a href="../Add.jsp" class="btn btn-primary" style="position: right">Додати категорію</a>
<a href="../products" class="btn btn-primary" style="position: right">Повернутись до товарів</a>
</div>
<p><br></p>
<p><br></p>
<table id="mytable" class="table" style="background-color:white">
	<thead>
		<tr>
		<th >Ідентифікатор</th>
		<th onclick="sortTable(1)"> Назва категорії</th>
		<th class="text-center"></th>
		</tr>
	</thead>
	<tbody>
	<%

	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
    Connection conn = null;
    conn = DriverManager.getConnection("jdbc:sqlserver://VENERA;instanceName=MOON;databaseName=Salon;integratedSecurity=true");
    Statement stmt = null;
    stmt = conn.createStatement();
    
    String query = "select * from Sales.ProductCategory";
    		
    ResultSet rs = null;
    response.setCharacterEncoding("UTF-8");
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html;charset=UTF-8");
    rs = stmt.executeQuery(query);
	while(rs.next()){
		%>

	<tr>
	<td><%=rs.getString("ProductCategoryID") %></td>
	<td><%=rs.getString("Name") %></td>
	<td style="width: 20%"> 
	<a href='../Edit/edit.jsp?u=<%=rs.getString("ProductCategoryID")%>' class="btn btn-warning">Змінити</a>
	<a href='../Delete/delete.jsp?d=<%=rs.getString("ProductCategoryID")%>' onclick="return confirm('Ви впевнені, що хочете видалити?');" class="btn btn-danger">Видалити</a>
	</td>
	</tr>
	<%
	}
	
	%>
	</tbody>
</table>

<script>
function sortTable(n) {
  var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
  table = document.getElementById("mytable");
  switching = true;
  //Set the sorting direction to ascending:
  dir = "asc"; 
  /*Make a loop that will continue until
  no switching has been done:*/
  while (switching) {
    //start by saying: no switching is done:
    switching = false;
    rows = table.rows;
    /*Loop through all table rows (except the
    first, which contains table headers):*/
    for (i = 1; i < (rows.length - 1); i++) {
      //start by saying there should be no switching:
      shouldSwitch = false;
      /*Get the two elements you want to compare,
      one from current row and one from the next:*/
      x = rows[i].getElementsByTagName("TD")[n];
      y = rows[i + 1].getElementsByTagName("TD")[n];
      /*check if the two rows should switch place,
      based on the direction, asc or desc:*/
      if (dir == "asc") {
        if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
          //if so, mark as a switch and break the loop:
          shouldSwitch= true;
          break;
        }
      } else if (dir == "desc") {
        if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
          //if so, mark as a switch and break the loop:
          shouldSwitch = true;
          break;
        }
      }
    }
    if (shouldSwitch) {
      /*If a switch has been marked, make the switch
      and mark that a switch has been done:*/
      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
      switching = true;
      //Each time a switch is done, increase this count by 1:
      switchcount ++;      
    } else {
      /*If no switching has been done AND the direction is "asc",
      set the direction to "desc" and run the while loop again.*/
      if (switchcount == 0 && dir == "asc") {
        dir = "desc";
        switching = true;
      }
    }
  }
}
</script>


</div>
</body> 
</html>