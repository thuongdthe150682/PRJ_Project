
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FixOrder.jsp</title>
        <link href="Css/home.css" rel="stylesheet" type="text/css"/>
        <link href="Css/addOrder.css" rel="stylesheet" type="text/css"/>

    </head>
    <style>
        .a{
            background-color: greenyellow;
            margin-top: 2em;;
        }
        .a:hover{
            background-color: yellow;
        }
        td{
            padding: 0.1em 0.5em 0.1em 0.5em;
        }
        input{
            margin-top: 0;
            border: none;
            background-color: inherit;
            font-size: 0.7em;
        }
    </style>
    <body>
        <jsp:include page="Header.jsp"></jsp:include>
            <br>
            <a class="button a" style=" text-decoration: none; color: black;margin-left: 5%;" href="Manage">Back</a>
            <div class="Aorder">
                <h5 class="add_table">${table.getName()} Order:${orderId}</h5>
            <form action="ConfirmFixOrder" method="post">
                <p style="margin-left: 5%;">Paid: <select style="font-size: 0.7em; background-color: papayawhip" name="paid">
                    <option value="no" checked>Not yet</option>
                    <option value="yes">Done</option>
                    </select>
                <input class ="tablee" type="text" name="table" value="${table.getId()}" readonly />
                <input class ="tablee" type="text" name="orderId" value="${orderId}" readonly />
                <input class ="tablee" type="text" name="sid" value="${sid}" readonly />
                <input class ="tablee" type="text" name="price" value="${price}" readonly />
                <input class ="tablee" type="text" name="quantity" value="${quantity}" readonly />
                <button class="button" href="" style="font-size: 0.7em;padding: 0.5em 1em 0.5em 1em;"  type="submit" name="save" value="save" >Save</button> 
            </p>
            </form>   
                "${sid}"<br>
                "${price}"<br>
                "${quantity}"
            <form action="FixOrder" method="post">
                <table class="table" style="margin-left: 5%;">
                    <tbody>
                        <c:forEach var="i" begin="0" end="${listDish.size()-1}" >
                            <tr>
                                <td><input style="height: 1.5em;margin-top: 0.2em;" type="checkbox" name="chose" value="${listDish.get(i).getId()}" checked /></td>
                                <td style="margin-left: 0.5em;">${listDish.get(i).getId()}.${listDish.get(i).getName()}</td>
                                <td><input  type="number" min="0" name="price" value="${listDish.get(i).getPrice()}" /></td>
                                <td><input  type="number" min="0" name="quantity" value="${listDish.get(i).getQuantity()}" /></td>
                                <td>${payment[i]}$</td>
<!--                                <td style="margin-left: 0.5em;">${list.get(i).getDishId()}.${listDish.get(i).getName()}</td>
                                <td>${list.get(i).getPrice()}</td>
                                <td>${list.get(i).getQuantity()}</td>
                                <td>${payment[i]}$</td>-->
                            </tr>
                        </c:forEach>
                        <tr>
                            <td></td>  
                            <td></td> 
                            <td></td> 
                            <td>Total</td> 
                            <td>${total}$</td> 
                        </tr>


                    </tbody>
                    <!--                    <tbody>
                    <c:forEach var="i" begin="0" end="${listDish.size()-1}" >
                        <tr>
                            <td><input class ="a" type="checkbox" checked name="chose" value="${listDish.get(i).getId()}" /></td>
                            <td style="margin-left: 0.5em;">${listDish.get(i).getId()}.${listDish.get(i).getName()}</td>
                            <td>${listD.get(i).getPrice()}</td>
                            <td>${listD.get(i).getQuantity()}</td>
                        </tr>
                    </c:forEach>
                </tbody>-->
                </table>



                <h5 class="add_table">Add:</h5>
                <c:forEach items="${listOtherDishes}" var="o">
                    <c:if test="${o.getList() != null}">
                        <h6 class="cate">${o.getName()}</h6>
                        <table class="table" style="margin-left: 5%;">
                            <tbody>
                                <c:forEach  var="d" items="${o.getList()}">
                                    <tr>
                                        <td><input style="height: 1.5em;margin-top: 0.2em;" type="checkbox" name="chose" value="${d.getId()}" /></td>
                                        <td style="margin-left: 0.5em;">${d.getId()}.${d.getName()}</td>
                                        <td><input type="number" min="0" name="price" value="${d.getPrice()}" /></td>
                                        <td><input type="number" min="0" name="quantity" value="1" /></td>


<!--                                        <td><input class ="a" type="checkbox" name="chosee" value="${d.getId()}" /></td>
<td style="margin-left: 0.5em;">${d.getId()}.${d.getName()}</td>
<td>${d.getPrice()}$</td>-->
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <br>
                    </c:if>
                </c:forEach>
                <br>
                <input class ="tablee" type="text" name="table" value="${table.getId()}" readonly />
                <input class ="tablee" type="text" name="orderId" value="${orderId}" readonly />
                <input class ="tablee" type="text" name="lishDish" value="${lishDish}" readonly />
                <input class ="tablee" type="text" name="listOtherDishes" value="${listOtherDishes}" readonly />
                <button class="btn" type="submit" >Add/Delete Dishes</button>   
            </form>
        </div>
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>

