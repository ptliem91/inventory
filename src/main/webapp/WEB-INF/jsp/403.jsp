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
<title>403 Not Found</title>
</head>

<body class="h-100">
	<div id="container-fluid">
		<div class="row">
			<!-- MENU SIDEBAR-->
			<%@ include file="menu.jsp"%>
			<!-- END MENU SIDEBAR-->

			<!-- PAGE CONTAINER-->
			<main
				class="main-content col-lg-10 col-md-9 col-sm-12 p-0 offset-lg-2 offset-md-3">

			<div class="main-content-container container-fluid px-4">
				<div id="notfound">
					<div class="notfound">
						<div class="notfound-404">
							<h1>404</h1>
						</div>
						<h2>Oops, The Page you are looking for can't be found!</h2>
						<a href="<%=request.getContextPath()%>/home"><span
							class="arrow"></span>Return To Homepage</a>
					</div>
				</div>
			</div>

			<%@ include file="footer_copyright.jsp"%>
			
			</main>
		</div>
	</div>
</body>
</html>
