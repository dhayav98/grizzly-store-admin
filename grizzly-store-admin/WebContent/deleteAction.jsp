<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Action</title>
</head>
<body>
	<%
		try {
			String uname = request.getParameter("uname");
			String url = "jdbc:mysql://localhost:3306/grizzly";
			String user = "root";
			String password = "root";
			String prodId = request.getParameter("prodId");
			String sql = "delete from product_details where product_id= " + prodId ;
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(url, user, password);
			Statement stmt = conn.createStatement();
			int deleteStatus = 0;
			deleteStatus = stmt.executeUpdate(sql);
			if (deleteStatus > 0) {
				response.sendRedirect("addProductList.jsp");
			}
			stmt.close();
			conn.close();
		} catch (Exception e) {
			out.println(e.getMessage());
		}
	%>
</body>
</html>	