<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head lang="en">
        <meta charset="utf-8">
        <title>Staff</title>
        <link href="Css/home.css" rel="stylesheet" type="text/css"/>
        <link href="Css/ManageDish.css" rel="stylesheet" type="text/css"/>
        <link href="Css/Manage.css" rel="stylesheet" type="text/css"/>
        <link href="Css/confirmOrder.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <jsp:include page="Header.jsp"></jsp:include>
                <div class="nav-bar">
                    <nav>
                        <a href="Table" ${checked eq "order"? "id='checked'":""}>Manage Orders</a>
                    <a href="DishManage" ${checked eq "dish"? "id='checked'":""}>Manage Dishes</a>
                    <a href="Reserve" ${checked eq "reserve"? "id='checked'":""}>Manage Reservation</a>
                    <a href="Account" ${checked eq "account"? "id='checked'":""}>Manage Account</a>
                    <a href="" ${checked eq "revenue"? "id='checked'":""}>Manage Revenue</a>
                </nav>
            </div>
            <div class="form">
                <div class="pform">
                    <h6>${user}</h6>
                    ${message}
                    <c:if test="${task == 'add'}"><p style="color: crimson;">User has no information.</p></c:if>
                    <form action="StaffManage" method="post">
                        Username:<input type="text" value="${user}" name="user" readonly><br>
                        FirstName:<input type="text" value="${staff.getFirstName()}" name="firstname"><br>
                        LastName:<input type="text" value="${staff.getLastName()}" name="lastname"><br>
                        DOB:<input type="date" value="${staff.getDOB()}" name="dob"><br>
                        Address<input type="text" value="${staff.getAddress()}" name="address"><br>
                        Phone<input type="text" value="${staff.getPhone()}" name="phone"><br>
                        <input class="tablee" name="task" type="text" value="${task}" readonly>
                        <p style="color: crimson">${mess}</p>
                        <br>
                        <c:if test="${task=='update'}">
                            <button class="button" type="submit">Update</button>
                            <a class="close" href="DeleteStaff?user=${staff.getUserName()}"
                               onclick="return confirm('Are you sure you want to Delete this Account?');">Delete</a>
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