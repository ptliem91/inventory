<%-- 
    Document   : index
    Created on : Sep 13, 2017, 11:08:17 AM
    Author     : cyclingbd007
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
    <body ng-controller="appCtrl">

        <div class="container">

            <div class="col-md-12 header">
                <h1 align="center"><a href="<%= request.getContextPath()%>/">Perfect Perfume Inventory</a></h1>
            </div>          

            <c:if test="${user_id == null}">
                <div class="col-md-4 col-md-offset-4">
                    <div style="margin: 0 auto; width: 100%;">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 align='center'><i class="fa fa-sign-in"></i> Login Here</h4>
                            </div>
                            <div class="panel-body">
                                <c:if test="${em != null}">
                                    <div class="alert alert-danger alert-dismissable fade in">
                                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                        <strong>Error!</strong> ${em}
                                    </div>
                                </c:if>

                                <form action="<%= request.getContextPath()%>/loginCheck" method="post">
                                    <div class="form-group">
                                        <label for="userName">User Name:</label>
                                        <input name="userName" class="form-control" id="userName" type="text"/>
                                    </div>
                                    <div class="form-group">
                                        <label for="password">Password:</label>
                                        <input name="password" class="form-control" id="password" type="password"/>
                                    </div>
                                    <div class="form-group"> 
                                        <button type="submit" class="btn btn-success"><i class="fa fa-sign-in"></i> Login</button>
                                    </div>
                                </form>
                            </div>
                            <div class="panel-footer">
                                <p align="center">Don't have an account? Then click <a href="">Register</a> </p>
                            </div>
                        </div>
                    </div>
                </div>
            </c:if>
  

            <div class="col-md-12" style="text-align: center; margin-top: 60px;">
                &copy; Liem Pham
                || <a href="https://www.youtube.com/" target="_blank">Youtube</a>  || <a href="http://www.facebook.com/agaubun" target="_blank">Facebook</a>
            </div>

        </div>

    </body>
</html>
