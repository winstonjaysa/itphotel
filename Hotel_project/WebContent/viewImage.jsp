<%-- 
    Document   : viewImage
    Created on : Oct 19, 2017, 12:08:11 PM
    Author     : Dharmesh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.lx.Beans.Employee"%>
<%@ page import="com.lx.Dao.EmployeeDbUtil"%>
<%@ page import="com.lx.Handler.EmployeeControllerServlet"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <b>View | <a href="index.jsp">Upload</a></b><br/><br/>
        
		<%
		String id = request.getParameter("employeeid");
		%>
		<img src="getImage.jsp?id=<%=id%>" width="400px"/>
    </body>
</html>
