<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="java.sql.*" %>
<%

String id = request.getParameter("d");
int no = Integer.parseInt(id);

Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
Connection conn = null;
conn = DriverManager.getConnection("jdbc:sqlserver://VENERA;instanceName=MOON;databaseName=Salon;integratedSecurity=true");
PreparedStatement st = null;
String data = ("EXEC Sales.DEL_Sales @ID='"+id+"'");
st = conn.prepareStatement(data);
try {
int i = st.executeUpdate();
if (i > 0) {
    System.out.println("success");
    response.sendRedirect("../sales");
} else {
    System.out.println("stuck somewhere");
    out.println("<script type=\"text/javascript\">");  
	out.println("alert('Error');");  
	out.println("</script>");	
}
}
catch (Exception e) {
	%>
	<div id="centered">
		<h1> Error page!</h1>
	
<p>You cannot delete this purchase <a href="../products" class="btn btn-default">Назад</a></p>
	</div>
	<%
}
%>
