package com.lx.Handler;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lx.Beans.TransManageBeans;
import com.lx.Dao.TransManageDao;

@WebServlet("/TransManageHandler")
public class TransManageHandler extends HttpServlet {
	private TransManageDao dao;

	public TransManageHandler() {
		super();
		dao = new TransManageDao();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");
		String edit = request.getParameter("edit");
		if (action.equals("confirm")) {
			int tid = Integer.parseInt(request.getParameter("tid"));

			TransManageBeans travel = new TransManageBeans();

			travel.setTid(tid);
			if (edit.equals("conf")) {
				travel.setIsApproved(1);
			}
			if (edit.equals("deny")) {
				travel.setIsApproved(2);
			}
			dao.confirmReq(travel);

			System.out.println("confirmed");
			response.sendRedirect("admin-travel.jsp?status=succuss");
		}
		else if(action.equals("deleteReq")) {
			int tid=Integer.parseInt(request.getParameter("tid"));
			
			TransManageBeans travel=new TransManageBeans();
			
			travel.setTid(tid);
			
			dao.deleteReq(travel);
			
			System.out.println("delete successfull!");
			response.sendRedirect("travel.jsp?status=successReq");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		
		if (action.equals("newTravel")) {
			TransManageBeans travel = new TransManageBeans();

			double cost=Double.parseDouble(request.getParameter("cost"));
			System.out.print("cost is");
			System.out.println(cost);
			
			travel.setUid(Integer.parseInt(request.getParameter("uid")));
			travel.setUname(request.getParameter("uname"));
			travel.setDestination(request.getParameter("destination"));
			travel.setVehicle(request.getParameter("vehicle"));
			travel.setNeedDate(request.getParameter("needdate"));
			travel.setCost(cost);
			travel.setIsApproved(0);
			
			dao.NewArrange(travel);
			
			String message="You have successfully changed your request.";
			
			response.sendRedirect("travel.jsp?status=successReq&message="+message+"");
			System.out.println("Arrange success!");
		}
		
		else if(action.equals("sendMessage")) {
			String url = request.getParameter("lastUrl");
			
			TransManageBeans ms=new TransManageBeans();
			
			
			ms.setUid(Integer.parseInt(request.getParameter("uid")));
			ms.setTid(Integer.parseInt(request.getParameter("tid")));
			ms.setAdminMessage(request.getParameter("messageA"));
			ms.setUserMessage(request.getParameter("messageU"));
			//ms.setDatetime();
			ms.setStatus("unread");
			dao.sendMessage(ms);
			
			response.sendRedirect(url);
			System.out.println("Successful!");
		}
		
		else if (action.equals("editTravelReq")) {
			String url = request.getParameter("lastUrl");
			int tid = Integer.parseInt(request.getParameter("tid"));

			TransManageBeans travel = new TransManageBeans();

			travel.setTid(tid);
			travel.setDestination(request.getParameter("destination"));
			travel.setVehicle(request.getParameter("vehicle"));
			travel.setCost(Integer.parseInt(request.getParameter("travelCostEdit")));
			travel.setNeedDate(request.getParameter("needdate"));

			dao.editTravelReq(travel);

			System.out.println("Edit successfull the reqested travel details!");
			response.sendRedirect(url);
		}
		
		
	}

}
