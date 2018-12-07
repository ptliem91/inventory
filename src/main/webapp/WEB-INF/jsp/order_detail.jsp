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
<title>Order Detail List</title>
</head>

<body ng-controller="orderDetailsChartCtrl" class="bg02">
	<div class="container-fluid">
		<div class="row">

			<!-- MENU SIDEBAR-->
			<%@ include file="menu.jsp"%>
			<!-- END MENU SIDEBAR-->

			<main class="main-content col-lg-10 col-md-9 col-sm-12 p-0 offset-lg-2 offset-md-3">
			<!-- PAGE CONTAINER-->
			<div class="main-content-container container-fluid px-4">

				<div class="page-header row no-gutters py-4">
					<div class="col-12 col-sm-4 text-center text-sm-left mb-0">
						<span class="text-uppercase page-subtitle">Dashboard</span>
						<h3 class="page-title">Order Details</h3>
					</div>
				</div>

				<!-- MAIN CONTENT-->
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 mb-4">
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
				</div>

				<div class="row">
					<div class="col-lg-10 col-md-6 col-sm-12 mb-4">
						<div class="card card-small">
							<div class="card-header border-bottom">
								<h6 class="m-0">
									<i class="fa fa-chart-bar"></i> Order History
								</h6>
							</div>

							<div class="card-body pt-0">
								<table class="table mb-0">
									<thead class="bg-light">
										<tr>
											<th colspan="10">
												<input ng-model="searchText" type="text"
												class="form-control"
												placeholder="Search..." />
											</th>
										</tr>
										<tr>
											<th>S.NO.</th>
											<th>Order ID</th>
											<th>Customer</th>
											<th>Type</th>
											<th>Order Date</th>
											<th>Amount (TK)</th>
											<th>Ship Service</th>
											<th>Ship Status</th>
											<th>Display Details</th>
											<th>Update Ship Status</th>
										</tr>
									</thead>
									<tbody>
										<tr ng-repeat="order in orders | filter:searchText | limitTo:limit">
											<td>{{$index + 1}}</td>
											<td>{{order.oid}}</td>
											<td ng-repeat="customer in customers | filter:{ cid: order.cid}" >{{customer.cname}}</td>
											<td>{{order.orderType}}</td>
											<td>{{order.orderDate | date:"dd/MM/yyyy"}}</td>
											<td class="font-weight-bold">{{order.total  | currency:"":0}}</td>
											<td ng-repeat="shipService in shipServices | filter: order.shipService" >{{shipService.name}}</td>
											<td ng-repeat="shipStatus in shipStatuses | filter:{ id: order.shipStatus}" 
												ng-class="{	'bg-info text-white' : order.shipStatus == 2, 
															'bg-warning text-white' : order.shipStatus == 3,
															'bg-success text-white' : order.shipStatus == 4,
															'bg-danger text-white' : order.shipStatus == 5
															}" >
												{{shipStatus.status}}
											</td>
											<td>
												<button ng-click="findOd(order)" type="button"
													class="btn btn-default">
													<i class="fa fa-search-plus"></i>
												</button>
											</td>
											<td>
												<button class="btn btn-primary" ng-click="setSelectedOd(order)"
												        ng-bootbox-custom-dialog="Choose Status will use to update for this order (Order ID: {{order.oid}})"
												        ng-bootbox-buttons="customDialogButtons">
												    Update Ship Status
												</button>
											</td>
										</tr>
									</tbody>
									<tfoot>
										<tr>
											<td><button ng-click="loadMore()" ng-show="orders.length > limit"
													type="button"
													class="btn btn-success">
													<i class="fa fa-th-list"></i> Load more...
												</button></td>
										</tr>
									</tfoot>
								</table>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-lg-10 col-md-6 col-sm-12 mb-4">
						<div class="card card-small">
	
							<div class="card-header border-bottom">
								<h6 class="m-0">
									<i class="zmdi zmdi-account-calendar"></i> Order Details
								</h6>
							</div>
	
							<div class="card-body pt-0">
								<table class="table mb-0">
									<thead class="bg-light">
										<tr>
											<th>ID</th>
											<th>Product Name</th>
											<th>Price (VNĐ)</th>
											<th>Price Sale (VNĐ)</th>
											<th>Quantity</th>
											<th>Total Sale (VNĐ)</th>
										</tr>
									</thead>
									<tbody>
										<tr ng-repeat="od in orderDetails">
											<td>{{od.odid}}</td>
											<td ng-repeat="product in products | filter:{ pid: od.pid}" >{{product.pname}}</td>
											<td>{{od.price  | currency:"":0}}</td>
											<td ng-class="{'text-warning' : od.price == od.priceSale,
															'text-danger' : od.price > od.priceSale}">
												{{od.priceSale  | currency:"":0}}
											</td>
											<td>{{od.qty  | currency:"":0}}</td>
											<td class="font-weight-bold">{{od.priceSale * od.qty  | currency:"":0}}</td>
										</tr>
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
