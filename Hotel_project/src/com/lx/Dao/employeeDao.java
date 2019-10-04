package com.lx.Dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import com.lx.Beans.employeeBean;
import com.lx.DbConnection.ConnectionProvider;


public class employeeDao {
	
	
	private Connection conn;
	private Date date1;
	

    //date1 = new java.util.Date();
	//java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
	//date1 =new SimpleDateFormat("dd/MM/yyyy").parse(pb.getDob());
	
	

    public employeeDao()
    {
    	conn = ConnectionProvider.getConeection();
    }
    
    
    public void addEmployee(employeeBean pb) 
    
    {
    	try 
    	{
    		String sql = "insert into employee"
			+"(pid,nic,name,address,gender,dateofbirth,position,hourlyrate,fixedsalary)"
					+"values (?,?,?,?,?,?,?,?,?)";
    		PreparedStatement ps = conn.prepareStatement(sql);
    		
    		//java.util.Date utilDate = new java.util.Date();
    		//java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
    		//date1 =new SimpleDateFormat("dd/MM/yyyy").parse(pb.getDob());
    		
    		
    		ps.setInt(1,pb.getPid());
    		ps.setString(2, pb.getNic());
    		ps.setString(3, pb.getName());
    		ps.setString(4, pb.getAddress());
    		ps.setString(5, pb.getGender());
    		ps.setString(6,pb.getDob());
    		ps.setString(7, pb.getPosition());
    		ps.setDouble(8, pb.getHourlyrate());
    		ps.setDouble(9, pb.getFixed());
    		ps.executeUpdate();
    		
		} 
    	
    	catch (SQLException e) 
    	{
    		e.printStackTrace();
		}
    }
    
    public void removeEmployee(employeeBean pb) 
    {
    	try
    	{
    		String sql = "DELETE FROM employee WHERE empid=?";
   		 	PreparedStatement ps = conn.prepareStatement(sql);
   		 	ps.setInt(1, pb.getId());
   		 	ps.executeUpdate();
   		 	
		} 
    	
    	catch (SQLException e)
    	{
    		e.printStackTrace();
		}
    }
    
    public void editEmployee(employeeBean pb) 
    {
    	try
    	{
    		String sql = "UPDATE employee SET pid=?,nic=?,name=?,address=?,gender=?,age=?,position=?,hourlyrate=?,fixedsalary=? WHERE empid=?";
    		PreparedStatement ps = conn.prepareStatement(sql);
    		
    		ps.setInt(1,pb.getPid());
    		ps.setString(2, pb.getNic());
    		ps.setString(3, pb.getName());
    		ps.setString(4, pb.getAddress());
    		ps.setString(5, pb.getGender());
    		ps.setInt(6, pb.getAge());
    		ps.setString(7, pb.getPosition());
    		ps.setDouble(8, pb.getHourlyrate());
    		ps.setDouble(9, pb.getFixed());
    		ps.setInt(10, pb.getId());
    		
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
   
    
    public List getAllEmployee() 
    {
    	List employee = new ArrayList();
    	
    	try
    	{
    		String sql = "SELECT * FROM employee";
    		PreparedStatement ps = conn.prepareStatement(sql);
    		ResultSet rs = ps.executeQuery();
    		
    		while (rs.next()) {
    			employeeBean pb = new employeeBean();
    		
    			String date1 = rs.getString("dateofbirth");
    			
    			DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
 			Date startDate;
   			try {
  			    startDate = df.parse(date1);
   			    String newDateString = df.format(startDate);
    			    System.out.println(newDateString);
 			} catch (Exception e) {
    			    e.printStackTrace();
    			}
    			
    			pb.setId(rs.getInt("empid"));
    			pb.setPid(rs.getInt("pid"));
    			pb.setNic(rs.getString("nic"));
    			pb.setName(rs.getString("name"));
    			pb.setAddress(rs.getString("address"));
    			pb.setGender(rs.getString("gender"));
    			pb.setDob(rs.getString("dateofbirth"));
    			pb.setPosition(rs.getString("position"));
    			pb.setHourlyrate(rs.getDouble("hourlyrate"));
    			pb.setFixed(rs.getDouble("fixedsalary"));
    		    
    			
    			
    			employee.add(pb);
    			
    		}
    		
		}
    	
    	catch (SQLException e) 
    	{
    		e.printStackTrace();
		}
    	
    	return employee;
    }
    
    public employeeBean getEmployeebyId(int EmployeeId ) 
    {
    	employeeBean pb = new employeeBean();
    	
    	try
    	{
    		String sql = "SELECT * FROM employee WHERE empid=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, EmployeeId);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
            	pb.setPid(rs.getInt("pid"));
            	pb.setNic(rs.getString("nic"));
    			pb.setName(rs.getString("name"));
    			pb.setAddress(rs.getString("address"));
    			pb.setGender(rs.getString("gender"));
    			pb.setAge(rs.getInt("dateofbirth"));
    			pb.setPosition(rs.getString("position"));
    			pb.setHourlyrate(rs.getDouble("hourlyrate"));
    			pb.setFixed(rs.getDouble("fixedsalary"));
            }
		} 
    	
    	catch (SQLException e) 
    	{
    		e.printStackTrace();
		}
    	
    	return pb;
    }
    
	
	
	
	
	
	
	

}
