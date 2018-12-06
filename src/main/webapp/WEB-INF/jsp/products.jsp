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

<body ng-controller="productCtrl" class="bg02">
	<div class="container-fluid">
		<div class="row">
			<!-- MENU SIDEBAR-->
			<%@ include file="menu.jsp"%>
			<!-- END MENU SIDEBAR-->

			<!-- PAGE CONTAINER-->
			<main class="main-content col-lg-10 col-md-9 col-sm-12 p-0 offset-lg-2 offset-md-3">
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
					<div class="col-lg-4 col-md-6 col-sm-12 mb-4">
						<div class="card card-small">
							<div class="card-header border-bottom">
								<h6 class="m-0">
									<i class="fa fa-chart-bar"></i> Insert Product
								</h6>
							</div>

							<div class="card-body pt-0">
								<div class="form-group">
									<label for="pid">Product ID</label> 
									<input ng-model="product.pid"
										value="product.pid" name="pid" type="text"
										class="form-control" id="pid"
										readonly="1" />
								</div>
								
								<div class="form-group">
									<label for="buyDate">Buy Date</label>
									<input ng-model="product.buyDate"
										value="product.buyDate" name="buyDate"
										type="date" class="form-control" />
								</div>
								
								<div class="form-group">
									<label for="code">Product Code</label>
									<input ng-model="product.code" maxlength="10"
										value="product.code" name="code" type="text"
										class="form-control" id="code" />
								</div>

								<div class="form-group">
									<label for="pname">Product Name</label>
									<input ng-model="product.pname" maxlength="100"
										value="product.pname" name="pname" type="text"
										class="form-control" id="pname" />
								</div>

								<div class="form-group">
									<label for="price">Price</label>
									<input ng-model="product.price"
										value="product.price" name="price" type="text"
										class="form-control" id="price" />
								</div>
								
								<div class="form-group">
									<label for="priceSale">Price Sale</label>
									<input ng-model="product.priceSale"
										value="product.priceSale" name="priceSale" type="text"
										class="form-control" id="priceSale" />
								</div>
								
								<div class="form-group">
									<label for="age">Quantity</label>
									<input ng-model="product.qty" maxlength="3"
										value="product.qty" name="qty" type="text"
										class="form-control" id="qty" />
								</div>

								<button ng-show="product.pid != null" type="submit" class="btn btn-warning"  ng-click="updateProduct()">
									<i class="fa fa-edit"></i> Update
								</button>
								
								<button ng-show="product.pid == null" type="submit" class="btn btn-success" ng-click="addNewProduct()">
									<i class="fa fa-send"></i> Add
								</button>
								
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
											<th colspan="8">
												<input ng-model="searchText" type="text"
												class="form-control"
												placeholder="Search..." />
											</th>
										</tr>
										<tr>
											<th scope="col" class="border-0">Code</th>
											<th scope="col" class="border-0">Product Name</th>
											<th scope="col" class="border-0">Price (VNĐ)</th>
											<th scope="col" class="border-0">Price Sales (VNĐ)</th>
											<th scope="col" class="border-0">Quantity</th>
											<th scope="col" class="border-0">Buy date</th>
											<th colspan="2" scope="col" class="border-0 text-center">Action</th>
										</tr>
									</thead>
									<tbody>
										<tr ng-repeat="product in products | filter: searchText | limitTo:limit">
											<td>{{product.code}}</td>
											<td>{{product.pname}}</td>
											<td>{{product.price | currency:"":0}}</td>
											<td>{{product.priceSale | currency:"":0}}</td>
											<td>{{product.qty}}</td>
											<td>{{product.buyDate | date:"dd/MM/yyyy"}}</td>
											<td>
												<button ng-click="editProduct(product)" class="btn btn-warning">
													<i class="fa fa-edit"></i> Edit
												</button>
											</td>
											<td>
												<button ng-bootbox-confirm="Are you sure you want to delete this ? "
													ng-bootbox-confirm-action="deleteProduct(product)" 
													ng-bootbox-confirm-action-cancel=""
													class="btn btn-danger"><i class="fa fa-trash"></i> Delete
												</button>
											</td>
										</tr>
									</tbody>
									<tfoot>
										<tr>
											<td>
												<button ng-show="products.length > limit"
													ng-click="loadMore()"
													type="button"
													class="btn btn-success">
													<i class="fa fa-th-list"></i> Load more...
												</button>
											</td>
										</tr>
									</tfoot>
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
	<script src="/resources/js/product_controller.js"></script>
	
</body>
</html>
