package com.lx.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lx.Beans.attendanceBean;
import com.lx.Beans.employeeBean;
import com.lx.Beans.propertyBean;
import com.lx.Dao.employeeDao;
import com.lx.DbConnection.ConnectionProvider;

public class salaryDao {

	
	private Connection conn;
	private String position;
	private double hourlyrate;
	private double fixedsalary;
	private double salary;
	private double tax;
	private int hoursworked;
	private int leavetaken;
	private String name;
	
	
	public salaryDao() {
		conn = ConnectionProvider.getConeection();
	}
	
	public List getAllSalary() 
    {
    	List salary = new ArrayList();
    	
    	try
    	{
    		String sql = "SELECT * FROM salary";
    		PreparedStatement ps = conn.prepareStatement(sql);
    		ResultSet rs = ps.executeQuery();
    		
    		while (rs.next()) {
    			attendanceBean pb = new attendanceBean();
    			
    			
    			pb.setTax(rs.getDouble("tax"));
    			pb.setId(rs.getInt("employeeid"));
    			pb.setHoursworked(rs.getInt("hoursworked"));
    			pb.setLeavetaken(rs.getInt("leavetaken"));
    			pb.setSalary(rs.getDouble("totalsalary"));
    			pb.setName(rs.getString("name"));
    			pb.setPosition(rs.getString("position"));
    			pb.setHourlyrate(rs.getDouble("hourlyrate"));
    			pb.setFixed(rs.getDouble("fixedsalary"));
    		   
            	
           
    			salary.add(pb);
    			
    		}
    		
		}
    	
    	catch (SQLException e) 
    	{
    		e.printStackTrace();
		}
    	
    	return salary;
    }
	
	
	public void removeSalary(attendanceBean pb) 
    {
    	try
    	{
    		String sql = "DELETE FROM salary WHERE employeeid=?";
   		 	PreparedStatement ps = conn.prepareStatement(sql);
   		 	ps.setInt(1, pb.getId());
   		 	ps.executeUpdate();
   		 	
		} 
    	
    	catch (SQLException e)
    	{
    		e.printStackTrace();
		}
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
            	ref.setName(rs.getString("name"));
            	position = ref.getPosition();
            	hourlyrate=ref.getHourlyrate();
            	fixedsalary=ref.getFixed();
            	name = ref.getName();
            	
        
            	
            }
		} 
    	
    	catch (SQLException e) 
    	{
    		e.printStackTrace();
		}
		
		
		
    	try 
    	{
    		
    		
           
    		tax = pb.getTax();
 		    hoursworked = pb.getHoursworked();
 		    leavetaken=pb.getLeavetaken();
    	    
    	    if(!(hourlyrate== 0.0)) {
    	    	
    	    	double hsalary = hoursworked*hourlyrate;
    	    	double taxsalary = (tax/100)*hsalary;
    	    	salary = hsalary-taxsalary;
    	    	
    	    }
    	    
    	    else if(!(fixedsalary==0.0)) {
    	    
    	    	
    	    	double daysal = fixedsalary/30;
    	    	double normsal = daysal * leavetaken;
    	    	double taxsalary = (tax/100)*fixedsalary;
    	    	salary = fixedsalary - normsal - taxsalary;
    	    	
    	    	
    	    	
    	    }
    	    
    		
    		String sql = "insert into salary"
			+"(employeeid,name,position,hourlyrate,fixedsalary,tax,hoursworked,leavetaken,totalsalary)"
					+"values (?,?,?,?,?,?,?,?,?)";
    		
    		
    		
    		PreparedStatement ps = conn.prepareStatement(sql);
    	
    		
    		
    		ps.setInt(1,pb.getId());
    		ps.setString(2, name);
    		ps.setString(3, position);
    		ps.setDouble(4, hourlyrate);
    		ps.setDouble(5,fixedsalary);
    		ps.setDouble(6,tax);
    		ps.setInt(7, hoursworked);
    		ps.setInt(8, leavetaken);
    		ps.setDouble(9,salary);
    	
    	
    		ps.executeUpdate();
    	
    		
		} 
    	
    	catch (SQLException e) 
    	{
    		e.printStackTrace();
		}
    }
	
	
	
	
	
}
