<%@ page import="com.lx.Beans.employeeBean"%>
<%@ page import="com.lx.Dao.employeeDao"%>
<%@ page import="com.lx.Handler.EmployeeHandler"%>
<%@ page import="com.lx.DbConnection.ConnectionProvider" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%
    String id = request.getParameter("id");
    Connection myConn = null;
 
    try {
    	myConn=ConnectionProvider.getConeection();
        PreparedStatement ps = myConn.prepareStatement("select * from data where empid=?");
        ps.setString(1,id);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            Blob blob = rs.getBlob("image");
            byte byteArray[] = blob.getBytes(1, (int) blob.length());
            response.setContentType("image/gif");
            OutputStream os = response.getOutputStream();
            os.write(byteArray);
            os.flush();
            os.close();
        } else {
            System.out.println("No image found with this id.");
        }
    } catch (Exception e) {
        out.println(e);
    }
%>
