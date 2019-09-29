package com.lx.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.lx.Beans.attendanceBean;
import com.lx.Beans.employeeBean;
import com.lx.Dao.employeeDao;
import com.lx.DbConnection.ConnectionProvider;

public class salaryDao {

	
	private Connection conn;
	private String position;
	private double hourlyrate;
	private double fixedsalary;
	public salaryDao() {
		conn = ConnectionProvider.getConeection();
	}

	
	
	
	
	
	
	public void addEmployee(attendanceBean pb) 
    {
		
		employeeBean ref = new employeeBean();
    	
    	try
    	{
    		String sql = "SELECT * FROM employee WHERE empid=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1,pb.getId());
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
            
            	ref.setPosition(rs.getString("position"));
                ref.setHourlyrate(rs.getDouble("hourlyrate"));
            	ref.setFixed(rs.getDouble("fixedsalary"));
            	position=ref.getPosition();
            	hourlyrate=ref.getHourlyrate();
            	fixedsalary=ref.getFixed();
            }
		} 
    	
    	catch (SQLException e) 
    	{
    		e.printStackTrace();
		}
		
		
		
    	try 
    	{
    		String sql = "insert into salary"
			+"(employeeid,tax,hoursworked,leavetaken,totalsalary)"
					+"values (?,?,?,?,?)";
    		PreparedStatement ps = conn.prepareStatement(sql);
    		
    		ps.setInt(1,pb.getId());
    		ps.setDouble(2, pb.getTax());
    		ps.setInt(3, pb.getHoursworked());
    		ps.setInt(4, pb.getLeavetaken());
    		ps.setDouble(5,hourlyrate);
    		ps.executeUpdate();
    		
		} 
    	
    	catch (SQLException e) 
    	{
    		e.printStackTrace();
		}
    }
	
	
	
	
	
}
