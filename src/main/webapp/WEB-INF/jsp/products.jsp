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
    
    <body>
    	<div id="wrapper">
	        <!-- MENU SIDEBAR-->
	        <%@ include file = "menu.jsp" %>
	        <!-- END MENU SIDEBAR-->
	
	        <!-- PAGE CONTAINER-->
	        <div class="page-wrapper">
	        	<div class="row">
	                <div class="col-lg-12">
	                    <h1 class="page-header">Products</h1>
	                </div>
	            </div>
	
	            <!-- MAIN CONTENT-->  
	            <div class="row">
                        	<div class="col-lg-4">
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
				            
                            <div class="col-lg-3">                            
                                <div class="panel panel-yellow">
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
                                <div class="panel panel-green">
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
						                                    <a id="del_${row.pid}" class="btn btn-danger" href=""><i class="fa fa-trash"></i> Delete</a>
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
