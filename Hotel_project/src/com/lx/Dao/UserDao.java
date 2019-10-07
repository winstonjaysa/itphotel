package com.lx.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.lx.Beans.TransManageBeans;
import com.lx.Beans.UserBean;
import com.lx.DbConnection.ConnectionProvider;
import com.mysql.jdbc.Blob;

public class UserDao {
	private Connection conn;

	public UserDao() {
		conn = ConnectionProvider.getConeection();
	}

	public void addUser(UserBean userbean) {
		try {
			String sql = "INSERT INTO users (uname,password,fname,lname,role) VALUES (?,?,?,?,?)";

			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, userbean.getUname());
			ps.setString(2, userbean.getPassword());
			ps.setString(3, userbean.getFname());
			ps.setString(4, userbean.getLname());
			ps.setString(5, "user");
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public List getAllUsers() {
		List users=new ArrayList(); 
		
		try {
			String sql="SELECT * FROM users";
			
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				UserBean userbean=new UserBean();
				
				userbean.setUid(rs.getInt("uid"));
				userbean.setUname(rs.getString("uname"));
				userbean.setFname(rs.getString("fname"));
				userbean.setLname(rs.getString("lname"));
				userbean.setRole(rs.getString("role"));
				users.add(userbean);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		return users;
	}
	public List getAllAdmins() {
		List users=new ArrayList(); 
		
		try {
			String sql="SELECT * FROM users WHERE role='admin'";
			
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				UserBean userbean=new UserBean();
				
				userbean.setUid(rs.getInt("uid"));
				userbean.setUname(rs.getString("uname"));
				userbean.setRole(rs.getString("role"));
				
				users.add(userbean);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		return users;
	}
	
	public List getUser(int uid) {
		List users=new ArrayList(); 
		
		try {
			String sql="SELECT * FROM users WHERE uid='"+uid+" '";
			
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				UserBean userbean=new UserBean();
				
				userbean.setUid(rs.getInt("uid"));
				userbean.setUname(rs.getString("uname"));
				userbean.setFname(rs.getString("fname"));
				userbean.setLname(rs.getString("lname"));
				userbean.setRole(rs.getString("role"));
				userbean.setAdmin_role_type(rs.getString("admin-role-type"));
				
				users.add(userbean);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		return users;
	}
	
	public void editUser(UserBean ub) {
		try {
			String sql = "UPDATE users SET fname=?,lname=?,uname=? WHERE uid=?";

			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, ub.getFname());
			ps.setString(2, ub.getLname());
			ps.setString(3, ub.getUname());
			ps.setInt(4, ub.getUid());

			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void editPassword(int uid,String npass,String opass) {
		try {
			String sql = "UPDATE users SET password=? WHERE password=? AND uid=?";

			PreparedStatement ps = conn.prepareStatement(sql);

			
			ps.setString(1, npass);
			ps.setString(2, opass);
			ps.setInt(3,uid);

			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public UserBean loginCheck(UserBean ub) {
		
		 String username = ub.getUname();    
         String password = ub.getPassword();   
	    
        
		
		try {
			
			
			String sql="SELECT * FROM users WHERE uname='"+username+"' AND password='"+password+"'";
			PreparedStatement ps=conn.prepareStatement(sql);
		
//			ps.setString(1, ub.getUname());
//			ps.setString(2, ub.getPassword());
			ResultSet rs=ps.executeQuery();
			
			boolean more=rs.next();
			
			if(!more) {
				System.out.println("wrong");
				ub.setValid(false);
			}else if(more) {
				String userName=rs.getString("uname");
				String firstName=rs.getString("fname");
				
				ub.setUid(rs.getInt("uid"));
				ub.setFname(firstName);
				ub.setUname(userName);
				ub.setRole(rs.getString("role"));
				ub.setAdmin_role_type(rs.getString("admin-role-type"));
				System.out.println(userName);
				ub.setValid(true);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return ub;
	}
	
	
//	public static UserBean login(UserBean bean) {
//		
//        //preparing some objects for connection 
//        Statement stmt = null;    
//	
//        String username = bean.getUsername();    
//        String password = bean.getPassword();   
//	    
//        String searchQuery =
//              "select * from users where username='"
//                       + username
//                       + "' AND password='"
//                       + password
//                       + "'";
//	    
//     // "System.out.println" prints in the console; Normally used to trace the process
//     System.out.println("Your user name is " + username);          
//     System.out.println("Your password is " + password);
//     System.out.println("Query: "+searchQuery);
//	    
//     try 
//     {
//        //connect to DB 
//        currentCon = ConnectionManager.getConnection();
//        stmt=currentCon.createStatement();
//        rs = stmt.executeQuery(searchQuery);	        
//        boolean more = rs.next();
//	       
//        // if user does not exist set the isValid variable to false
//        if (!more) 
//        {
//           System.out.println("Sorry, you are not a registered user! Please sign up first");
//           bean.setValid(false);
//        } 
//	        
//        //if user exists set the isValid variable to true
//        else if (more) 
//        {
//           String firstName = rs.getString("FirstName");
//           String lastName = rs.getString("LastName");
//	     	
//           System.out.println("Welcome " + firstName);
//           bean.setFirstName(firstName);
//           bean.setLastName(lastName);
//           bean.setValid(true);
//        }
//     } 
}
