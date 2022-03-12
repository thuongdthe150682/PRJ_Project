

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:useBean id="dish"  class="DAO.DishDAO" scope="request"></jsp:useBean>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chop Chop Restaurant</title>
        <link href="Css/home.css" rel="stylesheet" type="text/css"/>
        <link href="Css/addOrder.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="Header.jsp"></jsp:include>
            <div class="Aorder">
                <h5>Add ${table.getName()}</h5>
            <form action="AddOrder" method="post">
                <c:forEach items="${listC}" var="o">
                    <h6>${o.getName()}</h6>
                    
                </c:forEach>
                <button type="submit" >
                    Add</button>   
            </form>
        </div>


        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>
