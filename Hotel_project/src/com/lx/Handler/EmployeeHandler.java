package com.lx.Handler;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.lx.Dao.employeeDao;
import com.lx.Beans.employeeBean;
import com.lx.Beans.propertyBean;



/**
 * Servlet implementation class EmployeeHandler
 */
@WebServlet("/EmployeeHandler")
public class EmployeeHandler extends HttpServlet {
	
	 private employeeDao dao;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeHandler() {
        super();
        dao = new employeeDao();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String pId = request.getParameter("pid");        
        String action = request.getParameter("action");
        
         if(action.equals("delete")) 
        {
        	int pid = Integer.parseInt(request.getParameter("employeeId"));
        	employeeBean pb=new employeeBean();
        	pb.setId(pid);
        	
        	dao.removeEmployee(pb);
        	
        	response.sendRedirect("admin-employee.jsp");
        	System.out.println("Record Deleted Successfully");       	       	
        }
        
        else if (action.equalsIgnoreCase("editform"))      
        	
        {        	
        	//redirect = Edit;            
        }
        
        
        else if (action.equalsIgnoreCase("listProperty"))
            
        {
          // redirect = PropertyRecord;
           
           request.setAttribute("employee", dao.getAllEmployee());
           
           
        } 
       
        else 	
	     {
	       //redirect = INSERT;
	     }
       
//       RequestDispatcher rd = request.getRequestDispatcher(redirect);
//       rd.forward(request, response);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String redirect="";

		String pId = request.getParameter("pid");        
        String action = request.getParameter("action");
        
        
		
		if(!((pId)== null) && action.equalsIgnoreCase("insert"))
        {
        	int id = Integer.parseInt(pId);
        	employeeBean pbean = new employeeBean();

        	
        	pbean.setPid(id);
        	pbean.setNic(request.getParameter("nic"));
        	pbean.setName(request.getParameter("ename"));
        	pbean.setAddress(request.getParameter("address"));
        	pbean.setGender(request.getParameter("rad"));
        	pbean.setDob(request.getParameter("dob"));
        	pbean.setPosition(request.getParameter("position"));
        	pbean.setHourlyrate(Double.parseDouble(request.getParameter("hourlyrate")));
        	pbean.setFixed(Double.parseDouble(request.getParameter("fixedsalary")));
        	
			dao.addEmployee(pbean);
			
        	response.sendRedirect("admin-employee.jsp#tab_1");
        	request.setAttribute("employee", dao.getAllEmployee());    
           	System.out.println("Record Added Successfully");
        	       	
        }
		else if (action.equalsIgnoreCase("edit"))
        {
        	
        	int propid = Integer.parseInt(request.getParameter("propid"));
        	employeeBean pbean = new employeeBean();
        	
        	
        	pbean.setPid(Integer.parseInt(request.getParameter("pid")));
        	pbean.setNic(request.getParameter("nic"));
        	pbean.setName(request.getParameter("name"));
        	pbean.setAddress(request.getParameter("address"));
        	pbean.setGender(request.getParameter("gender"));
        	pbean.setAge(Integer.parseInt(request.getParameter("age")));
        	pbean.setPosition(request.getParameter("position"));
        	pbean.setHourlyrate(Double.parseDouble(request.getParameter("hourlyrate")));
        	pbean.setFixed(Double.parseDouble(request.getParameter("fixedsalary")));
        	pbean.setId(propid);
        	dao.editEmployee(pbean);
        	
        	request.setAttribute("employee",pbean);
        	response.sendRedirect("admin-employee.jsp");
            System.out.println("Record updated Successfully");
        	
        }
	}

	

	
}
