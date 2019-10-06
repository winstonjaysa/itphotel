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

import com.lx.Beans.ContactUsBeans;
import com.lx.Dao.contactUsDao;


@WebServlet("/ContactusHandler")
public class ContactusHandler extends HttpServlet {
    private contactUsDao dao;
       
   
    public ContactusHandler() {
        super();
        dao = new contactUsDao();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String redirect="";
        String cId = request.getParameter("cid");        
        String action = request.getParameter("action");
        
        if(action.equalsIgnoreCase("delete")) 
        {
        	int cid = Integer.parseInt(request.getParameter("cid"));
        	dao.removecontact(cid);
        	response.sendRedirect("admin-contactus.jsp");
        	
            System.out.println("Record Deleted Successfully");       	       	
        }
        
        else if (action.equalsIgnoreCase("editform"))        	
        {        	
        //	redirect = Edit;            
        } 
        
        else if (action.equalsIgnoreCase("edit"))
        {
        	String contactId = request.getParameter("contactId");
        	int cid = Integer.parseInt(contactId);
        	ContactUsBeans cb = new ContactUsBeans();
        	   	
        	cb.setCid(cid);
        	//cb.setFirstN(request.getParameter("firstN"));  
        	//cb.setLastN(request.getParameter("lastN"));
        	cb.setEmail(request.getParameter("email"));
        	cb.setSubject(request.getParameter("subject"));
        	
        	
        	//dao.editcontact(cb);
        	
        	request.setAttribute("contactus", cb);
         //   redirect = contactRecord;
            System.out.println("Record updated Successfully");
        	
        }
        
        else if(action.equalsIgnoreCase("removeFeedback")) 
        {
        	int fid = Integer.parseInt(request.getParameter("fid"));
        	dao.removeFeedback(fid);
        	response.sendRedirect("admin-contactus.jsp");
        	
            System.out.println("Record Deleted Successfully");       	       	
        }
       
		
	}
	
		
		
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uId = request.getParameter("uid");        
        String action = request.getParameter("action");
        
        
       // if(!((uId)== null) && action.equalsIgnoreCase("insert")) 
         if(action.equalsIgnoreCase("insert")) 
        {
        //	int id = Integer.parseInt(uId);
        	ContactUsBeans cb = new ContactUsBeans();
	
        	//cb.setUid(id);
        	cb.setUname(request.getParameter("uname"));  
        	cb.setDate(request.getParameter("date"));
        	cb.setEmail(request.getParameter("email"));
        	cb.setSubject(request.getParameter("subject"));
        	cb.setMessage(request.getParameter("message"));
        	cb.setStatus(false);
        	
        	dao.addcontact(cb);
        	response.sendRedirect("user-contactus.jsp");
        	System.out.println("Record Added Successfully");
        	       	
        }
        else if(!((uId)== null) && action.equalsIgnoreCase("insertAdmin")) 
        {	
        	String link = request.getParameter("link");
        	int id = Integer.parseInt(uId);
        	int msType = Integer.parseInt(request.getParameter("msType"));
        	ContactUsBeans cb = new ContactUsBeans();
	        //conadmin	
        	if(msType==1) {
		        	cb.setUid(id);
		        	cb.setTo_uid(Integer.parseInt(request.getParameter("to_uid")));
		        	cb.setUname(request.getParameter("uname"));  
		        	cb.setReply(request.getParameter("reply"));
		        	cb.setStatus(false);
		        	
		        	dao.conAdminsMessages(cb);
	        	}else if(msType==2) {
		        	cb.setUid(id);
		        	cb.setTo_uid(Integer.parseInt(request.getParameter("to_uid")));
		        	cb.setUname(request.getParameter("uname"));  
		        	cb.setInbox(request.getParameter("inbox"));
		        	cb.setStatus(false);
		        	
		        	dao.adminsMessages(cb);
	        	}
        	
        	response.sendRedirect(link);
        	System.out.println("Rec1ord Added Successfully");
        	       	
        }else if(action.equalsIgnoreCase("addFeedback")) 
        {
        	ContactUsBeans cb = new ContactUsBeans();
	
        	
        	cb.setDescription(request.getParameter("description"));
        	cb.setFeedName(request.getParameter("feedName"));
        	
        	dao.addFeedback(cb);
        	response.sendRedirect("admin-contactus.jsp");
        	
        	System.out.println("Record Added Successfully");
        	       	
        }else if(action.equalsIgnoreCase("editFeedback")) 
        {
        	ContactUsBeans cb = new ContactUsBeans();
	
        	cb.setFid(Integer.parseInt(request.getParameter("fid")));
        	cb.setDescription(request.getParameter("description"));
        	cb.setFeedName(request.getParameter("feedName"));
        	
        	dao.editFeedback(cb);
        	response.sendRedirect("admin-contactus.jsp");
        	
        	System.out.println("Record Added Successfully");
        	       	
        }
        
	}

}
