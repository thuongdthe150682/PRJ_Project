
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<html>
    <head lang="en">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chop Chop Restaurant</title>
        <link href="Css/home.css" rel="stylesheet" type="text/css"/>
        <link href="Css/Menu.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>
        <div class="container">
            <jsp:include page="Header.jsp"></jsp:include>
                <div class="adish">
                    <div class="left col">
                        <div>
                            <h2>We Love <br>Delicious Foods!</h2>
                            <div class="pleft">
                                <a class="btn" href="Menu" role="button">Explore Menu</a>
                                <p>Call to order: 0582 642 654</p>
                            </div>

                            <table>
                                <tr>
                                    <td>Fast Delivery</td>
                                    <td>Fresh Food</td>
                                    <td>24/7 Support</td>
                                </tr>
                            </table>
                        </div>
                    </div>

                    <div class="right col">
                        <img src="Images/ban_ghe.jpg" alt="">
                    </div>
                </div>
                <h3 id="newfood" style="color: palevioletred; text-align: center;
                    font-family: serif; font-size: 2em;">New foods</h3>
                <div class="specialdish">
                <c:forEach items="${list}" var="o">
                    <div class="adish">
                        <img class="left col" src="${o.getImage()}" alt="">
                        <div class="right col">
                            <h3>${o.getPrice()}$</h3>
                            <p>${o.getName()}</p>
                            <p>${o.getDescription()}</p>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <jsp:include page="Footer.jsp"></jsp:include>
        </div>
    </body>
</html>