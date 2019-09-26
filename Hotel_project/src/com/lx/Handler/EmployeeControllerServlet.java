package com.lx.Handler;


import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.lx.Beans.Employee;
import com.lx.Dao.EmployeeDbUtil;
import com.lx.DbConnection.ConnectionProvider;;
/**
 * Servlet implementation class EmployeeControllerServlet
 */
@WebServlet("/EmployeeControllerServlet")
public class EmployeeControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private EmployeeDbUtil employeedbutil; 
	private ConnectionProvider datasource;
	
	
	@Override
	public void init() throws ServletException {

		super.init();
		try{
			employeedbutil = new EmployeeDbUtil(datasource);
		}catch(Exception exc){
			throw new ServletException(exc);
			
		}
	}


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		try {
			
			String theCommand = request.getParameter("command");
			
			if(theCommand == null){
				theCommand = "LIST";
			}
			
			switch(theCommand){
			
			case "LIST":  listEmployees(request,response);
			              break;
			
			case "ADD": addEmployees(request,response);	
			            break;
			            
			case "LOAD": loadEmployees(request,response);
			            break;
			
			            
			case "UPDATE": updateEmployees(request,response);
            break;
            
			case "DELETE": deleteEmployees(request,response);
            break;
            
			case "PROFILE": profileEmployees(request,response);
            break;

                       
			default:  listEmployees(request,response);
			
			}
			
			listEmployees(request,response);
		} catch (Exception exc) {
			// TODO Auto-generated catch block
		    throw new ServletException(exc);
		}
		
	}

	private void profileEmployees(HttpServletRequest request, HttpServletResponse response)throws Exception{
		

		String theEmployeeId = request.getParameter("employeeId");
		
		Employee theEmployee = EmployeeDbUtil.getEmployee(theEmployeeId);
		
		request.setAttribute("THE_EMPLOYEE",theEmployee);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/profile.jsp");
		
		dispatcher.forward(request,response);
		
		
		
		
		
		
	}


	private void deleteEmployees(HttpServletRequest request, HttpServletResponse response)
	throws Exception{
		
		
		String theEmployeeId = request.getParameter("employeeId");
		
		EmployeeDbUtil.deleteEmployee(theEmployeeId);
		
		listEmployees(request,response);
		
		
		
		
		
		
	}


	private void updateEmployees(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		int id = Integer.parseInt(request.getParameter("employeeId"));
		String name = request.getParameter("name");
		String nic = request.getParameter("nic");
		String address = request.getParameter("address");
		int age= Integer.parseInt((String)request.getParameter("age").trim());
		String position = request.getParameter("position");
		Double hourlyrate = Double.parseDouble((String)request.getParameter("hourlyrate").trim());
		Double fixed =  Double.parseDouble((String)request.getParameter("fixed").trim());
		
		Employee theEmployee =  new Employee(id,name,nic,address,age,position,hourlyrate,fixed);

		EmployeeDbUtil.updateEmployee(theEmployee);
		
		listEmployees(request,response);
		
	}


	private void loadEmployees(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String theEmployeeId = request.getParameter("employeeId");
		
		Employee theEmployee = EmployeeDbUtil.getEmployee(theEmployeeId);
		
		request.setAttribute("THE_EMPLOYEE",theEmployee);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/update-employee-form.jsp");
		
		dispatcher.forward(request,response);
		
	}


	private void addEmployees(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
	
	
		String name = request.getParameter("name");
		String nic = request.getParameter("nic");
		String address = request.getParameter("address");
		int age= Integer.parseInt((String)request.getParameter("age").trim());
		String gender = request.getParameter("rad");
		String position = request.getParameter("position");
		Double hourlyrate = Double.parseDouble((String)request.getParameter("hourlyrate").trim());
		Double fixed =  Double.parseDouble((String)request.getParameter("fixed").trim());
	
		
		
		Employee theEmployee = new Employee(nic,name,address,gender,age,position,hourlyrate,fixed);
		
		EmployeeDbUtil.addEmployee(theEmployee);
		
		listEmployees(request,response);
		
	}


	private void listEmployees(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		List<Employee> employees = employeedbutil.getEmployee();
		
		request.setAttribute("EMPLOYEE_LIST",employees);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/list_employees.jsp");
		dispatcher.forward(request, response);
		
	}

}
