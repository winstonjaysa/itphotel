package com.lx.Handler;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lx.Beans.propertyBean;
import com.lx.Dao.PropertyDao;

@WebServlet("/PropetyHandler")
public class PropetyHandler extends HttpServlet {
	
//	private static String INSERT = "/admin-property.jsp";
//    private static String Edit = "/edit.jsp";
//    private static String PropertyRecord = "/listProperty.jsp";
    private PropertyDao dao;
	
       
   
    public PropetyHandler() 
    {
        super();
        dao = new PropertyDao();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String pId = request.getParameter("pid");        
        String action = request.getParameter("action");
        
         if(action.equals("delete")) 
        {
        	int pid = Integer.parseInt(request.getParameter("propertyId"));
        	propertyBean pb=new propertyBean();
        	pb.setPropid(pid);
        	
        	dao.removeProperty(pb);
        	
        	response.sendRedirect("admin-property.jsp");
        	System.out.println("Record Deleted Successfully");       	       	
        }
        
        else if (action.equalsIgnoreCase("editform"))        	
        {        	
        	//redirect = Edit;            
        } 
        
        else if(action.equals("removeNoofItems")) {
        	int newitems=Integer.parseInt(request.getParameter("newitems"));
        	int total=0;
        	propertyBean pb=new propertyBean();
        	int old=pb.getPnoofItems();
        	
        	total=old-newitems;
        	pb.setPnoofItems(total);
        	pb.setPropid(Integer.parseInt(request.getParameter("propid")));
        	dao.removePValue(pb);
        	response.sendRedirect("admin-property.jsp");
        	System.out.println("removed");
        	
        	
        }
        else if (action.equalsIgnoreCase("listProperty"))
            
        {
          // redirect = PropertyRecord;
           
           request.setAttribute("properties", dao.getAllProperty());
           
        } 
       
        else 	
	     {
	       //redirect = INSERT;
	     }
       
//       RequestDispatcher rd = request.getRequestDispatcher(redirect);
//       rd.forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String redirect="";
        String pId = request.getParameter("pid");        
        String action = request.getParameter("action");
        
		
		if(!((pId)== null) && action.equalsIgnoreCase("insert")) 
        {
        	int id = Integer.parseInt(pId);
        	propertyBean pbean = new propertyBean();
        	
        	pbean.setPid(id);
        	pbean.setPname(request.getParameter("pname"));
        	pbean.setPvalue(Integer.parseInt(request.getParameter("pvalue")));
        	pbean.setPnoofItems(Integer.parseInt(request.getParameter("pnoofItems")));
        	pbean.setPbrand(request.getParameter("pbrand"));
        	pbean.setPemail(request.getParameter("pemail"));
        	pbean.setPpnumber(request.getParameter("ppnumber"));
        	        	
        	dao.addProperty(pbean);
        	response.sendRedirect("admin-property.jsp#tab_1");
        	request.setAttribute("properties", dao.getAllProperty());    
           	System.out.println("Record Added Successfully");
        	       	
        }
		else if (action.equalsIgnoreCase("edit"))
        {
        	
        	int propid = Integer.parseInt(request.getParameter("propid"));
        	propertyBean pbean = new propertyBean();
        	
        	pbean.setPropid(propid);
        	pbean.setPid(Integer.parseInt(request.getParameter("pid")));
        	pbean.setPname(request.getParameter("pname"));
        	pbean.setPvalue(Integer.parseInt(request.getParameter("pvalue")));
        	pbean.setPnoofItems(Integer.parseInt(request.getParameter("pnoofitems")));
        	pbean.setPbrand(request.getParameter("pbrand"));
        	pbean.setPemail(request.getParameter("pemail"));
        	pbean.setPpnumber(request.getParameter("ppnumber"));
        
        	dao.editProperty(pbean);
        	
        	request.setAttribute("properties", pbean);
        	response.sendRedirect("admin-property.jsp");
            System.out.println("Record updated Successfully");
        	
        }
	}

}
