<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<html>
    <head lang="en">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chop Chop Restaurant</title>
        <link href="Css/home.css" rel="stylesheet" type="text/css"/>
        <link href="Css/Manage.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>
        <div class="container">
            <jsp:include page="Header.jsp"></jsp:include>
                <div class="nav-bar">
                    <nav>
                        <a href="" id="checked">Manage Dishes</a>
                        <a href="">Manage Orders</a>
                        <a href="">Manage Reservation</a>
                        <a href="">Manage Revenue</a>

                    </nav>
                </div>

                <table>
                    <tr>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Total</th>
                    </tr>
                    <tr>
                        <th>Name</th>
                        <th>Price</th>
                        <td>Quantity</td>
                        <td>Total</td>
                    </tr>
                </table>

            <jsp:include page="Footer.jsp"></jsp:include>
        </div>
    </body>
</html>