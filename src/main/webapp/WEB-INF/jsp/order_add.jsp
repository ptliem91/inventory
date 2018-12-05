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
<title>Add Order</title>
</head>

<body ng-controller="appCtrl" class="h-100">

	<div id="container-fluid">
		<div class="row">

			<!-- MENU SIDEBAR-->
			<%@ include file="menu.jsp"%>
			<!-- END MENU SIDEBAR-->

			<main
				class="main-content col-lg-10 col-md-9 col-sm-12 p-0 offset-lg-2 offset-md-3">

			<!-- PAGE CONTAINER-->
			<div class="main-content-container container-fluid px-4">

				<div class="page-header row no-gutters py-4">
					<div class="col-12 col-sm-4 text-center text-sm-left mb-0">
						<span class="text-uppercase page-subtitle">Dashboard</span>
						<h3 class="page-title">Add Order</h3>
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
						<div class="card card-small mb-4">
							<div class="card-body text-secondary">
								Order No <input name="oid" type="text" class="form-control"
									ng-model="oid = ${orderNo}" value="${orderNo}" />
							</div>
							<div class="card-body text-secondary">
								Order Type
								<div class="radio">
									<label> <input type="radio" name="orderType"
										ng-model="orderType" value="sell"> Sell
									</label> &nbsp; &nbsp; &nbsp; <label> 
									<input type="radio"
										name="orderType" ng-model="orderType" value="purchase">
										Purchase
									</label>
								</div>
							</div>
							<div class="card-body text-secondary">
								Order Date: 
								<input ng-model="orderDate" name="orderDate"
									type="date" class="form-control" />
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
						<div class="card card-small mb-4">
							<div class="mt-2" style="text-align: center;">
								<i class="fa fa-truck"></i> Select Product
							</div>

							<div class="card-body text-secondary">
								<label for="Product Name">Product Name</label> 
								<select
									name="pname" class="form-control" ng-model="clickedProduct"
									ng-options="product.pname for product in products">
								</select>
							</div>
							<div class="card-body text-secondary">
								<label for="pid">Product ID </label> <input readonly="1"
									name="pid" type="text" class="form-control" id="pid"
									value="{{clickedProduct.pid}}">
							</div>
							<div class="card-body text-secondary">
								<label for="price">Price </label> <input readonly="1"
									name="price" type="text" class="form-control" id="price"
									value="{{clickedProduct.price}}">
							</div>
							<div class="card-body text-secondary">
								<label for="qty">Stock </label> <input readonly="1" name="qty"
									type="text" class="form-control" id="qty"
									value="{{clickedProduct.qty}}">
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
						<div class="card card-small mb-4">
							<div class="mt-2" style="text-align: center;">
								<i class="fa fa-user-circle"></i> Select Customer
							</div>

							<div class="card-body text-secondary">
								<label for="Customer Name">Customer Name:</label> <select
									name="cname" class="form-control" ng-model="clickedCustomer"
									ng-options="customer.cname for customer in customers">
								</select>
							</div>
							<div class="card-body text-secondary">
								<label for="cid">Customer ID: </label> <input readonly="1"
									name="cid" type="text" class="form-control" id="cid"
									value="{{clickedCustomer.cid}}">
							</div>
							<div class="card-body text-secondary">
								<label for="phone">Phone: </label> <input readonly="1"
									name="phone" type="text" class="form-control" id="phone"
									value="{{clickedCustomer.phone}}">
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-8 col-md-12 col-sm-12 mb-4">
					<div class="card card-small mb-4" ng-show="clickedProduct.pid != null">
						<div class="mt-2" style="text-align: center;">
							<i class="fa fa-chart-bar"></i> Order Details
						</div>

						<div class="card-body" ng-show="clickedProduct.pid != null">
							<label for="qty">Quantity:</label> <input readonly="1"
								name="orderQty" ng-model="qty = 1" type="text"
								class="form-control" id="qty" placeholder="Enter Quantity">
						</div>
						<div class="card-body"
							ng-show="qty != 0 && clickedProduct.pid != null">
							<label for="total">Total:</label> <input readonly="1"
								name="total" value="{{clickedProduct.price * qty}}" type="text"
								class="form-control" id="total">
						</div>
						<div class="card-body"
							ng-show="clickedProduct.pid != null && clickedCustomer.cid != null">
							<button ng-click="addToCart()" type="submit"
								class="btn btn-success">
								<i class="fa fa-cart-plus"></i> Add To Cart
							</button>
						</div>
					</div>
				</div>

				<div class="col-md-12" style="text-align: center; margin-top: 20px;">
					<div class="card card-small mb-4">
						<div class="mt-2" style="text-align: center;">
							<h3>
								<i class="fa fa-cart-plus"></i> Cart
								<button class="btn btn-sm btn-success">
									{{cartProduct.length}}</button>
							</h3>
						</div>
						<div class="table-responsive table--no-card m-b-30">
							<table class="table mb-0">
								<thead class="bg-light">
									<tr>
										<th>S.No</th>
										<th>Product Name</th>
										<th>Price</th>
										<th>Quantity</th>
										<th>Action</th>
										<th>Total</th>
									</tr>
								</thead>
								<tbody>
									<tr ng-repeat="product in cartProduct">
										<td>{{$index + 1}}</td>
										<td>{{product.pname}}</td>
										<td>{{product.price}}</td>
										<td>
											<button type="button" ng-click="decreaseQty(product)"
												class="btn btn-danger">
												<i class="fa fa-minus"></i>
											</button> &nbsp; &nbsp; {{product.cartQty}} &nbsp; &nbsp;
											<button type="button" ng-click="increaseQty(product)"
												class="btn btn-success">
												<i class="fa fa-plus"></i>
											</button>
										</td>
										<td><button ng-click="removeProduct(product)"
												class="btn btn-danger">
												<i class="fa fa-remove"></i> Remove
											</button></td>
										<td>{{product.subTotal}}</td>
									</tr>
								</tbody>
								<tfoot>
									<tr ng-show="cartProduct.length != 0">
										<td colspan="5" style="text-align: right">Final Total:</td>
										<td>{{finalTotal}}</td>
									</tr>
									<tr ng-show="cartProduct.length != 0">
										<td colspan="6" style="text-align: right">
											<button data-toggle="modal" data-target="#checkoutModal"
												type="button" ng-show="cartProduct.length != 0"
												class="btn btn-success">
												<i class="fa fa-check"></i> Check Out
											</button>
										</td>
									</tr>
								</tfoot>
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
			<!-- END MAIN CONTENT--> <!-- checkoutModal -->
			<div id="checkoutModal" class="modal fade" role="dialog">
				<div class="modal-dialog modal-lg">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title" align="center">
								<i class="fa fa-eye"></i> Review Your Order
							</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">
							<table class="table table-bordered table-striped">
								<tr>
									<td>Order ID</td>
									<td>{{oid}}</td>
								</tr>
								<tr>
									<td>Order Type</td>
									<td>{{orderType}}</td>
								</tr>
								<tr>
									<td>Order Date</td>
									<td>{{orderDate| date}}</td>
								</tr>
								<tr>
									<td>Customer ID</td>
									<td>{{clickedCustomer.cid}}</td>
								</tr>
								<tr>
									<td>Total Amount</td>
									<td>{{finalTotal}}</td>
								</tr>
							</table>
							<br /> <br /> <br /> Order Details: <br />
							<table class="table table-bordered table-striped">
								<thead>
									<tr>
										<th>NO</th>
										<th>Product Name</th>
										<th>Price</th>
										<th>Qty</th>
										<th>Total</th>
									</tr>
								</thead>
								<tbody>
									<tr ng-repeat="product in cartProduct">
										<td>{{$index + 1}}</td>
										<td>{{product.pname}}</td>
										<td>{{product.price}}</td>
										<td>{{product.cartQty}}</td>
										<td>{{product.price * product.qty}}</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-warning">
								<i class="fa fa-print"></i> Print
							</button>
							<button data-toggle="modal" data-target="#messageModal"
								ng-click="checkOut()" type="button" class="btn btn-success"
								data-dismiss="modal">
								<i class="fa fa-check"></i> Confirm
							</button>
							<button type="button" class="btn btn-danger" data-dismiss="modal">
								<i class="fa fa-times"></i> Cancel
							</button>
						</div>
					</div>
				</div>
			</div>

			<!-- Modal -->
			<div id="messageModal" class="modal fade" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title" align="center">Congratulation</h4>
						</div>
						<div class="modal-body">
							<h1 style="color: green; text-align: center">Order Complete
								Successfully</h1>
						</div>
						<div class="modal-footer">
							<a href="<%=request.getContextPath()%>" class="btn btn-default">Close</a>
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
