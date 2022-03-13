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

                <div class="head">
                    <div class="mleft">
                        <nav>
                            <a class="btn" <c:if test="${id eq 0}"> style="background-color:paleturquoise;
                           color: black;"</c:if>
                           href="Menu">All Dishes</a>
                        </nav>
                    <c:forEach items="${listC}" var="o">
                        <nav>
                            <a class="btn" <c:if test="${id eq o.getId()}"> style="background-color:paleturquoise;
                               color: black;"</c:if>
                                href="Menu?id=${o.getId()}">${o.getName()}</a>
                        </nav>
                    </c:forEach>

                </div>
                <div class="mright">
                    <c:forEach items="${list}" var="o">
                        <div class="adish">
                            <img class="left col"src="${o.getImage()}" alt="">
                            <div class="right col">
                                <h3>${o.getPrice()}</h3>
                                <p>${o.getName()}</p>
                                <p>${o.getDescription()}</p>
                            </div>
                        </div>
                    </c:forEach>
                </div>

            </div>

            <jsp:include page="Footer.jsp"></jsp:include>
        </div>
    </body>
</html>