<%@page import="org.apache.tomcat.dbcp.dbcp2.PStmtKey"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ADMIN LOGIN</title>
</head>
<body>
	<%
		try {
			String url = "jdbc:mysql://localhost:3306/grizzly";
			String user = "root";
			String password = "root";
			String sql = "INSERT INTO `grizzly`.`product_details` (`product_id`, `product_name`, `category`, `Description`, `price`) VALUES (?,?,?,?,?)";
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(url, user, password);
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,request.getParameter("prod-id"));
			pstmt.setString(2,request.getParameter("prod-name"));
			pstmt.setString(3,request.getParameter("prod-category"));
			pstmt.setString(4,request.getParameter("prod-desc"));
			pstmt.setString(5,request.getParameter("prod-price"));
			int flag = 0;
			flag = pstmt.executeUpdate();
			if (flag > 0) {
				response.sendRedirect("addProductList.jsp");
			} else {
				out.println("Error while inserting the Record...");
			}
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			out.println(e.getMessage());
		}
	%>
</body>
</html>

