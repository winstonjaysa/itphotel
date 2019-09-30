package com.lx.Handler;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lx.Beans.employeeBean;
import com.lx.Beans.eventBean;
import com.lx.Beans.propertyBean;
import com.lx.Dao.employeeDao;
import com.lx.Dao.eventDao;

/**
 * Servlet implementation class EventHandler
 */
@WebServlet("/EventHandler")
public class EventHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private eventDao dao;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventHandler() {
        super();
        dao = new eventDao();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 String action = request.getParameter("action");
		if(action.equals("delete")) 
        {
        	int pid = Integer.parseInt(request.getParameter("eventId"));
        	eventBean pb=new eventBean();
        	pb.setId(pid);
        	
        	dao.removeEvent(pb);
        	
        	response.sendRedirect("eventtable.jsp");
        	System.out.println("Record Deleted Successfully");       	       	
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		
		 String action = request.getParameter("action");
	        
	        
			
			if(action.equalsIgnoreCase("insert")) 
	        {
	        	
	        	eventBean pbean = new eventBean();

	           
	        	
	        	pbean.setEvent(request.getParameter("Event"));
	        	pbean.setCost(Double.parseDouble(request.getParameter("cost1")));
	        	pbean.setNeeddate(request.getParameter("needdate1"));
	        	
	        	dao.addEvent(pbean);
	        	response.sendRedirect("event.jsp");
	        //	request.setAttribute("employee", dao.getAllEmployee());    
	           	System.out.println("Record Added Successfully");
	        	       	
	        }
		
			
	        
		
		
		
		
	}

}
