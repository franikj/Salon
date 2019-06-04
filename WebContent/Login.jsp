<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%!
    Connection con;
    PreparedStatement ps1, ps2;
    public void jspInit()
    {
        try 
        {
            //loading the driver
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            //establish the connection
            con = DriverManager.getConnection("jdbc:sqlserver://VENERA;instanceName=MOON;databaseName=Salon;integratedSecurity=true");
            //create statement object
            ps1 = con.prepareStatement("select count(*) from ADM where Username = ? and Password=?");
            ps2 = con.prepareStatement("select * from ADM");
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
%>
<%
    String param = request.getParameter("s1");
    if(param =="link")
    {
        ResultSet rs = ps2.executeQuery();
        out.println("<table>");
        while(rs.next())
        {
            out.println("<tr>");
            out.println("<td>"+rs.getString(1)+"</td>");
            out.println("<td>"+rs.getString(2)+"</td");
            out.println("</tr>");
        }
        out.println("</table>");
        rs.close();
    }
    else
    {
        //write jdbc code for authentication
        String user = request.getParameter("Username");
        String pass = request.getParameter("Password");
        //set form data as param value
        ps1.setString(1,user);
        ps1.setString(2,pass);
        //excute the query
        ResultSet rs = ps1.executeQuery();
        int cnt = 0;
        if (rs.next())
            cnt = rs.getInt(1);
        if(cnt == 0)
            out.println("<b><i><font color=red>Invalid credential</fonr></i></b>");
        else
        {
            out.println("<form><fieldset style= width:25%; >");
            out.println("<b><i><font color=red>valid credential..</fonr></i></b><br>");
            out.println("<b><i><font size=6 color=blue>Welcome to My Page</fonr></i></b>");
            out.println("</fieldset></form>");
        }
    }
%>
<%! 
    public void jspDestroy()
    {
        try 
        {
            //colse 
            ps1.close();
            ps2.close();
            con.close();
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
%>

</body>
</html>