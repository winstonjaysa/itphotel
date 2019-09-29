package com.lx.Handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lx.Beans.attendanceBean;
import com.lx.Beans.employeeBean;
import com.lx.Dao.salaryDao;

/**
 * Servlet implementation class SalaryHandler
 */
@WebServlet("/SalaryHandler")
public class SalaryHandler extends HttpServlet {
	
	private salaryDao dao;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SalaryHandler() {
    	 super();
         dao = new salaryDao();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String action = request.getParameter("action");
		
		 if(action.equals("delete")) 
	        {
	        	int pid = Integer.parseInt(request.getParameter("employeeId"));
	        	attendanceBean pb=new attendanceBean();
	        	pb.setId(pid);
	        	
	        	dao.removeSalary(pb);
	        	
	        	response.sendRedirect("admin-employee.jsp");
	        	System.out.println("Record Deleted Successfully");       	       	
	        }
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String redirect="";
		
		
		String employeeid = request.getParameter("propid");        
		String action = request.getParameter("action");
		
		
		
		if(!((employeeid)== null) && action.equalsIgnoreCase("insert")) 
        {
        	int id = Integer.parseInt(employeeid);
        	attendanceBean pbean = new attendanceBean();

           
        	
        	pbean.setId(id);
        	pbean.setTax(Double.parseDouble(request.getParameter("tax")));
        	pbean.setHoursworked(Integer.parseInt(request.getParameter("hworked")));
        	pbean.setLeavetaken(Integer.parseInt(request.getParameter("leavetaken")));
        	dao.addEmployee(pbean);
        	response.sendRedirect("admin-employee.jsp#tab_4");
        //	request.setAttribute("employee", dao.getAllEmployee());    
           	System.out.println("Record Added Successfully");
        	       	
        }
        
        
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
