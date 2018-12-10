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

<body ng-controller="shipStatusCtrl" class="h-100">
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
						<h3 class="page-title">Ship Status</h3>
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
					
						<form name="shipStatusForm" ng-submit="checkOnSubmit($event, shipStatus )">
							<div class="card card-small">
								<div class="card-header border-bottom">
									<h6 class="m-0">
										<i class="fa fa-chart-bar"></i> Insert Ship Status
									</h6>
								</div>
	
								<div class="card-body pt-0">								
									<div class="form-group">
										<label for="id">Ship Status ID: </label>
										<input ng-model="shipStatus.id"
											value="shipStatus.id" name="id" type="text"
											class="form-control" id="id"
											readonly="1" />
									</div>
	
									<div class="form-group">
										<label for="name">Ship Service Name:</label> 
										<input ng-model="shipStatus.status" ng-required="true"
											value="shipStatus.status" name="status" type="text"
											class="form-control required" id="status" />
									</div>
	
									<button ng-show="shipStatus.id != null" type="submit" class="btn btn-warning">
										<i class="fa fa-edit"></i> Update
									</button>
									
									<button ng-show="shipStatus.id == null" type="submit" class="btn btn-success">
										<i class="fa fa-send"></i> Add
									</button>
									
								</div>
							</div>
						</form>
					</div>

					<div class="col-lg-8 col-md-12 col-sm-12 mb-4">
						<div class="card card-small">

							<div class="card-header border-bottom">
								<h6 class="m-0">
									<i class="zmdi zmdi-account-calendar"></i> Ship Service List
								</h6>
							</div>

							<div class="card-body pt-0">
								<table class="table mb-0">
									<thead class="bg-light">
										<tr>
											<th colspan="4">
												<input ng-model="searchText" type="text"
												class="form-control"
												placeholder="Search..." />
											</th>
										</tr>
										<tr>
											<th scope="col" class="border-0">Id</th>
											<th scope="col" class="border-0">Status</th>
											<th colspan="2" scope="col" class="border-0 text-center">Action</th>
										</tr>
									</thead>
									<tbody>
										<tr ng-repeat="shipStatus in shipStatuses | filter: searchText | limitTo:limit">
											<td>{{shipStatus.id}}</td>
											<td>{{shipStatus.status}}</td>
											<td>
												<button ng-click="editShipStatus(shipStatus)"
												class="btn btn-warning">
													<i class="fa fa-edit"></i> Edit
												</button>
											</td>
											<td>
												<button ng-bootbox-confirm="Are you sure you want to delete this ? "
													ng-bootbox-confirm-action="deleteShipStatus(shipStatus)" 
													ng-bootbox-confirm-action-cancel=""
													class="btn btn-danger"><i class="fa fa-trash"></i> Delete
												</button>
											</td>
										</tr>
									</tbody>
									<tfoot>
										<tr>
											<td>
												<button ng-show="shipStatuses.length > limit"
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
			
			<%@ include file="../footer_copyright.jsp"%>
			
			</main>
		</div>
	</div>

	<%@ include file="../footer.jsp"%>
	<script src="/resources/js/ship_status_controller.js"></script>
	
</body>
</html>
