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
<title>Home</title>

</head>
<body ng-controller="appCtrl">
	<div class="page-wrapper">
		<div class="page-content--bge5">
			<div class="container">
				<div class="login-wrap">
					<div class="login-content">
						<div class="login-logo">
							<a href="<%=request.getContextPath()%>/">
								<h1 style="color: #ff4dd2;">Perfect Perfume</h1>
							</a>
						</div>

						<div class="panel-body">
							<c:if test="${em != null}">
								<div class="alert alert-danger alert-dismissable">
									<a href="#" class="close" data-dismiss="alert"
										aria-label="close">&times;</a> <strong>Error!</strong> ${em}
								</div>
							</c:if>

							<div class="login-form">
								<form action="<%=request.getContextPath()%>/loginCheck"
									method="post">
									<div class="form-group">
										<label for="userName">User Name:</label>
										<input name="userName" class="form-control" id="userName" type="text" placeholder="Username"/>
									</div>
									<div class="form-group">
										<label for="password">Password:</label>
										<input name="password" class="form-control" id="password" type="password" placeholder="Password"/>
									</div>
									<button class="au-btn au-btn--block au-btn--green m-b-20" type="submit">sign in</button>
								</form>
							</div>
						</div>

						<div class="col-md-12" style="text-align: center; margin-top: 60px;">
							&copy; Liem Pham 
							|| <a href="https://www.youtube.com/"	target="_blank">Youtube</a> 
							|| <a href="http://www.facebook.com/agaubun" target="_blank">Facebook</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
