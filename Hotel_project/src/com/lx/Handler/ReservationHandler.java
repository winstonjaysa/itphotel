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

import com.lx.Beans.LaundryBeans;
import com.lx.Beans.ReservationBeans;
import com.lx.Dao.PropertyDao;
import com.lx.Dao.ReservationDao;


@WebServlet("/ReservationHandler")
public class ReservationHandler extends HttpServlet {
	
	private ReservationDao dao;
		
    public ReservationHandler() {
        super();
        dao = new ReservationDao();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		
		if(action.equals("deleteReservationReq")) {
			int rid= Integer.parseInt(request.getParameter("rid"));
			
			ReservationBeans rs = new ReservationBeans();
			
			rs.setRid(rid);
			
			dao.deleteReservationReq(rs);
			
			System.out.println("delete successfull");
			response.sendRedirect("user-profile.jsp");
		}
	}


	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String action=request.getParameter("action");
		
		int reservation_type=Integer.parseInt(request.getParameter("reservation_type"));
		if(action.equals("resRoom")) 
		{
			ReservationBeans rb=new ReservationBeans();
			
			rb.setReservation_type(reservation_type);
			rb.setUid(Integer.parseInt(request.getParameter("uid")));
			rb.setUname(request.getParameter("uname"));
			rb.setAir_type(Integer.parseInt(request.getParameter("air_type")));
			rb.setCheck_in(request.getParameter("check_in"));
			rb.setCheck_out(request.getParameter("check_out"));
			rb.setBudget_package_type(Integer.parseInt(request.getParameter("budget_package_type")));
			rb.setAdults(Integer.parseInt(request.getParameter("adults")));
			rb.setChildren(Integer.parseInt(request.getParameter("children")));
			rb.setMini_bar(0);
			rb.setSwimming_pool(0);
		
			dao.newBooking(rb);
			response.sendRedirect("user-profile.jsp#tab_3");
		}
//			else if(action.equals("resRoom") && reservation_type== 1) 
//		{
//			ReservationBeans rb=new ReservationBeans();
//			
//			rb.setReservation_type(reservation_type);
//			
//			rb.setUid(17);
//			rb.setUname("gsfdfs");
//			rb.setAir_type(Integer.parseInt(request.getParameter("air_type")));
//			rb.setArrival_date(request.getParameter("arrival_date"));
//			rb.setBudget_package_type(0);
//			rb.setDays(Integer.parseInt(request.getParameter("days")));
//			rb.setMini_bar(Integer.parseInt(request.getParameter("mini_bar")));
//			rb.setRoom_size_type(Integer.parseInt(request.getParameter("Room_size_type")));
//			rb.setSwimming_pool(Integer.parseInt(request.getParameter("swimming_pool")));
//			rb.setRooms_count(Integer.parseInt(request.getParameter("rooms_count")));
//		
//			dao.newBooking(rb);
//			response.sendRedirect("index.jsp");
//		}
		
		else if(action.equals("editReservationReq")){
			int rid=Integer.parseInt(request.getParameter("rid"));
			
			ReservationBeans rb=new ReservationBeans();
			
			rb.setRid(rid);
			rb.setBudget_package_type(Integer.parseInt(request.getParameter("budget_package_type")));
			
			dao.editReservationReq(rb);
			
			response.sendRedirect("user-profile.jsp");
		}
		
	}

}
