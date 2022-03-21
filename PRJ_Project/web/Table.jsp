

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="Css/Manage.css" rel="stylesheet" type="text/css"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Order</title>
        <link href="Css/home.css" rel="stylesheet" type="text/css"/>
        <link href="Css/addOrder.css" rel="stylesheet" type="text/css"/>
        <link href="Css/ManageDish.css" rel="stylesheet" type="text/css"/>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    </head>
    <body>
        <jsp:include page="Header.jsp"></jsp:include>

        <jsp:include page="Tables.jsp"></jsp:include>
        <!--<p class="message">${message}</p>-->
        <table class="table">
            <thead>
                <tr>
                    <th>Table ID</th>
                    <th>Name</th>
                    <th>Status</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="o" items="${list}">
                    <tr>
                        <td>${o.getId()}</td>
                        <td>${o.getName()}</td>
                        <c:if test="${o.getStatus()==1}">
                            <td><i  style="color: green" class='far fa-file'></i></td>
                            <td><a href="AddOrder?tableid=${o.getId()}"><i style="color: green" class='fas fa-plus'></i></a></td>
                        </c:if>
                        <c:if test="${o.getStatus()==0}">
                            <td><i  style="color: crimson" class='fas fa-file-alt'></i></i></td>
                            <td><a href="UpdateOrder?tableid=${o.getId()}"><i  style="color: crimson" class='fas fa-edit'></i></a></td>
                        </c:if>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>
