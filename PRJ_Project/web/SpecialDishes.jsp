
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<html>
    <head lang="en">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Special Dishes</title>
        <link href="Css/home.css" rel="stylesheet" type="text/css"/>
        <link href="Css/Menu.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>
        <div class="container">
           <jsp:include page="Header.jsp"></jsp:include>
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