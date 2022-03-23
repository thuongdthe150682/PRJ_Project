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
    <style>
        .buttonn{
            background-color: crimson;
            color: white;
            font-size: 1em;
        }
        .buttonn:hover{
            background-color: darkred;
        }
    </style>
    <body>
        <div class="container">
            <jsp:include page="Header.jsp"></jsp:include>
            <jsp:include page="Tables.jsp"></jsp:include>
            <div style="margin-left: 5%; color: #444;font-weight: lighter;">
                <div>
                    <h6 style="font-size: 1.5em;margin-bottom: 1em;margin-top: 1em;">${user}</h6>
                    ${message}
                    <c:if test="${task == 'add'}"><p style="color: crimson;">User has no information.</p></c:if>
                    <form action="StaffManage" method="post">
                        Username:<input style="display: block;width: 90%; font-size: 1em;" type="text" value="${user}" name="user" readonly><br>
                        FirstName:<input style="display: block;width: 90%;font-size: 1em;" type="text" value="${staff.getFirstName()}" name="firstname"><br>
                        LastName:<input style="display: block;width: 90%;font-size: 1em;" type="text" value="${staff.getLastName()}" name="lastname"><br>
                        DOB:<input style="display: block;width: 90%;font-size: 1em;" type="date" value="${staff.getDOB()}" name="dob"><br>
                        <div class="form-group">
                            <label for="Address">Address:</label>
                            <br>
                            <textarea style="width: 90%;height: 30px; font-size: 1em; " class="form-control" id="Address" rows="3" name="address">${staff.getAddress()}</textarea>
                        </div>
                        Phone: <input style="display: block;width: 90%;font-size: 0.9em;" type="text" value="${staff.getPhone()}" name="phone"><br>
                        <input class="tablee" name="task" type="text" value="${task}" readonly>
                        <p style="color: crimson">${mess}</p>
                        <c:if test="${task=='update'}">
                            <button style="margin-left: 40%;margin-right: 2px" class="buttonn" type="submit">Update</button>
                            <a class="close buttonn" style="margin-left: 0;padding: 0.08em 0.5em 0.2em 0.5em;"  href="DeleteStaff?user=${staff.getUserName()}"
                               onclick="return confirm('Are you sure you want to Delete this Account?');">Delete</a>
                        </c:if>
                        <c:if test="${task=='add'}">
                            <button style="margin-left: 45%;" class="buttonn" type="submit">Add</button>
                        </c:if>
                            <br> 
                    </form>
                </div>
            </div>

            <jsp:include page="Footer.jsp"></jsp:include>
        </div>
    </body>
</html>