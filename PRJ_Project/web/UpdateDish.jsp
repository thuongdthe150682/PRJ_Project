<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head lang="en">
        <meta charset="utf-8">
        <title>Reservation</title>
        <link href="Css/home.css" rel="stylesheet" type="text/css"/>
        <link href="Css/ManageDish.css" rel="stylesheet" type="text/css"/>
        <link href="Css/Manage.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <jsp:include page="Header.jsp"></jsp:include>
                <div class="nav-bar">
                    <nav>
                        <a href="Table" ${checked eq "order"? "id='checked'":""}>Manage Orders</a>
                    <a href="DishManage" ${checked eq "dish"? "id='checked'":""}>Manage Dishes</a>
                    <a href="Reserve" ${checked eq "reserve"? "id='checked'":""}>Manage Reservation</a>
                    <a href="" ${checked eq "revenue"? "id='checked'":""}>Manage Revenue</a>
                </nav>
            </div>
            <div class="form">
                <div class="pform">
                    <h6>${task} Dish: ${dish.getId()}</h6>
                    <form action="UpdateDish" method="post">
                        <c:if test="${task !='add'}">
                            Id:<input type="text" value="${dish.getId()}" name="id" readonly ><br>
                        </c:if>
                        Name:<input type="text" value="${dish.getName()}" name="name" ${task=='see' ? "readonly":""}><br>
                        Description:<input class="area" type="textbox" 
                                           value="${dish.getDescription()}" name="description" ${task=='see' ? "readonly":""}><br>
                        Price:<input type="number" value="${dish.getPrice()}" name="price"${task=='see' ? "readonly":""}><br>
                        Image:<input type="text" value="${dish.getImage()}" name="image" ${task=='see' ? "readonly":""}><br>
                        Status:<select name="Status" ${task=='see' ? "readonly":""}>
                            <option value="1" ${dish.isStatus()=='true'?"selected":""}>selling</option>
                            <option value="0" ${dish.isStatus()=='false'?"selected":""}>pause</option>
                        </select>
                        <br>
                        <br>
                        Category:<select name="category" ${task=='see' ? "readonly":""}>
                            <c:forEach items="${listC}" var="o">
                                <option value="${o.getId()}" ${o.getId() == dish.getCategory_Id()?"selected":""}> 
                                    ${o.getName()}
                                </option>
                            </c:forEach>
                        </select>
                        <br>
                        <p style="color: crimson">${mess}</p>
                        <br>
                        <input class="tablee" name="task" type="text" value="${task}" readonly>
                        <c:if test="${task=='update'}">
                            <button class="button" type="submit">Update</button>
                        </c:if>
                        <c:if test="${task=='add'}">
                            <button class="button" type="submit">Add</button>
                        </c:if>
                    </form>
                </div>
            </div>

            <jsp:include page="Footer.jsp"></jsp:include>
        </div>
    </body>
</html>