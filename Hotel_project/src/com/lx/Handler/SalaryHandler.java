package com.lx.Handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lx.Beans.attendanceBean;
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
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
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
