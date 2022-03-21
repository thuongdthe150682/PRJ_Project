
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="menu" style="background-color: white;">
    <nav>
        <a  href="Home" ${active eq "home"? "id='active'":""}>Home</a>
        <a href="Menu?all=true?page=1" ${active eq "menu"? "id='active'":""}>Menu</a>
        <a  href="SpecialDishes" ${active eq "specialDishes"? "id='active'":""}>Special Dishes</a>
        <img src="Images/Logoo.png" alt="logo">
        <c:if test="${sessionScope.acc.isManager == 1}">
            <a  href="Manage" ${active eq "manage"? "id='active'":""}>Manage</a>
        </c:if>
        <c:if test="${sessionScope.acc.isManager == 0}">
            <a  href="Table" ${active eq "addOrder"? "id='active'":""}>Add Order</a>
            <a href="DishManage?task=see" ${active eq "dishes"? "id='active'":""}>Dishes</a>
        </c:if>
        <c:if test="${sessionScope.acc != null}">
        </c:if>
        <c:if test="${sessionScope.acc == null}">
            <a href="Reservation" ${active eq "reservation"? "id='active'":""}>Reservation</a>
            <form action="Login" method="post">
                <button class="button"type="submit" >Login</button>
            </form>
        </c:if>
        <c:if test="${sessionScope.acc != null}">
            <a  href="Reserve" ${active eq "Reserve"? "id='active'":""}>Reserve</a>
            <a  href="StaffManage?account=${sessionScope.acc}&task=seeown" style="color: crimson;">${sessionScope.acc.getUsername()}</a>
            <form action="Logout" method="post">
                <button class="button"type="submit" >Logout</button>
            </form>
        </c:if>
    </nav>
</div>
