<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head lang="en">
        <meta charset="utf-8">
        <title>Manage Dish</title>
        <link href="Css/home.css" rel="stylesheet" type="text/css"/>
        <link href="Css/ManageDish.css" rel="stylesheet" type="text/css"/>
        <link href="Css/Manage.css" rel="stylesheet" type="text/css"/>
    </head>
    <style>
        
        .buttonn{
            text-decoration: none;
            color: white;
            background-color: crimson;
            font-size: 1em;
            margin-top: 3px;
            border-color: crimson;
            margin-bottom: 1em;
            margin-left: 30%;
            font-size: 1em;
            padding: 0.5em 1em 0.5em 1em;
            
        }
        .buttonn:hover{
            background-color: brown;
            border-color: brown;
        }
    </style>
    <body>
        <div class="container">
            <jsp:include page="Header.jsp"></jsp:include>
            <jsp:include page="Tables.jsp"></jsp:include>
            <div >
                    <div style="margin-left: 20%; font-size: 0.8em;">
                        <h6 style="font-size: 1.3em;margin-bottom: 0.7em;margin-top: 1em;">${task} Dish: ${dish.getId()}</h6>
                    <form action="UpdateDish" method="post">
                        <c:if test="${task !='add'}">
                            Id:<input style="display: block;width: 60%; font-size: 1em; " type="text" value="${dish.getId()}" name="id" readonly ><br>
                        </c:if>
                        Name:<input style="display: block;width: 60%;font-size: 1em;" type="text" value="${dish.getName()}" name="name" ${task=='see' ? "readonly":""}><br>
                        <div class="form-group">
                            <label for="description">Description:</label>
                            <br>
                            <textarea style="width: 60%;height: 50px;font-size: 1em;" class="form-control" id="description" rows="3" name="description">${dish.getDescription()}</textarea>
                        </div>

                        Price:<input style="display: block;width: 60%;font-size: 1em;" type="number" value="${dish.getPrice()}" name="price"${task=='see' ? "readonly":""}><br>
                        Image:<input style="display: block;width: 60%;font-size: 1em;" type="text" value="${dish.getImage()}" name="image" ${task=='see' ? "readonly":""}><br>
                        Status:<select style="display: block;width: 60%;font-size: 1em;" name="Status" ${task=='see' ? "readonly":""}>
                            <option value="1" ${dish.isStatus()=='true'?"selected":""}>selling</option>
                            <option value="0" ${dish.isStatus()=='false'?"selected":""}>pause</option>
                        </select>
                        <br>
                        Category:<select style="font-size: 1em;" name="category" ${task=='see' ? "readonly":""}>
                            <c:forEach items="${listC}" var="o">
                                <option value="${o.getId()}" ${o.getId() == dish.getCategory_Id()?"selected":""}> 
                                    ${o.getName()}
                                </option>
                            </c:forEach>
                        </select>
                        <p style="color: crimson">${mess}</p>
                        <input class="tablee" name="task" type="text" value="${task}" readonly>
                        <c:if test="${task=='update'}">
                            <button class="buttonn" type="submit">Update</button>
                        </c:if>
                        <c:if test="${task=='add'}">
                            <button class="buttonn" type="submit">Add</button>
                        </c:if>
                    </form>
                </div>
            </div>

            <jsp:include page="Footer.jsp"></jsp:include>
        </div>
        <script src="Jss/bootstrap.min.js" type="text/javascript"></script>
        <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>