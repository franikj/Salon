<%@ page import="java.sql.*" %>

<%
//====================================================================
//
// File name: sort.jsp
// Category:  JSP script
//
//====================================================================


// Get the sort order.
String order_by = request.getParameter("order");
String desc     = request.getParameter("desc");

// Specify which field to sort on if the user clicks on one
// of the column headings.
String id_link_order = "order=ID";
String name_link_order = "order=name";


// If the same column heading is clicked two or more times in a row, alternate
// the sort order between ascending and descending.
if ((desc == null) && (order_by != null)) {
    if (order_by.equals("ID")) {
        id_link_order = id_link_order + "&desc=true";
    }
    else if (order_by.equals("name")) {
        name_link_order = name_link_order + "&desc=true";
    }
}
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
  <title>JSP, MySQL, Sort Data</title>
</head>
<body>
<a href="index.html">up</a>
<br>
<br>
<br>
<blockquote>
<table border="2" cellspacing="2" cellpadding="4">
  <tr>
    <td><a href="NewFile.jsp?<%= id_link_order %>">ID</a></td>
    <td><a href="NewFile.jsp?<%= id_link_order %>">Cat</a></td>
  </tr>


<%
// Connect to the MySQL database.
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:sqlserver://VENERA;instanceName=MOON;databaseName=Salon;integratedSecurity=true");

// Prepare the SQL statement.
String query = "select * from Sales.ProductCategory";

// Specify the field to sort on.
if (order_by != null) {
    if (order_by.equals("id")) {
        query = query + " order by ProductCategoryID";
    }
    else if (order_by.equals("name")) {
        query = query + " order by Name DESC";
    }
       }

Statement stmt = null;
ResultSet rs = null;
stmt = conn.createStatement();

// Execute the SQL statement.
if (stmt.execute(query)) {
    rs = stmt.getResultSet();

    // For each row in the search result. 
    while (rs.next()) {
        // Get the field values for the current row.
        String first_name  = rs.getString("ProductCategoryID");
        if (first_name.equals("")) {
            first_name = "&nbsp;";
        }
        String middle_name = rs.getString("Name");
        if (middle_name.equals("")) {
            middle_name = "&nbsp;";
        }

        out.println(
            "  <tr>\n" +
            "    <td>" + first_name  + "</td>\n" +
            "    <td>" + middle_name + "</td>\n" +
            "  </tr>\n");
    }
}
rs.close();
rs = null;

stmt.close();
stmt = null;
%>


</blockquote>
</body>
</html>