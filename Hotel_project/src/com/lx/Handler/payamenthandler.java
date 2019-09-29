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

import com.lx.Dao.paymentDao;
import com.lx.Beans.paymentBean;


@WebServlet("/payamenthandler")
public class payamenthandler extends HttpServlet {
	
//    private static String INSERT = "/payment.jsp";
//    private static String Edit = "/editpayment.jsp";
//    private static String PropertyRecord = "/listpayment.jsp";
    private paymentDao dao;
	
       
  
    public payamenthandler() {
        super();
        dao = new paymentDao();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
        String action = request.getParameter("action");
        
        if(action.equalsIgnoreCase("removerPayment")) 
        {
        	String paymentId = request.getParameter("paymentId");
        	int pid =Integer.parseInt(request.getParameter("pid"));
        	dao.removerPayment(pid);
        	response.sendRedirect("admin-payment.jsp");
        	System.out.println("Record Deleted Successfully"); 
        	
        }
//        
//        else if (action.equalsIgnoreCase("editform"))        	
//        {        	
//        	redirect = Edit;            
//        }
//        
        
        
//        else if (action.equalsIgnoreCase("listpayment"))
//            
//        {
//           redirect = PropertyRecord;
//           request.setAttribute("payment", dao.getAllpayment());
//           
//           else if	
//           {
//               redirect = INSERT;
//           }
//           
//           RequestDispatcher rd = request.getRequestDispatcher(redirect);
//           rd.forward(request, response);
//   		
//   	}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String redirect="";
        //String billId = request.getParameter("billid");        
        String action = request.getParameter("action");
        
        
		
		if(action.equalsIgnoreCase("insert")) 
        {
        	paymentBean pb = new paymentBean();
        	
        	pb.setBillid(request.getParameter("billid"));
        	pb.setDate(request.getParameter("date"));
        	pb.setPaymentMethod(request.getParameter("paymentMethod"));
        	pb.setCategory(request.getParameter("category"));
        	pb.setPrice(Double.parseDouble(request.getParameter("price")));
        	
        	
        	dao.addpayment(pb);
        	response.sendRedirect("admin-payment.jsp");
        	//redirect = PropertyRecord;
        	//request.setAttribute("payment", dao.getAllpayment());    
           	System.out.println("Record Added Successfully");
        	       	
        }else if (action.equalsIgnoreCase("editPayment"))
        {
        	paymentBean pb = new paymentBean();
        	
        	
        	pb.setPaymentMethod(request.getParameter("paymentMethod"));
        	pb.setCategory(request.getParameter("category"));
        	pb.setPid(Integer.parseInt(request.getParameter("pid")));
        	//pb.setPaymentMethod(request.getParameter("paymentMethod"));
        	//price double
        	dao.editPayment(pb);
        	response.sendRedirect("admin-payment.jsp");
            System.out.println("Record updated Successfully");
        	
        }
	}

}
