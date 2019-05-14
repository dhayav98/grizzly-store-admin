<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
if(session.getAttribute("username") == null){
	response.sendRedirect("index.jsp");
}
%>
<html>
<head>
<title>Grizzly Store</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="styles/main.css">
<link rel="stylesheet" href="styles/bootstrap.css">
<script src="scripts/main.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
<script src="scripts/bootstrap.js"></script>
</head>

<body>
	<div class="container-fluid n">
		<div class="row align-items-center" style="padding: 20px;">
			<div class="col-sm-2">
				<span class="nav-brand" style="font-size: 20px;">GRIZZLY<img
					src="images/logo-nav.png" width="50px" height="50px" />STORE
				</span>
			</div>
			<div class="col-sm-2 lead">
				<div class="searchContainer rounded-circle search-box">
					<input class="searchBox" type="search" name="search"
						placeholder="Search"> <i class="fa fa-search searchIcon"></i>
				</div>
			</div>
			<div class="col-sm-4"></div>
			<div class="col-sm-1 lead text-right">
				<i class="fas fa-bell"></i>
			</div>
			<div class="col-sm-2 lead text-center">
				Welcome, Admin
				<%=session.getAttribute("username")%></div>
			<div class="col-sm-1 lead text-right">
				<a href="logout.jsp" class="btn btn-secondary rounded-circle">
					<span style="color: black">Logout</span>
				</a>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class=" col-sm-3">
				<div class="card profile h-100">
					<div
						class="align-items-center d-md-flex card-title justify-content-between">
						<div class="card-title h5 p-2">PROFILE</div>
						<div>
							<h5 class="pr-2">Edit</h5>
						</div>
					</div>
					<div class="w-75 mx-auto">
						<img class="card-img-top" src="images/human.png"
							alt="Card image cap">
					</div>
					<div class="card-body">
						<div class="card-text profile-text">
							<div class="h4"><%=session.getAttribute("username")%></div>
							<br> <strong>ID</strong> <br>
							<div><%=session.getAttribute("user_id")%></div>
							<br> <strong> Designation</strong> <br>
							<div><%=session.getAttribute("designation")%></div>
							<br> <strong>Office</strong> <br>
							<div><%=session.getAttribute("office")%></div>
						</div>
					</div>
				</div>
			</div>

			<div class="col ">
				<div class="add-product ">
					<div class="row">
						<div class="col-sm-8">
							<ul class="nav nav-tabs" role="tablist">
								<li class="nav-item "><a class="nav-link active na-col"
									data-toggle="tab" href="#home">
										<p class="h2">PRODUCTS</p>
								</a></li>
								<li class="nav-item"><a class="nav-link na-col"
									data-toggle="tab" href="#vendors">
										<p class="h2">VENDORS</p>
								</a></li>
							</ul>
						</div>
					</div>
					<div class="tab-content">
						<div id="home" class="tab-pane active">
							<br>
							<div
								class=" top-buffer d-flex flex-row align-items-center justify-content-between">
								<div class="d-flex">
									<button class="btn rounded-circle1 mr-4">Choose Action</button>
									<div class="rounded-circle1 mr-4">
										<input type="search" placeholder="Category Name "
											class=" rounded-circle1"><i
											class="fa fa-search searchIcon"></i>
									</div>
									<div class="rounded-circle1 mr-4"> <input type="text" list="sortby"
										class="rounded-circle1" name="sortby" placeholder="Sort By">
										<datalist id="sortby">
											<option value="Ascending">
											<option value="Descending">
										</datalist>
									</div>
								</div>
								<div>
									<form action="addProduct.jsp">
										<button class="btn btn-dark rounded-circle ">Add
											Product</button>
									</form>
								</div>
							</div>
							<div class="row top-buffer">
								<div class="col">
									<div class="table-wrapper-scroll-y">

										<table class="table h4 w-100 h-100">
											<thead>
												<tr>
													<th class="no-border-checkb no-border"
														style="border-bottom: transparent"></th>
													<th class="text-center">Products List</th>
													<th class="text-center">Brand</th>
													<th class="text-center">Category</th>
													<th class="text-center">Rating</th>
													<th class="text-center"></th>
												</tr>
											</thead>
											<tbody>
												<%
													try {
														Class.forName("com.mysql.jdbc.Driver");
														String sql = "SELECT product_details.product_id,product_details.product_name, product_details.category, brand_table.brand_name,product_details.Description,product_details.price FROM product_details INNER JOIN brand_table ON product_details.brand_id = brand_table.brand_id ORDER BY product_details.product_id;";
														String url = "jdbc:mysql://localhost:3306/grizzly";
														Connection conn = DriverManager.getConnection(url, "root", "root");
														Statement stmt = conn.createStatement();
														ResultSet rs = stmt.executeQuery(sql);
														while (rs.next()) {
												%>
												<tr>
													<form id="mainform1" action="addProductDesc.jsp"
														method="post">
														<td style="border-top: transparent"><div
																class="round">
																<input type="checkbox" id="<%=rs.getString(1)%>" /> <label
																	for="<%=rs.getString(1)%>"></label>
															</div></td>
														<td><%=rs.getString(2)%></td>
														<td><%=rs.getString(4)%></td>
														<td><%=rs.getString(3)%></td>
														<td>4.5 <input type="hidden" name="prodName"
															value="<%=rs.getString(2)%>"> <input
															type="hidden" name="prodDesc"
															value="<%=rs.getString(5)%>"> <input
															type="hidden" name="prodPrice"
															value="<%=rs.getString(6)%>"> <input
															type="hidden" name="prodBrand"
															value="<%=rs.getString(4)%>">
														</td>
														<td><button
																class="btn btn-secondary rounded-circle ml-3 mr-3">View</button>
															<button
																class="btn btn-secondary rounded-circle ml-3 mr-3"
																disabled>Block</button> <a
															href="deleteAction.jsp?prodId=<%=rs.getString(1)%>"
															role="button"
															class="btn btn-secondary rounded-circle ml-3 mr-3">Remove</a></td>
													</form>
												</tr>
												<%
													}
													} catch (Exception e) {
														out.println(e.getMessage());
													}
												%>
											</tbody>
										</table>

									</div>
								</div>
							</div>
						</div>
						<div id="vendors" class="container tab-pane fade">
							<br>
							<h3>VENDORS</h3>
							<p>Yet to be designed</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>
