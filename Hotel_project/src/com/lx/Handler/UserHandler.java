package com.lx.Handler;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.lx.Beans.TransManageBeans;
import com.lx.Beans.UserBean;
import com.lx.Dao.UserDao;
import com.lx.DbConnection.ConnectionProvider;
import com.mysql.jdbc.Blob;

@WebServlet("/UserHandler")
@MultipartConfig(maxFileSize = 16177216)
public class UserHandler extends HttpServlet {
	private UserDao dao;
	PrintWriter out;

	public UserHandler() {
		super();
		dao = new UserDao();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	String action = request.getParameter("action");
		
	if(action.equals("logout")) {
			try {
				HttpSession session = request.getSession(false); //Fetch session object
				 
				if(session!=null) //If session is not null
				 {
				 session.invalidate(); //removes all session attributes bound to the session
				 request.setAttribute("errMessage", "You have logged out successfully");
				 RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
				 requestDispatcher.forward(request, response);
				 System.out.println("Logged out");
		
				 }
			}catch (Exception e) {
				e.printStackTrace();
			}
			}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		
		if (action.equals("login")) {

		String uname = request.getParameter("userName");
		String pss = request.getParameter("password");
		//String lastUrl=request.getParameter("lastUrl");
			try {
					UserBean userbean = new UserBean();
	
					userbean.setUname(uname);
					userbean.setPassword(pss);
					userbean = dao.loginCheck(userbean);
	
					if (userbean.isValid()) {
						HttpSession session = request.getSession();
						session.setAttribute("currentSessionUser", userbean);
						session.setAttribute("currentU", userbean.getFname());
						session.setAttribute("currentRole", userbean.getAdmin_role_type());
						
						session.setMaxInactiveInterval(-1);
						if(userbean.getRole().equals("admin")) {
						System.out.print("role is (admin) ");
						System.out.println(userbean.getAdmin_role_type());
						}
						response.sendRedirect("index.jsp");
					} else {
						response.sendRedirect("login.jsp?status=wrongvalid");
					}
			} catch (Throwable theException) {
				theException.printStackTrace();
				System.out.println(theException);
			}
		}
		else if (action.equals("register")) {
			UserBean nUser = new UserBean();

			nUser.setUname(request.getParameter("uname"));
			nUser.setPassword(request.getParameter("pwd"));
			nUser.setFname(request.getParameter("fname"));
			nUser.setLname(request.getParameter("lname"));
			dao.addUser(nUser);
			response.sendRedirect("index.jsp");
			System.out.println("New user add success!");

		}
		else if (action.equals("allUsers")) {
			response.sendRedirect("index.jsp");
			request.setAttribute("users", dao.getAllUsers());
		
		} 
		else if(action.equals("UpdatePropic")) {
			
			response.setContentType("text/html;charset=UTF-8");
	        out = response.getWriter();
	        int result = 0;
	        Connection myConn = null;
			ResultSet myRs = null;
			PreparedStatement myStmt = null;
	        Part part = request.getPart("propic");
	        if (part != null) {
	            try {
	            	myConn=ConnectionProvider.getConeection();
	            	String sql = "UPDATE users SET propic=? WHERE uid=?";
	   		
	            	myStmt = myConn.prepareStatement(sql); 
	   		
	            	int uid = Integer.parseInt(request.getParameter("uid"));
	                InputStream is = part.getInputStream();
	                myStmt.setBlob(1, is);
	                myStmt.setInt(2,uid);
	               
	                myStmt.execute();
	                if (result > 0) {
	                    response.sendRedirect("user-profile.jsp");
	                } else {
	                    response.sendRedirect("user-profile.jsp");
	                }
	            } catch (Exception e) {
	                out.println(e);
	            }
	        }
		}
		else if (action.equals("editUser")) {
			int uid = Integer.parseInt(request.getParameter("uid"));

			UserBean ub = new UserBean();

			ub.setUid(uid);
			ub.setUname(request.getParameter("uname"));
			ub.setFname(request.getParameter("fname"));
			ub.setLname(request.getParameter("lname"));
			
			
			dao.editUser(ub);

			System.out.println("Edit successfull the reqested user details!");
			response.sendRedirect("user-profile.jsp");
		
		}else if (action.equals("editPassword")) {
			int uid = Integer.parseInt(request.getParameter("uid"));
			String npass = request.getParameter("npass");
			String opass = request.getParameter("opass");

			
			
			dao.editPassword(uid,npass,opass);

			System.out.println("Edit successfull the reqested user details!");
			response.sendRedirect("user-profile.jsp");
		}
	}

}
