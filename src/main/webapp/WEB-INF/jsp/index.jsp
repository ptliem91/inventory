<%-- 
    Document   : index
    Created on : Sep 13, 2017, 11:08:17 AM
    Author     : cyclingbd007
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="header.jsp"%>

<link rel="stylesheet" href="/resources/css/login.css">

<title>Home</title>

</head>
<body>
	<div class="container">
	    <div class="row">
	      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
	        <div class="card card-signin my-5">
	          <div class="card-body">
	            <h5 class="card-title text-center">Inventory</h5>
	            
	            <c:if test="${em != null}">
					<div class="alert alert-danger alert-dismissable" style="border-radius: 1.5em">
						<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
						${em}
					</div>
				</c:if>
	            
	            <form id="Login" action="<%=request.getContextPath()%>/loginCheck" method="post">
	              <div class="form-label-group">
	                <input type="text" id="userName" name="userName" class="form-control" placeholder="Username" required autofocus>
	                <label for="userName">Username</label>
	              </div>
	
	              <div class="form-label-group">
	                <input type="password" id="password"  name="password" class="form-control" placeholder="Password" required>
	                <label for="password">Password</label>
	              </div>
	
	              <div class="custom-control custom-checkbox mb-3">
	                <input type="checkbox" class="custom-control-input" id="customCheck1">
	                <label class="custom-control-label" for="customCheck1">Remember password</label>
	              </div>
	              <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">Sign in</button>
	              
	            </form>
	            
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>

	<div class="col-md-12" style="text-align: center; margin-top: 60px;">
		&copy; Liem Pham || <a href="http://www.facebook.com/agaubun" target="_blank">Facebook</a>
	</div>

</body>
</html>
