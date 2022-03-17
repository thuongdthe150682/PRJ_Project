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
                    <input type="date" name="date" value="${search}">
                <button type="submit">Search</button>
            </form>
                    <h5>Orders</h5>
                    <c:if test="${listY.size() == 0 && listF.size()==0 }">No Order found.</c:if>
                    <c:if test="${listY != null}">
                        <c:if test="${listY.size() > 0}">On-going</c:if> 
                        <c:forEach items="${listY}" var="o" >
                            <table class="table" style="margin-left: 5%;">
                                <c:if test="${o.getListOD()!=null}">
                                    <tbody>
                                        <c:forEach items="${o.getListOD()}" var="l">
                                            <tr>
                                                <td style="margin-left: 0.5em;">${l.getDishId()}.${l.getName()}</td>
                                                <td>${l.getPrice()}</td>
                                                <td>${l.getQuantity()}</td>
                                                <td>${l.getPayment()}$</td>
                                            </tr>
                                        </c:forEach>

                                        <tr>
                                            <td></td>  
                                            <td></td> 
                                            <td>Total</td> 
                                            <td>${o.getTotal()}$</td> 
                                        </tr>
                                    </c:if>
                                </tbody>
                            </table>
                        </c:forEach>
                    </c:if>

                    <c:if test="${listF != null}">
                        <c:if test="${listF.size() > 0}">Finished</c:if> 
                        <c:forEach items="${listF}" var="o" >
                            <table class="table" style="margin-left: 5%;">
                                <c:if test="${o.getListOD()!=null}">
                                    <tbody>
                                        <c:forEach items="${o.getListOD()}" var="l">
                                            <tr>
                                                <td style="margin-left: 0.5em;">${l.getDishId()}.${l.getName()}</td>
                                                <td>${l.getPrice()}</td>
                                                <td>${l.getQuantity()}</td>
                                                <td>${l.getPayment()}$</td>
                                            </tr>
                                        </c:forEach>

                                        <tr>
                                            <td></td>  
                                            <td></td> 
                                            <td>Total</td> 
                                            <td>${o.getTotal()}$</td> 
                                        </tr>
                                    </c:if>
                                </tbody>
                            </table>
                        </c:forEach>
                    </c:if>

                </div>
            </div>
            <jsp:include page="Footer.jsp"></jsp:include>
        </div>
    </body>
</html>