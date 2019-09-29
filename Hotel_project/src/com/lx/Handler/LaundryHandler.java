package com.lx.Handler;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lx.Beans.LaundryBeans;
import com.lx.Beans.paymentBean;
import com.lx.Dao.LaundryDao;


@WebServlet("/LaundryHandler")
public class LaundryHandler extends HttpServlet {
	private LaundryDao dao;
    public LaundryHandler() {
        super();
        dao=new LaundryDao();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		
		if(action.equals("deleteReq")) {
			int lid= Integer.parseInt(request.getParameter("lid"));
			
			LaundryBeans laundry = new LaundryBeans();
			
			laundry.setLid(lid);
			
			dao.delLaundryData(laundry);
			
			System.out.println("delete successfull");
			response.sendRedirect("user-laundry.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		
		if(action.equals("newLaundryRq")) {
			LaundryBeans laundry = new LaundryBeans();
			
			laundry.setUid(Integer.parseInt(request.getParameter("uid")));
			laundry.setUname(request.getParameter("uname"));
			laundry.setNic("none");
			laundry.setItem(request.getParameter("item"));
			laundry.setDate(request.getParameter("date"));
			laundry.setQuantity(2);
			laundry.setUnitPrice(10);
			laundry.setTotal(Double.parseDouble(request.getParameter("total")));
			laundry.setBag(Integer.parseInt(request.getParameter("bag")));
			laundry.setBeaded_skirt(Integer.parseInt(request.getParameter("breaded-skirt")));
			dao.NewLoundryReq(laundry);
			System.out.println("inserted");
			response.sendRedirect("user-laundry.jsp#ltable");
			
			
		}else if (action.equalsIgnoreCase("editLaundryReq"))
        {
        	LaundryBeans lb = new LaundryBeans();
        	
        	
        	lb.setBag(Integer.parseInt(request.getParameter("bag")));
        	lb.setBeaded_skirt(Integer.parseInt(request.getParameter("Beaded_skirt")));
        	lb.setLid(Integer.parseInt(request.getParameter("lid")));
        	//pb.setPaymentMethod(request.getParameter("paymentMethod"));
        	//price double
        	dao.editLaundryReq(lb);
        	response.sendRedirect("user-laundry.jsp");
            System.out.println("Record updated Successfully");
        	
        }
	}

}
