package com.lx.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lx.Beans.ReservationBeans;
import com.lx.DbConnection.ConnectionProvider;

public class ReservationDao {
	private Connection conn;
	
	public ReservationDao() {
		conn=ConnectionProvider.getConeection();
	}
	public void newBooking(ReservationBeans res) {
		
		try {
			String sql="INSERT INTO reservation(uid,uname,reservation_type,budget_package_type,air_type,Room_size_type,days,arrival_date,rooms_count,mini_bar,swimming_pool)VALUES(?,?,?,?,?,?,?,?,?,?,?)";
			
			
			//String sql="INSERT INTO reservation(uname)VALUES(?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ps.setInt(1, res.getUid());
			ps.setString(2, res.getUname());
			ps.setInt(3, res.getReservation_type());
			ps.setInt(4, res.getBudget_package_type());
			ps.setInt(5, res.getAir_type());
			ps.setInt(6, res.getRoom_size_type());
			ps.setInt(7, res.getDays());
			ps.setString(8, res.getArrival_date());
			ps.setInt(9, res.getRooms_count());
			ps.setInt(10, res.getMini_bar());
			ps.setInt(11, res.getSwimming_pool());
			
			ps.executeUpdate();
					
		}
		
		catch (SQLException e)
		{
			e.printStackTrace();
		}
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
				
				rb.setReservation_type(re.getInt("reservation_type"));
				rb.setUid(re.getInt("uid"));
				rb.setUname(re.getString("uname"));
				rb.setAir_type(re.getInt("air_type"));
				rb.setArrival_date(re.getString("arrival_date"));
				rb.setBudget_package_type(re.getInt("budget_package_type"));
				rb.setDays(re.getInt("days"));
				rb.setMini_bar(re.getInt("mini_bar"));
				rb.setRoom_size_type(re.getInt("Room_size_type"));
				rb.setSwimming_pool(re.getInt("swimming_pool"));
				rb.setRooms_count(re.getInt("rooms_count"));
				
				resev.add(rb);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return resev;
	}
}
