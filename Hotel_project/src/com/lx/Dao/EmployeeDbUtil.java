package com.lx.Dao;
import java.sql.Connection;
import java.util.List;

import com.lx.DbConnection.ConnectionProvider;
import com.lx.Beans.*;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class EmployeeDbUtil {
	
private ConnectionProvider datasource;
	
	
	public EmployeeDbUtil(ConnectionProvider thedatasource){
		
		datasource=thedatasource;
		
	}
	
	public List <Employee> getEmployee() throws Exception{
		 
		List<Employee> employees = new ArrayList<>();
		 
		Connection myConn = null;
		Statement myStmt = null;
		ResultSet myRs = null;
		
try{
			
			myConn=ConnectionProvider.getConeection();
			String sql = "select * from employee";
			myStmt = myConn.createStatement();
			 
			myRs =  myStmt.executeQuery(sql);
			 
			while(myRs.next()){
				 int id = myRs.getInt("empid");
				 String Nic= myRs.getString("nic");
				 String Name= myRs.getString("name"); 
				 String Address= myRs.getString("address");
				 String Gender= myRs.getString("gender");
				 int Age= myRs.getInt("age");
				 String Position= myRs.getString("position");
				 Double Hourlyrate= myRs.getDouble("hourlyrate");
				 Double Fixed= myRs.getDouble("fixedsalary");
				 Employee emp1 = new Employee(id,Nic,Name,Address,Gender,Age,Position,Hourlyrate,Fixed);
				 
				 employees.add(emp1); 
			 } 
			
			
			
			return employees;
			
		}finally{
			
		//	close(myConn, myStmt,myRs);
			
		}
		
	}

	private static void close(Connection myConn, Statement myStmt, ResultSet myRs) {
		
		try{
			
			if(myRs !=null){
				myRs.close();
			}
			if(myStmt !=null){
				myStmt.close();
			}
			if(myConn !=null){
				myConn.close();
			}
		}catch(Exception exc)
		{
			exc.printStackTrace();
		}
	}

	public static void addEmployee(Employee theEmployee) throws SQLException {


		Connection myConn = null;
		PreparedStatement myStmt = null;
		

			
			myConn=ConnectionProvider.getConeection();
			
			String sql = "insert into employee"
			+"(nic,name,address,gender,age,position,hourlyrate,fixedsalary)"
					+"values (?,?,?,?,?,?,?,?)";
			myStmt = myConn.prepareStatement(sql);
			
			myStmt.setString(1, theEmployee.getNic());
			myStmt.setString(2, theEmployee.getName());
			myStmt.setString(3, theEmployee.getAddress());
			myStmt.setString(4, theEmployee.getGender());
			myStmt.setInt(5, theEmployee.getAge());
			myStmt.setString(6, theEmployee.getPosition());
			myStmt.setDouble(7, theEmployee.getHourlyrate());
			myStmt.setDouble(8, theEmployee.getFixed());
			
			myStmt.execute();
			
		
			
		
		
			
		}

	public static Employee getEmployee(String theEmployeeId) throws Exception {
		
		Employee theEmployee = null;
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRs = null;
		int employeeId;
		
		try {
			
			employeeId = Integer.parseInt(theEmployeeId);
			
			
			myConn=ConnectionProvider.getConeection();
			
			String sql ="select * from employee where empid=?";
			
			myStmt = myConn.prepareStatement(sql);
			
			myStmt.setInt(1,employeeId);
			
			
			myRs = myStmt.executeQuery();
			
			if(myRs.next()) {
				
			String name = myRs.getString("name"); 
			String nic = myRs.getString("nic");
			String address = myRs.getString("address");
			int age = myRs.getInt("age");
			String position = myRs.getString("position"); 
			double hourlyrate = myRs.getDouble("hourlyrate");
			double fixed = myRs.getDouble("fixedsalary"); 
				
			theEmployee = new Employee(employeeId,name,nic,address,age,position,hourlyrate,fixed);
			}
			else {
				
				throw new Exception("Could not find student id: "+ employeeId);
				
				
				
			}
			
			
			
			return theEmployee;
		}
		finally {
			
		//	close(myConn,myStmt,myRs);
			
			
		}
		
		
		
		
	
	}

	public static void updateEmployee(Employee theEmployee) throws Exception {
		
		
		Connection myConn = null;
		PreparedStatement myStmt = null;
		try {
		myConn=ConnectionProvider.getConeection();
		
		String sql = "update employee"
		             + "set nic=?,name=?,address=?,age=?,position=?,hourlyrate=?,fixedsalary=?"
				+ "where empid=?";
		
		myStmt = myConn.prepareStatement(sql);
		
		myStmt.setString(1,theEmployee.getName());
		myStmt.setString(2,theEmployee.getNic());
		myStmt.setString(3,theEmployee.getAddress());
		myStmt.setInt(4,theEmployee.getAge());
		myStmt.setString(5,theEmployee.getPosition());
		myStmt.setDouble(6,theEmployee.getHourlyrate());
		myStmt.setDouble(7,theEmployee.getFixed());
		myStmt.setInt(8,theEmployee.getId());
		
		myStmt.execute();
		
	}
	
	finally {
		// clean up JDBC objects
	//	close(myConn, myStmt, null);
	}
		
			
	}

	public static void deleteEmployee(String theEmployeeId) throws Exception {
		
		Connection myConn = null;
		PreparedStatement myStmt = null;
		
		try {
			int employeeId = Integer.parseInt(theEmployeeId);
			
			myConn=ConnectionProvider.getConeection();
			
			String sql = "delete from employee where empid=?";
			
			myStmt = myConn.prepareStatement(sql);
			
			myStmt.setInt(1, employeeId);
			
			myStmt.execute();
			
			
			
			
		}finally {
			
			// clean up JDBC objects
			//close(myConn, myStmt, null);	
			
			
		}
		
		
		
		
		
		
		
	}
}


