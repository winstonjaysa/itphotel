package com.lx.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lx.Beans.LaundryBeans;
import com.lx.Beans.ReservationBeans;
import com.lx.DbConnection.ConnectionProvider;

public class ReservationDao {
	private Connection conn;
	
	public ReservationDao() {
		conn=ConnectionProvider.getConeection();
	}
	public void newBooking(ReservationBeans res) {
		
		try {
			String sql="INSERT INTO reservation(uid,uname,reservation_type,budget_package_type,air_type,check_in,check_out,adults,children,mini_bar,swimming_pool)VALUES(?,?,?,?,?,?,?,?,?,?,?)";
			
			
			//String sql="INSERT INTO reservation(uname)VALUES(?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ps.setInt(1, res.getUid());
			ps.setString(2, res.getUname());
			ps.setInt(3, res.getReservation_type());
			ps.setInt(4, res.getBudget_package_type());
			ps.setInt(5, res.getAir_type());
			ps.setString(6, res.getCheck_in());
			ps.setString(7, res.getCheck_out());
			ps.setInt(8, res.getAdults());
			ps.setInt(9, res.getChildren());
			ps.setInt(10, res.getMini_bar());
			ps.setInt(11, res.getSwimming_pool());
			
			ps.executeUpdate();
					
		}
		
		catch (SQLException e)
		{
			e.printStackTrace();
		}
	}
	
	public List displayAllReservationreq() {
		List resev=new ArrayList();
		
		try {
			String sql=null;
			sql="SELECT * FROM reservation";
				
			
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet re=ps.executeQuery();
			
			while(re.next()) {
				ReservationBeans rb=new ReservationBeans();
				
				rb.setRid(re.getInt("rid"));
				rb.setReservation_type(re.getInt("reservation_type"));
				rb.setUid(re.getInt("uid"));
				rb.setUname(re.getString("uname"));
				rb.setAir_type(re.getInt("air_type"));
				rb.setCheck_in(re.getString("check_in"));
				rb.setBudget_package_type(re.getInt("budget_package_type"));
				rb.setCheck_out(re.getString("check_out"));
				rb.setMini_bar(re.getInt("mini_bar"));
				rb.setAdults(re.getInt("adults"));
				rb.setSwimming_pool(re.getInt("swimming_pool"));
				rb.setChildren(re.getInt("children"));
				
				resev.add(rb);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return resev;
	}
	
	
	public List displayUserReservationreq(int size,int uid) {
		List resev=new ArrayList();
		
		try {
			String sql=null;
			if(size==0) {
				 sql="SELECT * FROM reservation WHERE uid=? ORDER BY rid DESC";
				
			}else if(size==1) {
				 sql="SELECT * FROM reservation WHERE uid=? ORDER BY rid DESC LIMIT 1";
				 
			}
			
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, uid);
			ResultSet re=ps.executeQuery();
			
			while(re.next()) {
				ReservationBeans rb=new ReservationBeans();
				
				rb.setRid(re.getInt("rid"));
				rb.setReservation_type(re.getInt("reservation_type"));
				rb.setUid(re.getInt("uid"));
				rb.setUname(re.getString("uname"));
				rb.setAir_type(re.getInt("air_type"));
				rb.setCheck_in(re.getString("check_in"));
				rb.setBudget_package_type(re.getInt("budget_package_type"));
				rb.setCheck_out(re.getString("check_out"));
				rb.setMini_bar(re.getInt("mini_bar"));
				rb.setAdults(re.getInt("adults"));
				rb.setSwimming_pool(re.getInt("swimming_pool"));
				rb.setChildren(re.getInt("children"));
				
				resev.add(rb);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return resev;
	}
	
	public void editReservationReq(ReservationBeans rs) 
	 {
		 try 
		 {
			 String sql = "UPDATE reservation SET budget_package_type=? WHERE rid=?";
	    	 PreparedStatement ps = conn.prepareStatement(sql);
	    	 		    	 	
	    	 	ps.setInt(1, rs.getBudget_package_type());
	    	 	ps.setInt(2, rs.getRid());
	    	 	
	    	 	ps.executeUpdate();
	    		
		 } 
		 catch (SQLException e) 
		 {
			 e.printStackTrace();
		 }
		 
	 }
	
	public void deleteReservationReq(ReservationBeans rs) {
		try {
			String sql = "DELETE FROM reservation WHERE rid=?";
			
			PreparedStatement lb = conn.prepareStatement(sql);
			lb.setInt(1,rs.getRid());
			
			lb.execute();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	//report 
	
    public Integer totReport() {
		int count = 0;
		try {
			String sql = "SELECT COUNT(rid) FROM reservation";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			rs.next();
			String sum = rs.getString(1);
			count = Integer.parseInt(sum);

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;

	}
	
	public Integer totReport(String gg) {
		int count = 0;
		try {
			String sql=null;
			
			if(gg.equals("total_visitors")) {
				sql= "SELECT SUM(adults) FROM reservation ";
			}else if(gg.equals("total_children")) {
				sql= "SELECT SUM(children) FROM reservation ";
			}
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			rs.next();
			String sum = rs.getString(1);
			count = Integer.parseInt(sum);

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;

	}
	
	public Integer mostBookedRoom(String gg) {
		int count = 0;
		try {
			String sql=null;
			
			if(gg.equals("Executive")) {
				sql= "SELECT COUNT(reservation_type) FROM reservation WHERE reservation_type=1";
			}else if(gg.equals("Presidential")) {
				sql= "SELECT COUNT(reservation_type) FROM reservation WHERE reservation_type=2";
			}else if(gg.equals("Deluxe")) {
				sql= "SELECT COUNT(reservation_type) FROM reservation WHERE reservation_type=3";
			}
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			rs.next();
			String sum = rs.getString(1);
			count = Integer.parseInt(sum);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
		
	}
}
