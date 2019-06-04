package com.industry.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;




//@WebServlet("/Indexcontroller")
public class Indexcontroller extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String Username= request.getParameter("Username");
		String Password = request.getParameter("Password");

		if(LoginDao.validate(Username,Password))
		{			
			
			RequestDispatcher rd= request.getRequestDispatcher("StartPage.jsp");
				rd.forward(request, response);		
		}
		else
		{	

			out.println("<script type=\"text/javascript\">");  
			out.println("alert('Sorry, Password or Username Error');");  
			out.println("</script>");
			
			RequestDispatcher rd = request.getRequestDispatcher("unsuccessful.jsp");
			rd.include(request, response);
		}
		
		out.close();
	
	}
	

}







