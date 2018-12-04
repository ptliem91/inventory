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
<%@ include file="../header.jsp"%>
<title>Product List</title>
</head>

<body ng-controller="masterCtrl" class="h-100">
	<div id="container-fluid">
		<div class="row">
			<!-- MENU SIDEBAR-->
			<%@ include file="../menu.jsp"%>
			<!-- END MENU SIDEBAR-->

			<!-- PAGE CONTAINER-->
			<main
				class="main-content col-lg-10 col-md-9 col-sm-12 p-0 offset-lg-2 offset-md-3">
			<div class="main-content-container container-fluid px-4">

				<!-- Page Header -->
				<div class="page-header row no-gutters py-4">
					<div class="col-12 col-sm-4 text-center text-sm-left mb-0">
						<span class="text-uppercase page-subtitle">Dashboard</span>
						<h3 class="page-title">Address Master</h3>
					</div>
				</div>

				<!-- MAIN CONTENT-->
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 mb-4">
						<c:if test="${sm != null}">
							<div class="alert alert-success alert-dismissable">
								<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
								<strong>Success!</strong> ${sm}
							</div>
	
						</c:if>
						<c:if test="${em != null}">
							<div class="alert alert-danger alert-dismissable">
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
									<i class="fa fa-chart-bar"></i> Insert Address
								</h6>
							</div>

							<div class="card-body pt-0">								
								<div class="form-group">
									<label for="id">City ID: </label>
									<input ng-model="city.id"
										value="{{city.id}}" name="id" type="text"
										class="form-control" id="id"
										readonly="1" />
								</div>
								
								<div class="form-group">
									<label for="code">City code:</label>
									<input maxlength="3" ng-model="city.code"
										value="{{city.code}}" name="code" type="text"
										class="form-control" id="code" />
								</div>

								<div class="form-group">
									<label for="name">City Name:</label> 
									<input ng-model="city.name"
										value="{city.name}" name="name" type="text"
										class="form-control" id="name" />
								</div>

								<button ng-show="city.id != null" type="submit" class="btn btn-warning"  ng-click="updateCity()">
									<i class="fa fa-edit"></i> Update
								</button>
								
								<button ng-show="city.id == null" type="submit" class="btn btn-success" ng-click="addNewCity()">
									<i class="fa fa-send"></i> Add
								</button>
								
							</div>
						</div>
					</div>

					<div class="col-lg-8 col-md-12 col-sm-12 mb-4">
						<div class="card card-small">

							<div class="card-header border-bottom">
								<h6 class="m-0">
									<i class="zmdi zmdi-account-calendar"></i> Address List
								</h6>
							</div>

							<div class="card-body pt-0">
								<table class="table mb-0">
									<thead class="bg-light">
										<tr>
											<th colspan="5">
												<input ng-model="searchText" type="text"
												class="form-control"
												placeholder="Searchy & Filter By City Name" />
											</th>
										</tr>
										<tr>
											<th scope="col" class="border-0">Id</th>
											<th scope="col" class="border-0">City Code</th>
											<th scope="col" class="border-0">City Name</th>
											<th colspan="2" scope="col" class="border-0 text-center">Action</th>
										</tr>
									</thead>
									<tbody>
										<tr ng-repeat="city in cities | filter: searchText">
											<td>{{city.id}}</td>
											<td>{{city.code}}</td>
											<td>{{city.name}}</td>
											<td>
												<a ng-click="editCity(city)"
												class="btn btn-warning">
													<i class="fa fa-edit"></i> Edit
												</a>
											</td>
											<td>
												<a ng-bootbox-confirm="Are you sure you want to confirm this ? "
													ng-bootbox-confirm-action="deleteCity(city)" 
													ng-bootbox-confirm-action-cancel="">
													class="btn btn-danger"><i class="fa fa-trash"></i> Delete
												</a>
											</td>
										</tr>
									</tbody>
									<tfoot>
										<tr>
											<td>
												<button ng-show="$scope.cities.length > 10" type="button"
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

	<%@ include file="../footer.jsp"%>
	
</body>
</html>
