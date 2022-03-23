

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<c:if test="${task == 'update' || task =='add'}">
    <form action="UpdateAccount" method="post">
        <div style="text-align: center;font-size: 1em;">
            UserName:<input style="border: pink;font-size: 1em;" type="text"value="${account.getUsername()}" name="user"
                            ${task=='update'? "readonly":""}></td>
            <br>
            <br>
            Password:<input style="border: pink;font-size: 1em;" type="text" value="${account.getPassword()}" name="pass">
            <br>
            <br>
            <select style="border: pink;font-size: 1em;" name="isManager">
                <option style="background-color: papayawhip;" value="1" ${account.getIsManager() == 1? "selected":""}>Manager</option>
                <option style="background-color: papayawhip;" value="0" ${account.getIsManager() == 0? "selected":""}>Staff</option>
            </select>

            <p style="color: crimson;"> ${mess}</p>
            <c:if test="${task == 'update'}">
                <input class ="tablee" type="text" name="task" value="update" readonly />
                <button class="buttonn2" type="submit" >Update</button> 
                <a href="Account" class="closee">Close</a>
            </c:if> 
            <c:if test="${task == 'add'}">
                <input class ="tablee" type="text" name="task" value="add" readonly />
                <button class="buttonn2" type="submit" >Add Account</button>
                <a href="Account" class="closee">Close</a>
            </c:if>
        </div>
    </form>
</c:if>




