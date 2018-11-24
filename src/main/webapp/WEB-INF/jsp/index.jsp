<%-- 
    Document   : index
    Created on : Sep 13, 2017, 11:08:17 AM
    Author     : cyclingbd007
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="myApp">
<head>
<%@ include file="header.jsp"%>

<link rel="stylesheet" href="/resources/css/login.css">

<title>Home</title>

</head>
<body ng-controller="appCtrl">

	<div class="container mt-2">
		<div class="login-form">
			<div class="main-div">
				<a href="<%=request.getContextPath()%>/">
					<h2>Perfect Perfume</h2>
				</a>
				<p></p>
				<c:if test="${em != null}">
					<div class="alert alert-danger alert-dismissable">
						<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
						<strong>Error!</strong> ${em}
					</div>
				</c:if>

				<form id="Login" action="<%=request.getContextPath()%>/loginCheck"
					method="post">

					<div class="form-group">

						<input type="text" class="form-control" id="userName"
							name="userName" placeholder="Username">

					</div>

					<div class="form-group">

						<input type="password" class="form-control" id="password"
							name="password" placeholder="Password">

					</div>
					<p></p>
					<button type="submit" class="btn btn-primary">Login</button>
				</form>
			</div>
		</div>
	</div>

	<div class="col-md-12" style="text-align: center; margin-top: 60px;">
		&copy; Liem Pham || <a href="https://www.youtube.com/" target="_blank">Youtube</a>
		|| <a href="http://www.facebook.com/agaubun" target="_blank">Facebook</a>
	</div>

	<%@ include file="footer.jsp"%>

</body>
</html>
