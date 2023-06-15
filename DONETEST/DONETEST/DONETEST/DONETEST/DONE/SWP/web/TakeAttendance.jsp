<%@page import="java.util.Calendar"%>
<%@ page import="java.sql.Time" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Take Attendance</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Main CSS -->
        <link rel="stylesheet" type="text/css" href="./css/admin.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <!-- or -->
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
        <!-- Font-icon CSS -->
        <link rel="stylesheet" type="text/css"
              href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
        <title>Điểm danh</title>
        <style>
            body {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 40vh;
                font-family: 'Roboto', sans-serif;
            }

            .container {
                text-align: center;
            }

            h2 {
                margin-bottom: 20px;
            }

            .attendance-button {
                display: inline-block;
                padding: 50px 100x;
                font-size: 20px;
                font-weight: bold;
                text-align: center;
                text-decoration: none;
                cursor: pointer;
                border: none;
                border-radius: 5px;
                background-color: #4CAF50;
                color: #ffffff;
                transition: background-color 0.3s ease;
            }

            .attendance-button:hover {
                background-color: #45a049;
            }

            input[type="button"] {
                display: none;
            }
        </style>
        <jsp:include page="headerSales.jsp"/>
    </head>
    <body onload="updateTime()">
        <div class="container">
            <br><br>
            <div id="clock"></div>
            <form id="attendanceForm" action="TakeAttendanceServlet" method="post">
                <input type="hidden" id="attendanceTime" name="attendanceTime">
                <input type="hidden" id="attendanceDate" name="attendanceDate">
                <h4>Vui lòng chọn ca làm việc của bạn:</h4>
                <select id="leaveShift" name="leaveShift">
                    <c:forEach items="${requestScope.LIST4}" var="i">
                        <c:if test="${i.worksheetemployeedto.name eq sessionScope.USER.employeename}">
                            <option value="${i.shiftid}">(${i.shiftid}) ${i.starttime} ${i.startdate} to ${i.endtime} ${i.enddate}</option>
                        </c:if>
                    </c:forEach>
                </select>
                <br>
                <input type="hidden" name="employeeID" value="${sessionScope.USER.employeeID}">
                <br>
                <p class="attendance-button" onclick="takeAttendance('CHECK IN')">CHECK IN</p><br>
                <p class="attendance-button" onclick="takeAttendance('CHECK OUT')">CHECK OUT</p>
                <input type="hidden" id="buttonValue" name="button" value="">
            </form>
        </div>
        <div id="clock"></div>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
                    function takeAttendance(buttonValue) {
                        var currentDate = new Date();
                        var currentDateString = currentDate.getFullYear() + '-' + (currentDate.getMonth() + 1) + '-' + currentDate.getDate();
                        var currentTime = currentDate.getHours() + ':' + currentDate.getMinutes() + ':' + currentDate.getSeconds();

                        $('#attendanceTime').val(currentTime);
                        $('#attendanceDate').val(currentDateString);

                        $('#buttonValue').val(buttonValue);
                        $('#attendanceForm').submit();
                        alert("Điểm danh thành công vào lúc " + currentTime + " " + currentDateString);
                    }
                    function updateTime() {
                        var currentTime = new Date();
                        var hours = currentTime.getHours();
                        var minutes = currentTime.getMinutes();
                        var seconds = currentTime.getSeconds();

                        // Định dạng giờ, phút, giây để có định dạng 2 chữ số
                        hours = formatTime(hours);
                        minutes = formatTime(minutes);
                        seconds = formatTime(seconds);

                        // Hiển thị thời gian trong thẻ có id là "clock"
                        document.getElementById('clock').innerHTML = hours + ":" + minutes + ":" + seconds;

                        // Cập nhật thời gian sau mỗi giây
                        setTimeout(updateTime, 1000);
                    }

                    function formatTime(time) {
                        if (time < 10) {
                            return "0" + time;
                        }
                        return time;
                    }
        </script>
    </body>
</html>