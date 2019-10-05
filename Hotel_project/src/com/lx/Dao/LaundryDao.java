package com.lx.Dao;

import java.awt.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lx.Beans.LaundryBeans;
import com.lx.Beans.TransManageBeans;
import com.lx.Beans.paymentBean;
import com.lx.DbConnection.ConnectionProvider;

public class LaundryDao {
	private Connection conn;
	
	public LaundryDao() {
		conn = ConnectionProvider.getConeection();
	}
	
	public void NewLoundryReq(LaundryBeans laundryBeans) {
		try {
			String sql = "INSERT INTO laundryreq (uid,uname,nic,item,date,quantity,bag,beaded_skirt,unitprice,total,status) VALUES(?,?,?,?,?,?,?,?,?,?,?)";
			
			PreparedStatement ls = conn.prepareStatement(sql);
			
			ls.setInt(1,laundryBeans.getUid());
			ls.setString(2,laundryBeans.getUname());
			ls.setString(3,laundryBeans.getNic());
			ls.setString(4,laundryBeans.getItem());
			ls.setString(5,laundryBeans.getDate());
			ls.setInt(6,laundryBeans.getQuantity());
			ls.setInt(7, laundryBeans.getBag());
			ls.setInt(8, laundryBeans.getBeaded_skirt());
			ls.setDouble(9,laundryBeans.getUnitPrice());
			ls.setDouble(10,laundryBeans.getTotal());
			ls.setInt(11, laundryBeans.getStatus());
			
			ls.executeUpdate();
			
//			String sql2="SELECT MAX(lid) FROM laundryreq";
//			
//			PreparedStatement ps=conn.prepareStatement(sql2);
//			ResultSet rs=ps.executeQuery();
//			while(rs.next()) {
//			laundryBeans.setLid(rs.getInt(1));
//			System.out.println(rs.getInt(1));
//			}
//			
//			String sql3="INSERT INTO laundryreqitem(lid,bag,beaded_skirt)VALUES(?,?,?)";
//			
//			PreparedStatement ps2=conn.prepareStatement(sql3);
//			
//			ps2.setInt(1, laundryBeans.getLid());
//			ps2.setInt(2, laundryBeans.getBag());
//			ps2.setInt(3, laundryBeans.getBeaded_skirt());
//			
//			ps2.executeUpdate();
//			System.out.println("data inserted -table 2");
			}catch(SQLException e) {
				e.printStackTrace();
			}
	}
	public List getUserLaundryReq(int uid) {
			List laundry = new ArrayList();
			

			try {
			String sql = "SELECT * FROM laundryreq WHERE uid=?";
			
			PreparedStatement ls = conn.prepareStatement(sql);
			ls.setInt(1, uid);
			ResultSet re = ls.executeQuery();
			
			while (re.next()) {
				LaundryBeans lb = new LaundryBeans();
				lb.setLid(re.getInt("lid"));
				lb.setUid(re.getInt("uid"));
				lb.setUname(re.getString("uname"));
				lb.setItem(re.getString("item"));
				lb.setDate(re.getString("date"));
				lb.setTotal(re.getDouble("total"));
				lb.setBag(re.getInt("bag"));
				lb.setBeaded_skirt(re.getInt("beaded_skirt"));
				lb.setStatus(re.getInt("status"));
				
				laundry.add(lb);
			}
//			LaundryBeans lb = new LaundryBeans();
//			int lid=lb.getLid();
//			
//			String sql2 = "SELECT * FROM laundryreq WHERE uid='"+lid+"'";
//			
//			PreparedStatement ls2 = conn.prepareStatement(sql2);
//			ResultSet re2 = ls2.executeQuery();
//			
//			while (re2.next()) {
//				LaundryBeans lb3 = new LaundryBeans();
//				
//				
//				lb.setBag(re2.getInt("bag"));
//				lb.setBeaded_skirt(re2.getInt("beaded_skirt"));
//				
//				laundry.add(lb3);
//			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return laundry;
	}
	public void delLaundryData(LaundryBeans laundry) {
		try {
			String sql = "DELETE FROM laundryreq WHERE lid=?";
			
			PreparedStatement lb = conn.prepareStatement(sql);
			lb.setInt(1,laundry.getLid());
			
			lb.execute();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void editLaundryReq(LaundryBeans lb) 
	 {
		 try 
		 {
			 String sql = "UPDATE laundryreq SET bag=?,beaded_skirt=? WHERE lid=?";
	    	 PreparedStatement ps = conn.prepareStatement(sql);
//	    	 	
	    	 	
	    	 	ps.setInt(1, lb.getBag());
	    	 	ps.setInt(2, lb.getBeaded_skirt());
	    	 	ps.setInt(3, lb.getLid());
	    	 	
	    	 	ps.executeUpdate();
	    		
		 } 
		 catch (SQLException e) 
		 {
			 e.printStackTrace();
		 }
		 
	 }
	
	
	//admin pg
	public List getAllLaundryReq() 
	 {
		 List payments = new ArrayList();
		 
		 try
		 {
			 	String sql = "SELECT * FROM laundryreq";
	    		PreparedStatement ps = conn.prepareStatement(sql);
	    		ResultSet rs = ps.executeQuery();
	    		
	    		
	    		while (rs.next()) {
	    			LaundryBeans pb = new LaundryBeans();
	    			
	    			pb.setLid(rs.getInt("lid"));
	    			pb.setUid(rs.getInt("uid"));
	    			pb.setUname(rs.getString("uname"));
	    			pb.setDate(rs.getString("date"));
	    			pb.setItem(rs.getString("item"));
	    			pb.setTotal(rs.getInt("total"));
	    			pb.setStatus(rs.getInt("status"));
	    			
	    			payments.add(pb);
	    			
	    			
	    		}
		 } 
		 catch (SQLException e) 
		 {
			 e.printStackTrace();
		 }
		 
		 return payments;
		 
	 }
	
	public void confirmReq(LaundryBeans laundry) {
		try {
			String sql = "UPDATE laundryreq SET status=? WHERE lid=?";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1, laundry.getStatus());
			ps.setInt(2, laundry.getLid());
			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}
