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
        <title>Home</title>
    </head>
    
    <body ng-controller="appCtrl" class="bg02">

	    <div class="page-wrapper">
	
	        <!-- MENU SIDEBAR-->
	        <%@ include file = "menu.jsp" %>
	        <!-- END MENU SIDEBAR-->
	
	        <!-- PAGE CONTAINER-->
	        
	    </div>
    
    <%@ include file = "footer.jsp" %>

    </body>
</html>
