<%-- 
    Document   : home
    Created on : 2018.11.21
    Author     : liem.pt
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="myApp">
<head>
<%@ include file="header.jsp"%>
<title>Product List</title>
</head>

<body class="h-100">
	<div id="container-fluid">
		<div class="row">
			<!-- MENU SIDEBAR-->
			<%@ include file="menu.jsp"%>
			<!-- END MENU SIDEBAR-->

			<!-- PAGE CONTAINER-->
			<main
				class="main-content col-lg-10 col-md-9 col-sm-12 p-0 offset-lg-2 offset-md-3">
				
			<div class="main-content-container container-fluid px-4">

				<!-- Page Header -->
				<div class="page-header row no-gutters py-4">
					<div class="col-12 col-sm-4 text-center text-sm-left mb-0">
						<span class="text-uppercase page-subtitle">Dashboard</span>
						<h3 class="page-title">Products</h3>
					</div>
				</div>

				<!-- MAIN CONTENT-->
				<div class="row">
					<c:if test="${sm != null}">
						<div class="alert alert-success alert-dismissable fade in">
							<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
							<strong>Success!</strong> ${sm}
						</div>

					</c:if>
					<c:if test="${em != null}">
						<div class="alert alert-danger alert-dismissable fade in">
							<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
							<strong>Error!</strong> ${em}
						</div>
					</c:if>
				</div>

				<div class="row">
					<div class="col-lg-4 col-md-6 col-sm-12 mb-4">

						<div class="card card-small">

							<div class="card-header border-bottom">
								<h6 class="m-0">
									<i class="fa fa-chart-bar"></i> Insert Product
								</h6>
							</div>

							<div class="card-body pt-0">
								<c:if test="${product.pid != null}">
									<form action="<%=request.getContextPath()%>/updateProduct"
										method="post">
								</c:if>
								<c:if test="${product.pid == null}">
									<form action="<%=request.getContextPath()%>/addProduct"
										method="post">
								</c:if>
								<div class="form-group">
									<label for="pid">Product ID: </label> <input
										value="${product.pid}" name="pid" type="text"
										class="form-control" id="pid"
										<c:if test="${product.pid == null}">disabled="1"</c:if>" readonly="1">
								</div>

								<div class="form-group">
									<label for="pname">Product Name:</label> <input
										value="${product.pname}" name="pname" type="text"
										class="form-control" id="pname">
								</div>

								<div class="form-group">
									<label for="price">Price:</label> <input
										value="${product.price}" name="price" type="text"
										class="form-control" id="price">
								</div>
								<div class="form-group">
									<label for="age">Quantity:</label> <input
										value="${product.qty}" name="qty" type="text"
										class="form-control" id="qty">
								</div>

								<c:if test="${product.pid != null}">
									<button type="submit" class="btn btn-warning">
										<i class="fa fa-edit"></i> Update
									</button>
									<a href="<%=request.getContextPath()%>/product"
										class="btn btn-primary pull-right"><i
										class="fa fa-user-plus"></i> New</a>
								</c:if>

								<c:if test="${product.pid == null}">
									<button type="submit" class="btn btn-success">
										<i class="fa fa-send"></i> Submit
									</button>
								</c:if>
								</form>
							</div>
						</div>
					</div>

					<div class="col-lg-8 col-md-12 col-sm-12 mb-4">
						<div class="card card-small">

							<div class="card-header border-bottom">
								<h6 class="m-0">
									<i class="zmdi zmdi-account-calendar"></i> Product List
								</h6>
							</div>

							<div class="card-body pt-0">
								<table class="table mb-0">
									<thead class="bg-light">
										<tr>
											<th scope="col" class="border-0">Id</th>
											<th scope="col" class="border-0">Product Name</th>
											<th scope="col" class="border-0">Price</th>
											<th scope="col" class="border-0">Quantity</th>
											<th colspan="2" scope="col" class="border-0 text-center">Action</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="row" items="${products}">
											<tr>
												<td>${row.pid}</td>
												<td>${row.pname}</td>
												<td>${row.price}</td>
												<td>${row.qty}</td>
												<td><a
													href="<%= request.getContextPath()%>/editProduct/${row.pid}"
													class="btn btn-warning"><i class="fa fa-edit"></i> Edit</a>
												</td>
												<td><a id="del_${row.pid}" class="btn btn-danger"
													href=""><i class="fa fa-trash"></i> Delete</a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-12">
						<div class="copyright">
							<p>Copyright © 2018.</p>
						</div>
					</div>
				</div>
			</div>
			</main>
		</div>
	</div>

	<%@ include file="footer.jsp"%>

	<script type="text/javascript">
		$(document).on("click", "[id^='del_']", function() {
			let id = $(this).attr('id').split('_')[1];
				
			bootbox.confirm("Are you want to delete this item ?", function(result) {
				if (result) {
					window.location.href = "<%=request.getContextPath()%> /deleteProduct/" + id;
				}
			});
		});
	</script>

</body>
</html>
