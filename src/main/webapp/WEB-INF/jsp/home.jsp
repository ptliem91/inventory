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
	<title>Home</title>
</head>
<body ng-controller="appCtrl" class="bg02">

	<div class="container-fluid">
		<div class="row">

			<!-- MENU SIDEBAR-->
			<%@ include file="menu.jsp"%>
			<!-- END MENU SIDEBAR-->

			<!-- PAGE CONTAINER-->
			<main class="main-content col-lg-10 col-md-9 col-sm-12 p-0 offset-lg-2 offset-md-3">
				<div class="main-content-container container-fluid px-4">
				
					<div class="page-header row no-gutters py-4">
		              <div class="col-12 col-sm-4 text-center text-sm-left mb-0">
		                <span class="text-uppercase page-subtitle">Dashboard</span>
		                <h3 class="page-title">Overview</h3>
		              </div>
		            </div>
		            
		            <div class="row">
		              <div class="col-lg col-md-6 col-sm-6 mb-4">
		                <div class="stats-small stats-small--1 card card-small">
		                  <div class="card-body p-0 d-flex">
		                    <div class="d-flex flex-column m-auto">
		                      <div class="stats-small__data text-center">
		                        <span class="stats-small__value text-uppercase">Orders</span>
		                        <h6 class="stats-small__value count my-3">{{orders.length}}</h6>
		                      </div>
		                      <div class="stats-small__data">
		                        <span class="stats-small__percentage stats-small__percentage--increase">4.7%</span>
		                      </div>
		                    </div>
		                    <canvas height="120" class="blog-overview-stats-small-1"></canvas>
		                  </div>
		                </div>
		              </div>
		              <div class="col-lg col-md-6 col-sm-6 mb-4">
		                <div class="stats-small stats-small--1 card card-small">
		                  <div class="card-body p-0 d-flex">
		                    <div class="d-flex flex-column m-auto">
		                      <div class="stats-small__data text-center">
		                        <span class="stats-small__value text-uppercase">Customers</span>
		                        <h6 class="stats-small__value count my-3">{{customers.length}}</h6>
		                      </div>
		                      <div class="stats-small__data">
		                        <span class="stats-small__percentage stats-small__percentage--increase">12.4%</span>
		                      </div>
		                    </div>
		                    <canvas height="120" class="blog-overview-stats-small-2"></canvas>
		                  </div>
		                </div>
		              </div>
		              <div class="col-lg col-md-4 col-sm-6 mb-4">
		                <div class="stats-small stats-small--1 card card-small">
		                  <div class="card-body p-0 d-flex">
		                    <div class="d-flex flex-column m-auto">
		                      <div class="stats-small__data text-center">
		                        <span class="stats-small__value text-uppercase">Products</span>
		                        <h6 class="stats-small__value count my-3">{{products.length}}</h6>
		                      </div>
		                      <div class="stats-small__data">
		                        <span class="stats-small__percentage stats-small__percentage--increase">3.8%</span>
		                      </div>
		                    </div>
		                    <canvas height="120" class="blog-overview-stats-small-3"></canvas>
		                  </div>
		                </div>
		              </div>
		              <%-- <div class="col-lg col-md-4 col-sm-6 mb-4">
		                <div class="stats-small stats-small--1 card card-small">
		                  <div class="card-body p-0 d-flex">
		                    <div class="d-flex flex-column m-auto">
		                      <div class="stats-small__data text-center">
		                        <span class="stats-small__label text-uppercase">Users</span>
		                        <h6 class="stats-small__value count my-3">2,413</h6>
		                      </div>
		                      <div class="stats-small__data">
		                        <span class="stats-small__percentage stats-small__percentage--increase">12.4%</span>
		                      </div>
		                    </div>
		                    <canvas height="120" class="blog-overview-stats-small-4"></canvas>
		                  </div>
		                </div>
		              </div>
		              <div class="col-lg col-md-4 col-sm-12 mb-4">
		                <div class="stats-small stats-small--1 card card-small">
		                  <div class="card-body p-0 d-flex">
		                    <div class="d-flex flex-column m-auto">
		                      <div class="stats-small__data text-center">
		                        <span class="stats-small__label text-uppercase">Subscribers</span>
		                        <h6 class="stats-small__value count my-3">17,281</h6>
		                      </div>
		                      <div class="stats-small__data">
		                        <span class="stats-small__percentage stats-small__percentage--decrease">2.4%</span>
		                      </div>
		                    </div>
		                    <canvas height="120" class="blog-overview-stats-small-5"></canvas>
		                  </div>
		                </div>
		              </div> --%>
		            </div>
		            
		            
		            <div class="row" ng-controller="zingChartCtrl">
		              <!-- Users Stats -->
		              <div class="col-lg-12 col-md-12 col-sm-12 mb-4">
		                <div class="card card-small">
		                  <div class="card-header border-bottom">
		                    <h6 class="m-0">Orders by nearest week</h6>
		                  </div>
		                  <div class="card-body pt-0">
		                    <!-- <div class="row border-bottom py-2 bg-light">
		                      <div class="col-12 col-sm-6">
		                        <div id="blog-overview-date-range" class="input-daterange input-group input-group-sm my-auto ml-auto mr-auto ml-sm-auto mr-sm-0" style="max-width: 350px;">
		                          <input type="text" class="input-sm form-control" name="start" placeholder="Start Date" id="blog-overview-date-range-1">
		                          <input type="text" class="input-sm form-control" name="end" placeholder="End Date" id="blog-overview-date-range-2">
		                          <span class="input-group-append">
		                            <span class="input-group-text">
		                              <i class="material-icons"></i>
		                            </span>
		                          </span>
		                        </div>
		                      </div>
		                      <div class="col-12 col-sm-6 d-flex mb-2 mb-sm-0">
		                        <button type="button" class="btn btn-sm btn-white ml-auto mr-auto ml-sm-auto mr-sm-0 mt-3 mt-sm-0">View Full Report &rarr;</button>
		                      </div>
		                    </div>
		                    <canvas height="130" style="max-width: 100% !important;" class="blog-overview-users"></canvas> -->
		                    <div zingchart id="chart-1" zc-json="myJson" zc-width="100%" zc-height="568px"></div>
		                  </div>
		                </div>
		              </div>
		            </div>
		            
		            <div class="row" ng-controller="ordersByMonthChartCtrl">
		              <div class="col-lg-12 col-md-12 col-sm-12 mb-4">
		                <div class="card card-small">
		                  <div class="card-header border-bottom">
		                    <h6 class="m-0">Orders by month of current year</h6>
		                  </div>
		                  <div class="card-body pt-0">
		                    <div zingchart id="chart-2" zc-json="ordersByMonthJson" zc-width="100%" zc-height="568px"></div>
		                  </div>
		                </div>
		              </div>
		            </div>	
		            	           
				</div>
				
				<%@ include file="footer_copyright.jsp"%>
				
			</main>
		</div>
	</div>
	
	<%@ include file="footer.jsp"%>
	<script src="/resources/js/zing_chart.js"></script>
	<script src="/resources/js/chart/orders_by_month.js"></script>
	
</body>
</html>
