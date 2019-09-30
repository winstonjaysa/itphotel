package com.lx.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lx.Beans.employeeBean;
import com.lx.Beans.eventBean;
import com.lx.Beans.propertyBean;
import com.lx.DbConnection.ConnectionProvider;

public class eventDao {
	
	
	private Connection conn;
	
	public eventDao() {
		
		conn = ConnectionProvider.getConeection();
	}

	public void addEvent(eventBean pb) 
    {
    	try 
    	{
    		String sql = "insert into event"
			+"(event,cost,needdate)"
					+"values (?,?,?)";
    		PreparedStatement ps = conn.prepareStatement(sql);
    		
    		
    		ps.setString(1, pb.getEvent());
    		ps.setDouble(2, pb.getCost());
    		ps.setString(3, pb.getNeeddate());
    		
    		ps.executeUpdate();
    		
		} 
    	
    	catch (SQLException e) 
    	{
    		e.printStackTrace();
		}
    }
	
	
	public void removeEvent(eventBean pb) 
    {
    	try
    	{
    		String sql = "DELETE FROM event WHERE id=?";
   		 	PreparedStatement ps = conn.prepareStatement(sql);
   		 	ps.setInt(1, pb.getId());
   		 	ps.executeUpdate();
   		 	
		} 
    	
    	catch (SQLException e)
    	{
    		e.printStackTrace();
		}
    }
	
	
	public List getAllEvent() 
    {
    	List event = new ArrayList();
    	
    	try
    	{
    		String sql = "SELECT * FROM event";
    		PreparedStatement ps = conn.prepareStatement(sql);
    		ResultSet rs = ps.executeQuery();
    		
    		while (rs.next()) {
    			eventBean pb = new eventBean();
    			
    			pb.setId(rs.getInt("id"));
    			pb.setEvent(rs.getString("event"));
    			pb.setCost(rs.getDouble("cost"));
    			pb.setNeeddate(rs.getString("needdate"));
    			
    		
    			
    			event.add(pb);
    			
    		}
    		
		}
    	
    	catch (SQLException e) 
    	{
    		e.printStackTrace();
		}
    	
    	return event;
    }
	
}
