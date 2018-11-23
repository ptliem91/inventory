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
        <title>Add Order</title>
    </head>
    
    <body ng-controller="appCtrl">

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
                    <div class="container-fluid au-card">
                        <h5 class="heading-title">Add Order</h5>

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
					              <div class="row">					
					                   	<div class="col">
							                <section>
							                  <div class="card-body text-secondary">
							                  	Order No <input name="oid" type="text" class="form-control" ng-model="oid = ${orderNo}" value="${orderNo}"/>
							                  </div>
							                </section>
							             </div>
							             <div class="col">
							                <section>
							                  <div class="card-body text-secondary">
							                  	Order Type
					                                <div class="radio">
					                                    <label>
					                                        <input type="radio" name="orderType" ng-model="orderType" value="sell"> Sell
					                                    </label> &nbsp; &nbsp; &nbsp;
					                                    <label>
					                                        <input type="radio" name="orderType" ng-model="orderType" value="purchase"> Purchase
					                                    </label>
					                                </div>
							                  </div>
							                </section>
							             </div>
							             <div class="col">
							                <section>
							                  <div class="card-body text-secondary">
							                   Order Date: <input ng-model="orderDate" name="orderDate" type="date" class="form-control"/>
							                  </div>
							                </section>
							              </div>		                    
					                </div>
					
					                <div class="row">
					                     <div class="col-md-4" style="height: 360px;">
					                            <div class="panel panel-primary" style="height: 100%">
					                                <div class="panel-heading" style="text-align: center;">
					                                    <i class="fa fa-truck"></i> Select Product
					                                </div>
					                                <div class="panel-body">
					                                    <div class="form-group">
					                                        <label for="Product Name">Product Name</label>
					                                        <select name="pname" class="form-control" ng-model="clickedProduct" ng-options="product.pname for product in products">
					                                        </select>
					                                    </div>
					                                    <div class="form-group">
					                                        <label for="pid">Product ID </label>
					                                        <input readonly="1" name="pid" type="text" class="form-control" id="pid" value="{{clickedProduct.pid}}">
					                                    </div>
					                                    <div class="form-group">
					                                        <label for="price">Price </label>
					                                        <input readonly="1" name="price" type="text" class="form-control" id="price" value="{{clickedProduct.price}}">
					                                    </div>
					                                    <div class="form-group">
					                                        <label for="qty">Stock </label>
					                                        <input readonly="1" name="qty" type="text" class="form-control" id="qty" value="{{clickedProduct.qty}}">
					                                    </div>
					                                </div>
					                            </div>
					                        </div>
					                        
					                        <div class="col-md-4" style="height: 360px;">
					                            <div class="panel panel-primary" style="height: 100%">
					                                <div class="panel-heading" style="text-align: center;">
					                                    <i class="fa fa-user-circle"></i> Select Customer
					                                </div>
					                                <div class="panel-body">
					                                    <div class="form-group">
					                                        <label for="Customer Name">Customer Name:</label>
					                                        <select name="cname" class="form-control" ng-model="clickedCustomer" ng-options="customer.cname for customer in customers">
					                                        </select>
					                                    </div>
					                                    <div class="form-group">
					                                        <label for="cid">Customer ID: </label>
					                                        <input readonly="1" name="cid" type="text" class="form-control" id="cid" value="{{clickedCustomer.cid}}">
					                                    </div>
					                                    <div class="form-group">
					                                        <label for="phone">Phone: </label>
					                                        <input readonly="1" name="phone" type="text" class="form-control" id="phone" value="{{clickedCustomer.phone}}">
					                                    </div>
					                                </div>
					                            </div>
					                        </div>
					                </div>
					                
					                <div class="col-md-4" style="margin-top: 30px;">
					                	<div class="panel panel-primary" style="height: 100%">
					                                <div class="panel-heading">
					                                    <i class="fa fa-chart-bar"></i> Order Details
					                                </div>
					                                <div class="panel-body">
					                                    <div class="form-group" ng-show="clickedProduct.pid != null">
					                                        <label for="qty">Quantity:</label>
					                                        <input readonly="1" name="orderQty" ng-model="qty = 1" type="text" class="form-control" id="qty" placeholder="Enter Quantity">
					                                    </div>
					                                    <div class="form-group" ng-show="qty != 0 && clickedProduct.pid != null">
					                                        <label for="total">Total:</label>
					                                        <input readonly="1" name="total" value="{{clickedProduct.price * qty}}" type="text" class="form-control" id="total">
					                                    </div>
					                                    <div class="form-group" ng-show="clickedProduct.pid != null && clickedCustomer.cid != null"> 
					                                        <button ng-click="addToCart()" type="submit" class="btn btn-success"><i class="fa fa-cart-plus"></i> Add To Cart</button>
					                                    </div>
					                                </div>
					                	</div>
					               	</div>
					
					                <div class="col-md-12" style="text-align: center; margin-top: 20px;">
					                        <div class="panel-heading" style="margin-bottom: 20px;">
					                            <h3><i class="fa fa-cart-plus"></i> Cart <button class="btn btn-sm btn-success"> {{cartProduct.length}} </button></h3>
					                        </div>
					                        <div class="table-responsive table--no-card m-b-30">
					                            <table class="table table-borderless table-striped table-earning">
					                                <thead>
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
					                                            <button type="button" ng-click="decreaseQty(product)" class="btn btn-danger"><i class="fa fa-minus"></i></button>
					                                            &nbsp; &nbsp; {{product.cartQty}} &nbsp; &nbsp;
					                                            <button type="button" ng-click="increaseQty(product)" class="btn btn-success"><i class="fa fa-plus"></i></button>
					                                        </td>
					                                        <td><button ng-click="removeProduct(product)" class="btn btn-danger"><i class="fa fa-remove"></i> Remove</button></td>
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
					                                            <button data-toggle="modal" data-target="#checkoutModal" type="button" ng-show="cartProduct.length != 0" class="btn btn-success"><i class="fa fa-check"></i> Check Out</button>
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
                    </div>
                </div>
            </div>
            <!-- END MAIN CONTENT-->
            
            <!-- checkoutModal -->
            <div id="checkoutModal" class="modal fade" role="dialog">
                <div class="modal-dialog modal-lg">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" align="center"><i class="fa fa-eye"></i> Review Your Order</h4>
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
                            <br/>
                            <br/>
                            <br/>
                            Order Details: <br/>
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
                            <button  type="button" class="btn btn-warning" ><i class="fa fa-print"></i> Print</button>
                            <button data-toggle="modal" data-target="#messageModal" ng-click="checkOut()" type="button" class="btn btn-success" data-dismiss="modal"><i class="fa fa-check"></i> Confirm</button>
                            <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times"></i> Cancel</button>
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
                            <h1 style="color: green; text-align: center">
                                Order Complete Successfully
                            </h1>
                        </div>
                        <div class="modal-footer">
                            <a href="<%= request.getContextPath()%>" class="btn btn-default">Close</a>
                        </div>
                    </div>

                </div>
            </div>
            
            <!-- END PAGE CONTAINER-->
        </div>

    </div>

    </body>
</html>
