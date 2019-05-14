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
	<%!static int status = 0;%>
	<%
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String url = "jdbc:mysql://localhost:3306/grizzly";
		String sql = "select * from user_details where user_name = '" + username + "' and password = '" + password
				+ "'";
		String sql1 = "select status from user_details where user_name = '" + username + "'";
		System.out.println(status);
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(url, "root", "root");
		Statement stmt = conn.createStatement();
		Statement stmt1 = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		ResultSet rs1 = stmt1.executeQuery(sql1);
		rs1.next();

		if (rs.next() && rs.getInt(4) == 1) {
			session.setAttribute("username", rs.getString(2));
			session.setAttribute("designation", rs.getString(5));
			session.setAttribute("user_id", rs.getString(1));
			session.setAttribute("office", rs.getString(6));
			response.sendRedirect("addProduct.jsp");
		} else if (status < 3 && rs1.getInt(1) == 1) {
			status += 1;
			out.println(status + "status");
			response.sendRedirect("index.jsp");
		} else if (status >= 3) {
			PreparedStatement pstmt = conn
					.prepareStatement("update user_details set status = 0 where user_name = ?");
			pstmt.setString(1, username);
			int updateStatus = 0;
			updateStatus = pstmt.executeUpdate();
			pstmt.close();
			out.println("Login exceeded three times. Your account is locked.");
		}
		if (rs1.getInt(1) == 0) {
			out.println("Contact the Database Administrator to unlock your account....");
		}

		rs.close();
		stmt.close();
		conn.close();
	%>
</body>
</html>

