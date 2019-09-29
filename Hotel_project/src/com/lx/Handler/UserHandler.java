package com.lx.Handler;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
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

import com.lx.Beans.UserBean;
import com.lx.Dao.UserDao;

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

		} else if (action.equals("allUsers")) {
			response.sendRedirect("index.jsp");
			request.setAttribute("users", dao.getAllUsers());
		} else if (action.equals("uploadimg")) {

			Part part = request.getPart("img");
			String name = request.getParameter("name");
			int result = 0;
			if (part != null) {
				try {
					Class.forName("com.mysql.jdbc.Driver");
					Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/img", "root", "");
					PreparedStatement ps = conn.prepareStatement("INSERT INTO imgtable(img,name) VALUES (?,?)");
					InputStream is = part.getInputStream();

					ps.setBlob(1, is);
					ps.setString(2, name);

					result = ps.executeUpdate();
					if (result > 0) {
						out.println("<h1>uploaded</h1>");
						response.sendRedirect("index.jsp");
					}

				} catch (SQLException e) {
					e.printStackTrace();
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				} catch (NullPointerException e) {
					// TODO: handle exception
					e.printStackTrace();
				} catch (Exception e) {
					e.printStackTrace();
				}

			}
		}
	}

}
