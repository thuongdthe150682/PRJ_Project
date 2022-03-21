
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ManageDish.jsp</title>
        <link href="Css/home.css" rel="stylesheet" type="text/css"/>
        <link href="Css/addOrder.css" rel="stylesheet" type="text/css"/>
        <link href="Css/Manage.css" rel="stylesheet" type="text/css"/>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    </head>
    <body>
        <jsp:include page="Header.jsp"></jsp:include>
        <jsp:include page="Tables.jsp"></jsp:include>
            <div class="Aorder">

                <h5 class="add_table">Search</h5>
                <form action="UpdateDish" method="get">

                <c:forEach items="${list}" var="o">
                    <c:if test="${o.getList() != null}">
                        <h6 style="font-size: 0.6em; color: #555;" class="cate">${o.getName()}</h6>
                        <table class="table" style="margin-left: 5%;">
                            <tbody>
                                <c:forEach  var="d" items="${o.getList()}">
                                    <tr>
                                        <td style="text-align: left;margin-left: 1em;">${d.getId()}.${d.getName()}</td>
                                        <td>${d.getPrice()}$</td>
                                        <td>
                                            <c:if test="${sessionScope.acc.isManager == 1}">
                                            <a href="UpdateDish?id=${d.getId()}&task=update"><i class='fas fa-pen' style="color: green;"></i></a>
                                            <a href="UpdateDish?id=${d.getId()}&task=delete"
                                               onclick="return confirm('Are you sure you want to Delete this Dish?');"><i class='fas fa-trash-alt' style="color: crimson;"></i></a>
                                            </c:if>
                                            <c:if test="${sessionScope.acc.isManager == 0}">
                                            <a href="UpdateDish?id=${d.getId()}&task=see"><i class='far fa-eye' style="color: yellowgreen;"></i></a>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>

                            </tbody>
                        </table>
                        <br>
                    </c:if>
                </c:forEach>
                <h6 class="cate" style="color: #888;">Paused Dishes</h6>
                <c:forEach items="${listP}" var="o">
                    
                    <c:if test="${o.getList().size()>0}">
                        <h6 style="font-size: 0.6em; color: #555;" class="cate">${o.getName()}</h6>
                        <table class="table pause" style="margin-left: 5%;">
                            <tbody>
                                <c:forEach  var="d" items="${o.getList()}">
                                    <tr>
                                        <td style="text-align: left;margin-left: 1em; width: 30%;">${d.getId()}.${d.getName()}</td>
                                        <td>${d.getPrice()}$</td>
                                        <td>
                                            <c:if test="${sessionScope.acc.isManager == 1}">
                                            <a href="UpdateDish?id=${d.getId()}&task=update"><i class='fas fa-pen' style="color: green;"></i></a>
                                            <a href="UpdateDish?id=${d.getId()}&task=delete"
                                               onclick="return confirm('Are you sure you want to Delete this Dish?');"><i class='fas fa-trash-alt' style="color: crimson;"></i></a>
                                            </c:if>
                                            <c:if test="${sessionScope.acc.isManager == 0}">
                                            <a href="UpdateDish?id=${d.getId()}&task=see"><i class='far fa-eye' style="color: yellowgreen;"></i></a>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>

                            </tbody>
                        </table>
                        <br>
                    </c:if>
                </c:forEach>
                <br>
                <input class ="tablee" type="text" name="task" value="add" readonly />
                <button class="btn" type="submit" >Add a dish</button>   
            </form>
        </div>
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>

