<%@ page import="java.sql.*" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page language="java" contentType="text/html"%>
<%@ page import="java.util.Scanner" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="../style.css" rel="stylesheet" type="text/css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Yanone+Kaffeesatz&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="//cdn.jsdelivr.net/gh/dmhendricks/bootstrap-grid-css@4.1.3/dist/css/bootstrap-grid.min.css" />
<title>Add</title>
<body>

<form action="" method="get">
	<div class="container">
	<h2> Find by bar-code (Enter code and click OK, then click FIND)</h2>
	<div class="form-group" style="wigth: 80%;">
		<label>Bar-code</label>
		<input type="number" class="form-control" required name="ProductID" />
	</div>
	
	<button type="submit" class="btn btn-primary"> OK</button>
	<a href='../Edit/EProducts.jsp?u=<%=request.getParameter("ProductID")%>' class="btn btn-warning">FIND</a>
	</div>
</form>

<%

Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
Connection con = null;
con = DriverManager.getConnection("jdbc:sqlserver://VENERA;instanceName=MOON;databaseName=Salon;integratedSecurity=true");
Statement stt = con.createStatement();
ResultSet rss = null;
rss = stt.executeQuery("select * From Sales.ProductCategory") ;

%>
<form action="" method="post">
	<div class="container">
	<h2> Add new</h2>
	<div class="form-group" style="wigth: 80%;">
		<label>Bar-code</label>
		<input type="number" class="form-control" required name="ProductID" />
	</div>
	
		<div class="form-group" style="wigth: 80%;">
		<label>Product name</label>
		<input type="text" class="form-control" required name="Name" />
	</div>
	<div class="custom-select">
		<label>Product category</label>
		<select name="item" class="custom-select" required>
			<option>---</option>
        <%  while(rss.next()){ %>
            <option><%= rss.getString(2)%></option>
        <% } %>
        </select>
	</div>
	<div class="form-group" style="wigth: 80%;">
		<label>Number</label>
		<input type="number" class="form-control" required name="Amount"/>
	</div>
	<div class="form-group" style="wigth: 80%;">
		<label>Purchase price</label>
		<input type="number" class="form-control" required name="PurchasePrice" />
	</div>
	<div class="form-group" style="wigth: 80%;">
		<label>Selling price</label>
		<input type="number" class="form-control" required name="SellingPrice"/>
	</div> 
	<div class="form-group" style="wigth: 80%;">
		<label>Description</label>
		<textarea type="text" class="form-control" name="Description"/></textarea>
	</div>
	<button type="submit" class="btn btn-primary"> Ok</button>
	<a href="../products" class="btn btn-default">Back</a>
	</div>
</form>
</body>
<script>
var x, i, j, selElmnt, a, b, c;
/*look for any elements with the class "custom-select":*/
x = document.getElementsByClassName("custom-select");
for (i = 0; i < x.length; i++) {
  selElmnt = x[i].getElementsByTagName("select")[0];
  /*for each element, create a new DIV that will act as the selected item:*/
  a = document.createElement("DIV");
  a.setAttribute("class", "select-selected");
  a.innerHTML = selElmnt.options[selElmnt.selectedIndex].innerHTML;
  x[i].appendChild(a);
  /*for each element, create a new DIV that will contain the option list:*/
  b = document.createElement("DIV");
  b.setAttribute("class", "select-items select-hide");
  for (j = 1; j < selElmnt.length; j++) {
    /*for each option in the original select element,
    create a new DIV that will act as an option item:*/
    c = document.createElement("DIV");
    c.innerHTML = selElmnt.options[j].innerHTML;
    c.addEventListener("click", function(e) {
        /*when an item is clicked, update the original select box,
        and the selected item:*/
        var y, i, k, s, h;
        s = this.parentNode.parentNode.getElementsByTagName("select")[0];
        h = this.parentNode.previousSibling;
        for (i = 0; i < s.length; i++) {
          if (s.options[i].innerHTML == this.innerHTML) {
            s.selectedIndex = i;
            h.innerHTML = this.innerHTML;
            y = this.parentNode.getElementsByClassName("same-as-selected");
            for (k = 0; k < y.length; k++) {
              y[k].removeAttribute("class");
            }
            this.setAttribute("class", "same-as-selected");
            break;
          }
        }
        h.click();
    });
    b.appendChild(c);
  }
  x[i].appendChild(b);
  a.addEventListener("click", function(e) {
      /*when the select box is clicked, close any other select boxes,
      and open/close the current select box:*/
      e.stopPropagation();
      closeAllSelect(this);
      this.nextSibling.classList.toggle("select-hide");
      this.classList.toggle("select-arrow-active");
    });
}
function closeAllSelect(elmnt) {
  /*a function that will close all select boxes in the document,
  except the current select box:*/
  var x, y, i, arrNo = [];
  x = document.getElementsByClassName("select-items");
  y = document.getElementsByClassName("select-selected");
  for (i = 0; i < y.length; i++) {
    if (elmnt == y[i]) {
      arrNo.push(i)
    } else {
      y[i].classList.remove("select-arrow-active");
    }
  }
  for (i = 0; i < x.length; i++) {
    if (arrNo.indexOf(i)) {
      x[i].classList.add("select-hide");
    }
  }
}
/*if the user clicks anywhere outside the select box,
then close all select boxes:*/
document.addEventListener("click", closeAllSelect);

</script>
</html>
<%

String a = request.getParameter("ProductID");
String b = request.getParameter("Name");
String c = request.getParameter("item");
String d = request.getParameter("Amount");
String e = request.getParameter("PurchasePrice");
String f = request.getParameter("SellingPrice");
String g = request.getParameter("Description");

Connection conn = null;
Statement st = null;
PreparedStatement stmt = null;
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
if (a!=null && b!=null && c!=null && d!=null && e!=null && f!=null && g!=null)
{
	try{
conn = DriverManager.getConnection("jdbc:sqlserver://VENERA;instanceName=MOON;databaseName=Salon;integratedSecurity=true");
String data = "EXEC Sales.INS_Products @ID=?, @Name=?, @Category=?, @Amount=?, @Price1=?, @Price2=?, @Description=?";
stmt = conn.prepareStatement(data);
stmt.setString(1, a);
stmt.setString(2, b);
stmt.setString(3, c);
stmt.setString(4, d);
stmt.setString(5, e);
stmt.setString(6, f);
stmt.setString(7, g);
response.setCharacterEncoding("UTF-8");
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");
int i = stmt.executeUpdate();
if (i > 0) {
    System.out.println("success");
       response.sendRedirect("../products");
    
} else {
    System.out.println("stuck somewhere");
    out.println("<script type=\"text/javascript\">");  
	out.println("alert('Error, check product ID and Name');");  
	out.println("</script>");	
	
	out.println("<script type=\"text/javascript\">");  
	out.println("window.history.go(-1);");  
	out.println("</script>");
		 
	
} } catch (Exception ee)

		{
	 System.out.println("stuck somewhere");
	    out.println("<script type=\"text/javascript\">");  
		out.println("alert('Error, check product ID and Name');");  
		out.println("</script>");	
		
		out.println("<script type=\"text/javascript\">");  
		out.println("window.history.go(-1);");  
		out.println("</script>");}
}
%>


