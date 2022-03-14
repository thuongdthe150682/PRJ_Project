

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<c:if test="${task == 'update' || task =='add'}">
    <form action="UpdateAccount" method="post">
        <table class="table" style="margin-left: 5%;">
            <tr>
                <td>UserName</td>
                <td><input type="text"value="${account.getUsername()}" name="user"
                           ${task=='update'? "readonly":""}></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><input type="text" value="${account.getPassword()}" name="pass"></td>
            </tr>
            <tr>
                <td></td>
                <td><select name="isManager">
                        <option value="1" ${account.getIsManager() == 1? "selected":""}>Manager</option>
                        <option value="0" ${account.getIsManager() == 0? "selected":""}>Staff</option>
                    </select></td>
            </tr>
        </table> 
        <p style="color: crimson;"> ${mess}</p>
        <c:if test="${task == 'update'}">
            <input class ="tablee" type="text" name="task" value="update" readonly />
            <button class="addanA" type="submit" >Update</button> 
            <a href="Account" class="close">Close</a>
        </c:if> 
        <c:if test="${task == 'add'}">
            <input class ="tablee" type="text" name="task" value="add" readonly />
            <button class="addanA" type="submit" >Add Account</button>
            <a href="Account" class="close">Close</a>
        </c:if>
    </form>
</c:if>




