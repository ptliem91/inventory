<%-- 
    Document   : home
    Created on : 2018.11.21
    Author     : liem.pt
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="myApp">
    <head>
        <%@ include file = "header.jsp" %>
        <title>Order Detail List</title>    
    </head>
    
    <body ng-controller="orderDetailsChartCtrl">

        <div class="page-wrapper">
        <!-- HEADER MOBILE-->
        <header class="header-mobile d-block d-lg-none">
            <div class="header-mobile__bar">
                <div class="container-fluid">
                    <div class="header-mobile-inner">
                        <a class="logo" href="index.html">
                            <img src="template/images/icon/logo.png" alt="CoolAdmin" />
                        </a>
                        <button class="hamburger hamburger--slider" type="button">
                            <span class="hamburger-box">
                                <span class="hamburger-inner"></span>
                            </span>
                        </button>
                    </div>
                </div>
            </div>
            <nav class="navbar-mobile">
                <div class="container-fluid">
                    <ul class="navbar-mobile__list list-unstyled">
                        <li class="has-sub">
                            <a class="js-arrow" href="#">
                                <i class="fas fa-tachometer-alt"></i>Dashboard</a>
                            <ul class="navbar-mobile-sub__list list-unstyled js-sub-list">
                                <li>
                                    <a href="index.html">Dashboard 1</a>
                                </li>
                                <li>
                                    <a href="index2.html">Dashboard 2</a>
                                </li>
                                <li>
                                    <a href="index3.html">Dashboard 3</a>
                                </li>
                                <li>
                                    <a href="index4.html">Dashboard 4</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="chart.html">
                                <i class="fas fa-chart-bar"></i>Charts</a>
                        </li>
                        <li>
                            <a href="table.html">
                                <i class="fas fa-table"></i>Tables</a>
                        </li>
                        <li>
                            <a href="form.html">
                                <i class="far fa-check-square"></i>Forms</a>
                        </li>
                        <li>
                            <a href="#">
                                <i class="fas fa-calendar-alt"></i>Calendar</a>
                        </li>
                        <li>
                            <a href="map.html">
                                <i class="fas fa-map-marker-alt"></i>Maps</a>
                        </li>
                        <li class="has-sub">
                            <a class="js-arrow" href="#">
                                <i class="fas fa-copy"></i>Pages</a>
                            <ul class="navbar-mobile-sub__list list-unstyled js-sub-list">
                                <li>
                                    <a href="login.html">Login</a>
                                </li>
                                <li>
                                    <a href="register.html">Register</a>
                                </li>
                                <li>
                                    <a href="forget-pass.html">Forget Password</a>
                                </li>
                            </ul>
                        </li>
                        <li class="has-sub">
                            <a class="js-arrow" href="#">
                                <i class="fas fa-desktop"></i>UI Elements</a>
                            <ul class="navbar-mobile-sub__list list-unstyled js-sub-list">
                                <li>
                                    <a href="button.html">Button</a>
                                </li>
                                <li>
                                    <a href="badge.html">Badges</a>
                                </li>
                                <li>
                                    <a href="tab.html">Tabs</a>
                                </li>
                                <li>
                                    <a href="card.html">Cards</a>
                                </li>
                                <li>
                                    <a href="alert.html">Alerts</a>
                                </li>
                                <li>
                                    <a href="progress-bar.html">Progress Bars</a>
                                </li>
                                <li>
                                    <a href="modal.html">Modals</a>
                                </li>
                                <li>
                                    <a href="switch.html">Switchs</a>
                                </li>
                                <li>
                                    <a href="grid.html">Grids</a>
                                </li>
                                <li>
                                    <a href="fontawesome.html">Fontawesome Icon</a>
                                </li>
                                <li>
                                    <a href="typo.html">Typography</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <!-- END HEADER MOBILE-->

        <!-- MENU SIDEBAR-->
        <%@ include file = "menu.jsp" %>
        <!-- END MENU SIDEBAR-->

        <!-- PAGE CONTAINER-->
        <div class="page-container">
            <!-- HEADER DESKTOP-->
            <%@ include file = "header_form.jsp" %>
            <!-- HEADER DESKTOP-->

            <!-- MAIN CONTENT-->
            <div class="main-content">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">               
                        
                        <div class="row">
                        	<div class="col-md-12 message">
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
				            
                            <div class="col-md-12">
                            
                                <div class="au-card recent-report">
                                	<h3 class="title-2 m-b-20"><i class="fa fa-chart-bar"></i> Order History</h3>
                                        <div class="table-responsive table--no-card m-b-30">                                    	                     
	                                        <table class="table table-borderless table-striped table-earning">
							                    <thead>
							                        <tr>
							                            <th colspan="7">
							                                <input ng-model="searchText" type="text" class="form-control" placeholder="Searchy & Filter By Customer Name"/>
							                            </th>
							                        </tr>
							                        <tr>
							                            <th>S.NO.</th>
							                            <th>Order ID</th>
							                            <th>Customer Name</th>
							                            <th>Order Type</th>
							                            <th>Order Date</th>
							                            <th>Amout (TK)</th>
							                            <th>Display Order Details</th>
							                        </tr>
							                    </thead>
							                    <tbody>
							                        <tr ng-repeat="order in orders | filter:searchText | limitTo:limit">
							                            <td>{{$index + 1}}</td>
							                            <td>{{order.oid}}</td>
							                            <td>{{order.cid}}</td>
							                            <td>{{order.orderType}}</td>
							                            <td>{{order.orderDate}}</td>
							                            <td>{{order.total}}</td>
							                            <td><button ng-click="findOd(order)" type="button" class="btn btn-default"><i class="fa fa-search-plus"></i></button></td>
							                        </tr>
							                    </tbody>
							                    <tfoot>
												    <tr>
												      <td><button ng-click="loadMore()" type="button" class="btn btn-success"><i class="fa fa-th-list"></i> Load more...</button></td>												      
												    </tr>
												</tfoot>
							                </table>
	                                    </div>
							          </div>
                                </div>
                            </div>                            
                        </div>
                        
                        <div class="row">
	                        <div class="ccol-md-12">
	                                <div class="au-card">
	                                	<h3 class="title-2 m-b-20">
	                                    	<i class="zmdi zmdi-account-calendar"></i> Order Details
	                                    </h3>
	                                    <div class="table-responsive table--no-card m-b-30">                                    	                     
	                                        <table class="table table-borderless table-striped table-earning">
							                    <thead>
							                        <tr>
							                            <th>ID</th>
							                            <th>Product Name</th>
							                            <th>Price</th>
							                            <th>Quantity</th>
							                            <th>Total</th>
							                        </tr>
							                    </thead>
							                    <tbody>
							                        <tr ng-repeat="od in orderDetails">
							                            <td>{{od.odid}}</td>
							                            <td>{{od.pid}}</td>
							                            <td>{{od.price}}</td>
							                            <td>{{od.qty}}</td>
							                            <td>{{od.price * od.qty}}</td>
							                        </tr>
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
                </div>
            </div>
            <!-- END MAIN CONTENT-->
            
            <!-- END PAGE CONTAINER-->
        </div>

    </div>

    </body>
</html>
