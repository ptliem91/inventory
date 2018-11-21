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
        <title>Product List</title>
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
				            
                            <div class="col-lg-3">
                            
                                <div class="au-card recent-report">
                                	<h3 class="title-2 m-b-20"><i class="fa fa-chart-bar"></i> Insert Product</h3>
                                        <div class="student_form col-md-12">
							            	<div class="panel panel-primary">
							                    <div class="panel-body">
							                        <c:if test="${product.pid != null}">
							                            <form action="<%= request.getContextPath()%>/updateProduct" method="post">
								                            </c:if>
								                            <c:if test="${product.pid == null}">
								                                <form action="<%= request.getContextPath()%>/addProduct" method="post">
								                                </c:if>
								                                <div class="form-group">
								                                    <label for="pid">Product ID: </label>
								                                    <input value="${product.pid}" name="pid" type="text" class="form-control" id="pid" <c:if test="${product.pid == null}">disabled="1"</c:if>" readonly="1">
								                                    </div>
								
								                                    <div class="form-group">
								                                        <label for="pname">Product Name:</label>
								                                        <input value="${product.pname}" name="pname" type="text" class="form-control" id="pname">
								                                </div>
								
								                                <div class="form-group">
								                                    <label for="price">Price:</label>
								                                    <input value="${product.price}" name="price" type="text" class="form-control" id="price">
								                                </div>
								                                <div class="form-group">
								                                    <label for="age">Quantity:</label>
								                                    <input value="${product.qty}" name="qty" type="text" class="form-control" id="qty">
								                                </div>
								
								                                <c:if test="${product.pid != null}">
								                                    <button type="submit" class="btn btn-warning"><i class="fa fa-edit"></i> Update</button>
								                                    <a href="<%= request.getContextPath()%>/product" class="btn btn-primary pull-right"><i class="fa fa-user-plus"></i> New</a>
								                                </c:if>
								
								                                <c:if test="${product.pid == null}">
								                                    <button type="submit" class="btn btn-success"><i class="fa fa-send"></i> Submit</button>
								                                </c:if>								
								                         </form>						
							                    </div>
							                    <div class="panel-footer">
							
							                    </div>
							                </div>
							            </div>
                                </div>
                            </div>                            
                            
                            <div class="col-lg-9">
                                <div class="au-card">
                                	<h3 class="title-2 m-b-20">
                                    	<i class="zmdi zmdi-account-calendar"></i> Product List
                                    </h3>
                                    <div class="table-responsive table--no-card m-b-30">                                    	                     
                                        <table class="table table-borderless table-striped table-earning">
						                    <thead>
						                        <tr>
						                            <th>Id</th>
						                            <th>Product Name</th>
						                            <th>Price</th>
						                            <th>Quantity</th>
						                            <th colspan="2" class="text-center">Action</th>
						                        </tr>
						                    </thead>
						                    <tbody>
						                        <c:forEach var="row" items="${products}">
						                            <tr>
						                                <td>${row.pid}</td>
						                                <td>${row.pname}</td>
						                                <td>${row.price}</td>
						                                <td>${row.qty}</td>
						                                <td>
						                                    <a href="<%= request.getContextPath()%>/editProduct/${row.pid}" class="btn btn-warning"><i class="fa fa-edit"></i> Edit</a>
						                                </td>
						                                <td>
						                                    <a id="del_${row.pid}" class="btn btn-danger"><i class="fa fa-trash"></i> Delete</a>
						                                </td>
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
                </div>
            </div>
            <!-- END MAIN CONTENT-->
            
            <!-- END PAGE CONTAINER-->
        </div>

    </div>
    
    <script type="text/javascript">
		$(document).on("click", "[id^='del_']", function() {
			let id = $(this).attr('id').split('_')[1];
				
			bootbox.confirm("Are you want to delete this item ?", function(result) {
				if (result) {
					window.location.href = "<%= request.getContextPath()%>/deleteProduct/" + id;
				}
			});
		});
	</script>

    </body>
</html>
