package com.lx.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.lx.Beans.paymentBean;
import com.lx.DbConnection.ConnectionProvider;



public class paymentDao
{
	
	private Connection conn;
	
	 public paymentDao()
	    {
	    	conn = ConnectionProvider.getConeection();
	    }
	 
	 public void addpayment(paymentBean pb) 
	 {
		 try
		 {
			    String sql = "INSERT INTO payment (billid,date,paymentMethod,category,price) VALUES (?,?,?,?,?)";
	    		PreparedStatement ps = conn.prepareStatement(sql);
	    		
	    		ps.setString(1, pb.getBillid());
	    		ps.setString(2, pb.getDate());
	    		ps.setString(3, pb.getPaymentMethod());
	    		ps.setString(4, pb.getCategory());
	    		ps.setDouble(5, pb.getPrice());
	    		
	    		
	    		ps.executeUpdate();
		 } 
		 
		 catch  (SQLException e) 
		 
		 {
			e.printStackTrace();
		}
	 }
	 
	 
	 
	 public void removerPayment(int paymentId) 
	 {
		 try 
		{
			 String sql = "DELETE FROM payment WHERE pid=? ";
			 PreparedStatement ps = conn.prepareStatement(sql);
			 ps.setInt(1, paymentId);
			 ps.executeUpdate();
			
		} 
		 
		 catch (SQLException e)
		 
		{
			 e.printStackTrace();
		}			 
		 
	 }
//	 
	 public void editPayment(paymentBean pb) 
	 {
		 try 
		 {
			 String sql = "UPDATE payment SET paymentMethod=?,category=? WHERE pid=?";
	    	 PreparedStatement ps = conn.prepareStatement(sql);
//	    	 	ps.setString(1, pb.getDate());
	    	 	ps.setString(1, pb.getPaymentMethod());
	    		ps.setString(2, pb.getCategory());
	    		//ps.setDouble(4, pb.getPrice());
	    		ps.setInt(3, pb.getPid());
	    		ps.executeUpdate(); 
	    		
		 } 
		 catch (SQLException e) 
		 {
			 e.printStackTrace();
		 }
		 
	 }
//	 
//	 
	 public List getAllpayment() 
	 {
		 List payments = new ArrayList();
		 
		 try
		 {
			 	String sql = "SELECT * FROM payment";
	    		PreparedStatement ps = conn.prepareStatement(sql);
	    		ResultSet rs = ps.executeQuery();
	    		
	    		
	    		while (rs.next()) {
	    			paymentBean pb = new paymentBean();
	    			
	    			pb.setPid(rs.getInt("pid"));
	    			pb.setBillid(rs.getString("billid"));
	    			pb.setDate(rs.getString("date"));
	    			pb.setPaymentMethod(rs.getString("paymentMethod"));
	    			pb.setCategory(rs.getString("category"));
	    			pb.setPrice(rs.getDouble("price"));
	    			
	    			payments.add(pb);
	    			
	    			
	    		}
		 } 
		 catch (SQLException e) 
		 {
			 e.printStackTrace();
		 }
		 
		 return payments;
		 
	 }
//	 
//	 
//	 public paymentBean getpaymentbyid(int paymentId) 
//	 {
//		 paymentBean pb = new paymentBean();
//		 
//		 try 
//		 {
//			 String sql = "SELECT * FROM payment WHERE billid=?";
//	           PreparedStatement ps = conn.prepareStatement(sql);
//	           ps.setInt(1, paymentId);
//	           
//	           ResultSet rs = ps.executeQuery();
//		 } 
//		 
//		 catch (SQLException e)
//		 {
//			 e.printStackTrace();
//		 }
//		 
//		 return pb;
//	 }
	
}
