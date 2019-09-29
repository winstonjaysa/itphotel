package com.lx.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.lx.DbConnection.ConnectionProvider;
import com.lx.Beans.ContactUsBeans;




public class contactUsDao 
{
	
	private Connection conn;
	
	public contactUsDao() 
	{
		conn = ConnectionProvider.getConeection();
	}
	
	
	  public void addcontact(ContactUsBeans cb) 
	    {
	    	try 
	    	{
	    		String sql = "INSERT INTO contactus(uid,uname,date,email,subject,message,status) VALUES (?,?,?,?,?,?,?)";
	    		PreparedStatement ps = conn.prepareStatement(sql);
	    		
	    		
	    		ps.setInt(1, cb.getUid());
	    		ps.setString(2, cb.getUname() );
	    		ps.setString(3, cb.getDate() );
	    		ps.setString(4, cb.getEmail() );
	    		ps.setString(5, cb.getSubject() );
	    		ps.setString(6, cb.getMessage());
	    		ps.setBoolean(7, cb.isStatus());
	    		
	    		ps.executeUpdate();
	    		
			} 
	    	
	    	catch (SQLException e) 
	    	{
	    		e.printStackTrace();
			}
	    }
	  	
	  public void adminsMessages(ContactUsBeans cb) 
	    {
	    	try 
	    	{
	    		String sql = "INSERT INTO contactadminmessage(uid,to_uid,uname,inbox,status) VALUES (?,?,?,?,?)";
	    		PreparedStatement ps = conn.prepareStatement(sql);
	    		
	    		
	    		ps.setInt(1, cb.getUid());
	    		ps.setInt(2, cb.getTo_uid());
	    		ps.setString(3, cb.getUname() );
	    		ps.setString(4, cb.getInbox() );
	    		ps.setBoolean(5, cb.isStatus());
	    		
	    		ps.executeUpdate();
	    		
			} 
	    	
	    	catch (SQLException e) 
	    	{
	    		e.printStackTrace();
			}
	    }
	  
	  
	    public void removecontact(int contactId) 
	    {
	    	try
	    	{
	    		String sql = "DELETE FROM contactAdminMessage WHERE cid=?";
	   		 	PreparedStatement ps = conn.prepareStatement(sql);
	   		 	ps.setInt(1, contactId);
	   		 	ps.executeUpdate();
	   		 	
			} 
	    	
	    	catch (SQLException e)
	    	{
	    		e.printStackTrace();
			}
	    }
	    
//	    public void editcontact(ContactUsBeans cb) 
//	    {
//	    	try
//	    	{
//	    		String sql = "UPDATE contactus SET firstN = ? ,lastN = ?,email = ?,subject = ?" +" WHERE cid=?";
//	    		PreparedStatement ps = conn.prepareStatement(sql);
//	    		
//	    		ps.setString(1, cb.getFirstN() );
//	    		ps.setString(2, cb.getLastN() );
//	    		ps.setString(3, cb.getEmail() );
//	    		ps.setString(4, cb.getSubject() );
//	    		ps.setInt(5, cb.getCid());
//
//	    		ps.executeUpdate(); 
//	    		
//			}
//	    	
//	    	catch (SQLException e)
//	    	{
//	    		 e.printStackTrace();
//			}
//	    }
//	    
	    public List getAllUsersContact() 
	    {
	    	List contacts = new ArrayList();
	    	
	    	try
	    	{
	    		String sql = "SELECT * FROM contactus ORDER BY cid DESC;";
	    		PreparedStatement ps = conn.prepareStatement(sql);
	    		ResultSet rs = ps.executeQuery();
	    		
	    		while (rs.next()) {
	    			ContactUsBeans cb = new ContactUsBeans();

	    			cb.setCid(rs.getInt("cid"));
	    			cb.setUid(rs.getInt("uid"));
	    			cb.setUname(rs.getString("uname"));
	    			cb.setDate(rs.getString("date"));
	    			cb.setEmail(rs.getString("email"));
	    			cb.setSubject(rs.getString("subject"));
	    			cb.setMessage(rs.getString("message"));
	    			cb.setStatus(rs.getBoolean("status"));
    			
	    			contacts.add(cb);
	    			
	    		}
	    		
			}
	    	
	    	catch (SQLException e) 
	    	{
	    		e.printStackTrace();
			}
	    	
	    	return contacts;
	    }

	    public List getAdminsContactMeassages(int size) 
	    {
	    	List contacts = new ArrayList();
	    	String sql=null;
	    	try
	    	{	if(size>0) {
	    		sql = "SELECT * FROM contactAdminMessage WHERE uid='"+size+"' OR to_uid='"+size+"' ORDER BY cid ASC ";
	    		}else if(size==0) {
	    			sql = "SELECT * FROM contactAdminMessage ORDER BY cid DESC";
	    		}
	    		PreparedStatement ps = conn.prepareStatement(sql);
	    		ResultSet rs = ps.executeQuery();
	    		
	    		while (rs.next()) {
	    			ContactUsBeans cb = new ContactUsBeans();

	    			cb.setCid(rs.getInt("cid"));
	    			cb.setUid(rs.getInt("uid"));
	    			cb.setTo_uid(rs.getInt("to_uid"));
	    			cb.setUname(rs.getString("uname"));
	    			cb.setInbox(rs.getString("inbox"));
	    			cb.setReply(rs.getString("reply"));
	    			cb.setStatus(rs.getBoolean("status"));
    			
	    			contacts.add(cb);
	    			
	    		}
	    		
			}
	    	
	    	catch (SQLException e) 
	    	{
	    		e.printStackTrace();
			}
	    	
	    	return contacts;
	    }
	    
	    
	    
	    
//	    public ContactUsBeans getcontactById(int contactId ) 
//	    {
//	    	ContactUsBeans cb = new ContactUsBeans();
//	    	
//	    	try
//	    	{
//	    		String sql = "SELECT * FROM contactus WHERE cid=?";
//	            PreparedStatement ps = conn.prepareStatement(sql);
//	            ps.setInt(1, contactId);
//	            ResultSet rs = ps.executeQuery();
//	            
//	            if (rs.next()) {
//	            	cb.setCid(rs.getInt("cid"));
//	    			cb.setFirstN(rs.getString("firstN"));
//	    			cb.setLastN(rs.getString("lastN"));
//	    			cb.setSubject(rs.getString("subject"));
//	            	
//	            }
//			} 
//	    	
//	    	catch (SQLException e) 
//	    	{
//	    		e.printStackTrace();
//			}
//	    	
//	    	return cb;
//	    }
//	    
//	    

}
