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
<title>Customer List</title>
</head>

<body class="h-100" ng-controller="masterCtrl">
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
						<h3 class="page-title">Customers</h3>
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
									<i class="fa fa-user-plus"></i> Register Customer
								</h6>
							</div>

							<div class="card-body pt-0">

								<c:if test="${customer.cid != null}">
									<form action="<%=request.getContextPath()%>/updateCustomer"
										method="post">
								</c:if>
								<c:if test="${customer.cid == null}">
									<form action="<%=request.getContextPath()%>/addCustomer"
										method="post">
								</c:if>
								<div class="form-group">
									<label for="cid">Customer ID: </label> <input
										value="${customer.cid}" name="cid" type="text"
										class="form-control" id="cid"
										<c:if test="${customer.cid == null}">disabled="1"</c:if>" readonly="1">
								</div>

								<div class="form-group">
									<label for="cname">Name:</label> <input
										value="${customer.cname}" name="cname" type="text"
										class="form-control" id="cname">
								</div>

								<div class="form-group">
									<label for="phone">Phone:</label> <input
										value="${customer.phone}" name="phone" type="text"
										class="form-control" id="phone">
								</div>
								
								<div class="form-group">
									<label for="city">City:</label>
									
									<c:if test="${customer.cid == null}">
										<select name="city" class="form-control" ng-model="customer.city">
											<option ng-repeat="city in cities" value="{{city.id}}">
												{{city.name}}
											</option>
										</select>
									</c:if>
									<c:if test="${customer.cid != null}">
										
									</c:if>
									
								</div>

								<c:if test="${customer.cid != null}">
									<button type="submit" class="btn btn-warning">
										<i class="fa fa-edit"></i> Update
									</button>
									<a href="<%=request.getContextPath()%>/customers"
										class="btn btn-primary pull-right"><i
										class="fa fa-user-plus"></i> New</a>
								</c:if>

								<c:if test="${customer.cid == null}">
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
									<i class="fa fa-users"></i> Customer List
								</h6>
							</div>

							<div class="card-body pt-0">
								<table class="table mb-0">
									<thead class="bg-light">
										<tr>
											<th scope="col" class="border-0">Id</th>
											<th scope="col" class="border-0">Name</th>
											<th scope="col" class="border-0">Phone</th>
											<th scope="col" class="border-0">City</th>
											<th colspan="2" scope="col" class="border-0 text-center">Action</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="row" items="${customers}">
											<tr>
												<td>${row.cid}</td>
												<td>${row.cname}</td>
												<td>${row.phone}</td>
												<td>${row.city.name}</td>
												<td><a
													href="<%= request.getContextPath()%>/editCustomer/${row.cid}"
													class="btn btn-warning"><i class="fa fa-edit"></i> Edit</a></td>
												<td>
													<a
													onclick="return confirm('Are you want to delete this item?')"
													href="<%= request.getContextPath()%>/deleteCustomer/${row.cid}"
													class="btn btn-danger"><i class="fa fa-trash"></i>
														Delete
													</a>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<footer class="main-footer d-flex p-2 px-3 bg-white border-top">
				<span class="copyright ml-auto my-auto mr-2">Copyright © 2018.
					<a href="hhttp://shopnuochoaquyenru.com" rel="nofollow">Liti Perfume</a>
				</span>
			</footer>
			
			</main>
		</div>
	</div>
	
	<%@ include file="footer.jsp"%>
</body>
</html>
