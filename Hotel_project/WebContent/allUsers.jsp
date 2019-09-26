<%@page import="com.lx.Beans.UserBean"%>
<%@page import="java.util.List"%>
<%@page import="com.lx.Dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Index</title>
</head>
<body>
	<a href="reg.jsp">Register pg</a>
	<a href="travel.jsp">Travel pg</a>
	<a href="admin.jsp">Admin pg</a>
	<pre> A L L    U S E R S </pre>
	<table>
		<tr>
			<th>User id</th>
			<th>User name</th>
			<th>First name</th>
			<th>Last name</th>
		</tr>
		<%
			UserDao dao = new UserDao();
			List<UserBean> userlist = dao.getAllUsers();

			for (UserBean user : userlist) {
		%>
		<tr>
			<td><%=user.getUid()%></td>
			<td><%=user.getUname()%></td>
			<td><%=user.getFname()%></td>
			<td><%=user.getLname()%></td>
		</tr>
		<%
			}
		%>
	</table>

</body>
</html>