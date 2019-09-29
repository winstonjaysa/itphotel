package com.lx.Handler;

import java.io.IOException;

import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.lx.DbConnection.ConnectionProvider;

/**
 * Servlet implementation class uploadImage
 */

@WebServlet(name = "uploadImage", urlPatterns = {"/uploadImage"})
@MultipartConfig(maxFileSize = 16177216)//1.5mb
public class uploadImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	 PrintWriter out;
//	 private MyConnectionProvider datasource;
	 
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		 response.setContentType("text/html;charset=UTF-8");
	        out = response.getWriter();
	        int result = 0;
	        Connection myConn = null;
			ResultSet myRs = null;
			PreparedStatement myStmt = null;
	        Part part = request.getPart("image");
	        if (part != null) {
	            try {
	            	myConn=ConnectionProvider.getConeection();
	            	String sql = "insert into data"
	            			+"(image,empid)"
	            					+"values (?,?)";
	   		
	   		myStmt = myConn.prepareStatement(sql); 
	   		
	            	int empid1 = Integer.parseInt(request.getParameter("empid"));
	                InputStream is = part.getInputStream();
	                myStmt.setBlob(1, is);
	                myStmt.setInt(2,empid1);
	               
	                myStmt.execute();
	                if (result > 0) {
	                    response.sendRedirect("view.jsp");
	                } else {
	                    response.sendRedirect("admin-employee.jsp#tab_1");
	                }
	            } catch (Exception e) {
	                out.println(e);
	            }
	        }
	    }
		
		
		
		
	}

