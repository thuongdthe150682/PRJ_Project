<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<html>
    <head lang="en">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Benefit</title>
        <link href="Css/home.css" rel="stylesheet" type="text/css"/>
        <link href="Css/Manage.css" rel="stylesheet" type="text/css"/>
        <link href="Css/addOrder.css" rel="stylesheet" type="text/css"/>
        <style>
            .l{
                margin-top: 3em;
                float: left;
                width: 20%;
                background-color: pink;
            }
            .l img{
                margin: 5%;
                width: 90%;
                height: auto;
                border-image: cross-fade;
            }
            .l .div {
                padding-left: 5%;
                font-size: 0.5em;
            }

            .r{ 
                float: right;
                width: 78%;
            }

        </style>
    </head>

    <body>
        <div class="container">
            <jsp:include page="Header.jsp"></jsp:include>
            <jsp:include page="Tables.jsp"></jsp:include>

                <div class="main">
                    <div class="l">
                        <h6 style="margin-left: 10%;">Best Seller</h6>
                    <c:forEach items="${list}" var="o">
                        <div class="div">
                            <img src="${o.getImage()}" alt="">
                            <div class="div">
                                <h3>${o.getPrice()}$</h3>
                                <p>${o.getName()}</p>
                                <p>${o.getDescription()}</p>
                            </div>
                        </div>
                    </c:forEach>

                </div>
                <div class="r">
                    <form style="margin-left: 5%;margin-top: 3em;" action="Benefit" method="post">
                    <input type="date" name="date" value="${date}">
                    <button class="buttonn" type="submit">Search</button>
            </form>
                    <c:if test="${listO.size() != 0 && listO.size()>0 }">
                            <table class="table" style="margin-left: 5%;">
                                <thead>
                                <th>Order ID</th>
                                <th>Total</th>
                                </thead>
                                <tbody>
                                        <c:forEach items="${listO}" var="o">
                                            <tr>
                                                <td>${o.getId()}</td>
                                                <td>${o.getTotal()}$</td>
                                            </tr>
                                        </c:forEach>

                                            <tr style="background-color: powderblue;">
                                            <td></td> 
                                            <td>${total}$</td> 
                                        </tr>
                                    
                                </tbody>
                            </table>
                    </c:if>
                </div>
            </div>
            <jsp:include page="Footer.jsp"></jsp:include>
        </div>
    </body>
</html>