package com.industry.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;



//@WebServlet("/Indexcontroller")
public class Indexcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String user= request.getParameter("Username");
		String passw = request.getParameter("Password");

		if(LoginDao.validate(user,passw))
		{			
			
			RequestDispatcher rd= request.getRequestDispatcher("StartPage.jsp");
				rd.forward(request, response);		
		}
		else
		{	

			out.println("<script type=\"text/javascript\">");  
			out.println("alert('Sorry, Password or Username Error');");  
			out.println("</script>");
			
			RequestDispatcher rd = request.getRequestDispatcher("failed.jsp");
			rd.include(request, response);
		}
		
		out.close();
	
	}
	
	public void output(String jsonStr, HttpServletResponse response) throws IOException {
	    response.setContentType("text/html;charset=UTF-8;");
	    response.setCharacterEncoding("UTF-8");
	    ServletOutputStream out = response.getOutputStream();
	    out.write(jsonStr.getBytes("UTF-8"));
	    out.flush();
	    out.close();
	}

}







