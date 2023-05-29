<%-- 
    Document   : ManageShift
    Created on : May 29, 2023, 12:58:27 PM
    Author     : Vuong
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <table border="1">
                <thead>
                    <tr>
                        <th>ShiftID</th>
                        <th>StartTime ID</th>
                        <th>EndTime </th>
                        <th>ShiftDate</th>
                        <th>CoefSalary</th>
                        <th>RoleEmployee</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach  items="${shiftList}" var="shift"> 
                    
                        <tr>
                            
                            <td>${shift.ShiftID}</td>
                            <td>${shift.StartTime}</td>
                            <td>${shift.EndTime}</td>
                            <td>${shift.ShiftDate}</td>
                            <td>${shift.CoefSalary}</td>
                            <td>${shift.RoleEmployee}</td>
                           
                            
                        </tr>
                   
                        </c:forEach>
                </tbody>
              </table>
        
                

    </body>
</html>
