
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
<form action="index.jsp" method="post"></form>
<div class="menu">
<a href="contact.jsp">Contact</a>
<a href="aboutus.jsp">About us</a>
<a href="index.jsp">Home</a>
<a href="index.jsp">Log out</a>
</div><br><br>
<center><h1> Категорії товарів<span style="color: #e6b800"></span></h1></center>
<div class="table">
<style> 
table.cinereousTable {
  border: 6px solid #948473;
  background-color: #FFE3C6;
  width: 60%;
  text-align: center;
  margin-left: 300px;
}
table.cinereousTable td, table.cinereousTable th {
  border: 1px solid #948473;
  padding: 4px 4px;
}
table.cinereousTable tbody td {
  font-size: 20px;
}
table.cinereousTable thead {
 
  background: -moz-linear-gradient(top, #afa396 0%, #9e9081 66%, #948473 100%);
  background: -webkit-linear-gradient(top, #afa396 0%, #9e9081 66%, #948473 100%);
  background: linear-gradient(to bottom, #afa396 0%, #9e9081 66%, #948473 100%);
}
table.cinereousTable thead th {
  font-size: 25px;
  font-weight: bold;
  color: #F0F0F0;
  text-align: left;
  border-left: 2px solid #948473;
}
table.cinereousTable thead th:first-child {
  border-left: none;
}

table.cinereousTable tfoot {
  font-size: 16px;
  font-weight: bold;
  color: #F0F0F0;
  background: #948`;
  background: -moz-linear-gradient(top, #afa396 0%, #9e9081 66%, #948473 100%);
  background: -webkit-linear-gradient(top, #afa396 0%, #9e9081 66%, #948473 100%);
  background: linear-gradient(to bottom, #afa396 0%, #9e9081 66%, #948473 100%);
}
table.cinereousTable tfoot td {
  font-size: 16px;
}
</style>
 <table class="cinereousTable">
        <thead>
            <tr style="text-align:center">
                <th > Ідентифікатор</th>   
                 <th> Категорія </th>

            </tr>
        </thead>
        <tbody>
            <%
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                Connection conn = null;
                conn = DriverManager.getConnection("jdbc:sqlserver://VENERA;instanceName=MOON;databaseName=Salon;integratedSecurity=true");
                Statement stmt = null;
                stmt = conn.createStatement();
                String query = "select * from ADM.Administration";
                ResultSet rs = null;
                rs = stmt.executeQuery(query);
                while(rs.next()){
            %>
            <tr>
                <%
                   // int id = rs.getInt("id");
                    String name = rs.getString("Username");
                    String sname = rs.getString("Password");
                  //  String login = rs.getString("u_id");
                    //String email = rs.getString("e_id");
                    //String pw = rs.getString("p_word");
                   // String company = rs.getString("company");
                   // int salary = rs.getInt("salary");
                %>
                <td style="text-align:center"><%=name %></td>
                <td style="text-align:center"><%=sname %></td>
             
            </tr>               

            <%      
                }
            %>

        </tbody>
    </table>
</div>
<br></br>
<center><input id="in" type= "submit" value="Deactivate" name="Deactivate" onclick="document.forms[0].action = 'Deactivate.jsp'; return true;" ></input><br><br></center>
<center><input id="in" type= "submit" value="Change password" name="Change password" onclick="document.forms[0].action = 'ChangePassword.jsp'; return true;" ></input><br><br></center>
</body>
</html>