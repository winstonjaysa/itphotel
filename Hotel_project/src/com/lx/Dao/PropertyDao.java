package com.lx.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.lx.Beans.propertyBean;
import com.lx.DbConnection.ConnectionProvider;

public class PropertyDao
{
	private Connection conn;

    public PropertyDao()
    {
    	conn = ConnectionProvider.getConeection();
    }
    
    
    public void addProperty(propertyBean pb) 
    {
    	try 
    	{
    		String sql = "INSERT INTO properties(pid ,pname ,pvalue ,pnoofItems , pbrand, pemail, ppnumber) VALUES (?, ?, ?, ?, ?, ? ,?)";
    		PreparedStatement ps = conn.prepareStatement(sql);
    		
    		ps.setInt(1, pb.getPid());
    		ps.setString(2, pb.getPname());
    		ps.setInt(3, pb.getPvalue());
    		ps.setInt(4, pb.getPnoofItems());
    		ps.setString(5,pb.getPbrand());
    		ps.setString(6, pb.getPemail());
    		ps.setString(7, pb.getPpnumber());
    		ps.executeUpdate();
    		
		} 
    	
    	catch (SQLException e) 
    	{
    		e.printStackTrace();
		}
    }
    
    public void removeProperty(propertyBean pb) 
    {
    	try
    	{
    		String sql = "DELETE FROM properties WHERE propid=?";
   		 	PreparedStatement ps = conn.prepareStatement(sql);
   		 	ps.setInt(1, pb.getPropid());
   		 	ps.executeUpdate();
   		 	
		} 
    	
    	catch (SQLException e)
    	{
    		e.printStackTrace();
		}
    }
    
    public void editProperty(propertyBean pb) 
    {
    	try
    	{
    		String sql = "UPDATE properties SET pid=?,pname=?,pvalue=?,pnoofItems=?,pbrand=?,pemail=?,ppnumber=? WHERE propid=?";
    		PreparedStatement ps = conn.prepareStatement(sql);
    		
    		ps.setInt(1, pb.getPid());
    		ps.setString(2, pb.getPname());
    		ps.setInt(3, pb.getPvalue());
    		ps.setInt(4, pb.getPnoofItems());
    		ps.setString(5, pb.getPbrand());
    		ps.setString(6, pb.getPemail() );
    		ps.setString(7, pb.getPpnumber());
    		ps.setInt(8, pb.getPropid());
    		
//    		String sql = "UPDATE properties SET pname=?,pbrand=? WHERE propid=?";
//    		PreparedStatement ps = conn.prepareStatement(sql);
//    		ps.setString(1, pb.getPname());
//    		ps.setString(2, pb.getPbrand());
//    		ps.setInt(3, pb.getPropid());
    		
    		ps.executeUpdate(); 
    		
		}
    	
    	catch (SQLException e)
    	{
    		 e.printStackTrace();
		}
    }
    public void removePValue(propertyBean pb) {
    	String sql="UPDATE properties SET pnoofItems=? WHERE prop=?";
    	
    	try {
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, pb.getPnoofItems());
			ps.setInt(2, pb.getPropid());
			
			ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
    }
	
    
    public List getAllProperty() 
    {
    	List properties = new ArrayList();
    	
    	try
    	{
    		String sql = "SELECT * FROM properties";
    		PreparedStatement ps = conn.prepareStatement(sql);
    		ResultSet rs = ps.executeQuery();
    		
    		while (rs.next()) {
    			propertyBean pb = new propertyBean();
    			
    			pb.setPropid(rs.getInt("propid"));
    			pb.setPid(rs.getInt("pid"));
    			pb.setPname(rs.getString("pname"));
    			pb.setPvalue(rs.getInt("pvalue"));
    			pb.setPnoofItems(rs.getInt("pnoofItems"));
    			pb.setPbrand(rs.getString("pbrand"));
    			pb.setPemail(rs.getString("pemail"));
    			pb.setPpnumber(rs.getString("ppnumber"));
    			
    			properties.add(pb);
    			
    		}
    		
		}
    	
    	catch (SQLException e) 
    	{
    		e.printStackTrace();
		}
    	
    	return properties;
    }
    
    public propertyBean getPropertyById(int PropertyId ) 
    {
    	propertyBean pb = new propertyBean();
    	
    	try
    	{
    		String sql = "SELECT * FROM properties WHERE pid=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, PropertyId);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
            	pb.setPid(rs.getInt("pid"));
            	pb.setPname(rs.getString("pname"));
            	pb.setPvalue(rs.getInt("pvalue"));
            	pb.setPnoofItems(rs.getInt("pnoofItems"));
    			pb.setPbrand(rs.getString("pbrand"));
    			pb.setPemail(rs.getString("pemail"));
    			pb.setPpnumber(rs.getString("ppnumber"));
            	
            }
		} 
    	
    	catch (SQLException e) 
    	{
    		e.printStackTrace();
		}
    	
    	return pb;
    }
    
    

}
