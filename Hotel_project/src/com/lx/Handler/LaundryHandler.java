package com.lx.Handler;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lx.Beans.LaundryBeans;
import com.lx.Beans.TransManageBeans;
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
		String edit = request.getParameter("edit");
		
		if(action.equals("deleteReq")) {
			int lid= Integer.parseInt(request.getParameter("lid"));
			
			LaundryBeans laundry = new LaundryBeans();
			
			laundry.setLid(lid);
			
			dao.delLaundryData(laundry);
			
			System.out.println("delete successfull");
			response.sendRedirect("user-laundry.jsp?status=successReq");
		}else if (action.equals("confirm")) {
			int lid = Integer.parseInt(request.getParameter("lid"));

			LaundryBeans laundry = new LaundryBeans();

			laundry.setLid(lid);
			if (edit.equals("conf")) {
				laundry.setStatus(1);;
			}
			if (edit.equals("deny")) {
				laundry.setStatus(2);
			}
			dao.confirmReq(laundry);

			System.out.println("confirmed");
			response.sendRedirect("admin-laundry.jsp?status=succuss");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		String url = request.getParameter("lastUrl");
		
		
		
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
			laundry.setTshirt(Integer.parseInt(request.getParameter("tshirt")));
			laundry.setFrock(Integer.parseInt(request.getParameter("frock")));
			laundry.setTrousers(Integer.parseInt(request.getParameter("trousers")));
			laundry.setJeans(Integer.parseInt(request.getParameter("jeans")));
			laundry.setStatus(0);
			
			
			dao.NewLoundryReq(laundry);
			System.out.println("inserted");
			
			String message="You have successfully added a laundry request.";
			response.sendRedirect("user-laundry.jsp?status=successReq&message="+message+"");
			
			
			
		}else if (action.equalsIgnoreCase("editLaundryReq"))
        {
        	LaundryBeans lb = new LaundryBeans();
        	
        	
        	lb.setTshirt(Integer.parseInt(request.getParameter("tshirt")));
        	lb.setFrock(Integer.parseInt(request.getParameter("frock")));
        	lb.setTrousers(Integer.parseInt(request.getParameter("trousers")));
        	lb.setJeans(Integer.parseInt(request.getParameter("jeans")));
        	lb.setBag(Integer.parseInt(request.getParameter("bag")));
        	lb.setBeaded_skirt(Integer.parseInt(request.getParameter("Beaded_skirt")));
        	lb.setLid(Integer.parseInt(request.getParameter("lid")));
        	//pb.setPaymentMethod(request.getParameter("paymentMethod"));
        	//price double
        	dao.editLaundryReq(lb);
        	//response.sendRedirect("user-laundry.jsp?status=successReq");
        	response.sendRedirect(url+"?status=successReq");
        	System.out.println("Record updated Successfully");
        	
        }
	}

}
