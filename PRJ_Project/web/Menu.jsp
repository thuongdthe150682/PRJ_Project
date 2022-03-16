<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<html>
    <head lang="en">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu</title>
        <link href="Css/home.css" rel="stylesheet" type="text/css"/>
        <link href="Css/Menu.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>
        <div class="container">
            <jsp:include page="Header.jsp"></jsp:include>
                <div class="OurMenu">
                    <p>Specialties</p>
                    <h1>Our Menu</h1>
                </div>
                <form style="margin-left: 5%;" action="Menu">
                    <input type="text" name="search" value="${search}">
                <button type="submit">Search</button>
            </form>
            <div class="head">
                <div class="mleft">
                    <ul>
                        <li><a <c:if test="${id eq 0}"> style="background-color:paleturquoise;
                                                        color: black;"</c:if>
                                href="Menu?search=${search}">All Dishes</a></li>

                        <c:forEach items="${listC}" var="o">

                            <li> <a  <c:if test="${id eq o.getId()}"> style="background-color:paleturquoise;
                                                                      color: black;"</c:if>
                                    href="Menu?id=${o.getId()}&search=${search}">${o.getName()}</a></li>

                        </c:forEach>
                    </ul>
                </div>
                <div class="mright">
                    <div style="width: 100%;" class="specialdish adish">
                        <c:forEach items="${list}" var="o">
                            <div class="col-12 col-md-6 col-lg-4">
                            <div class="adish col">
                                <img class="left col"src="${o.getImage()}" alt="">
                                <div class="right col">
                                    <h3>${o.getPrice()}$</h3>
                                    <p>${o.getName()}</p>
                                    <p>${o.getDescription()}</p>
                                </div>
                            </div>
                            </div>
                        </c:forEach>
                    </div>
                    <c:if test="${total > 1}">
                        <div class="paging" style="margin-left: 5%;">
                            <c:forEach var = "i" begin = "1" end = "${total}">
                                <a href="Menu?page=${i}&search=${search}&id=${id}"
                                   <c:if test="${page == i}">class="active"</c:if>><b>${i}</b></a> 
                                    </c:forEach>
                            <a href="Menu?search=${search}&all=true&id=${id}"><b>All</b></a>
                        </div>
                    </c:if>
                </div>
            </div>
            <jsp:include page="Footer.jsp"></jsp:include>
        </div>
    </body>
</html>