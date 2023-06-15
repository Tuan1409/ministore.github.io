<%-- 
    Document   : WorkSheet
    Created on : May 31, 2023, 4:56:15 PM
    Author     : Vuong
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Main CSS-->
        <link rel="stylesheet" type="text/css" href="./css/admin.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <!-- or -->
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">

        <!-- Font-icon css-->
        <link rel="stylesheet" type="text/css"
              href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
        <link href='https://unpkg.com/css.gg@2.0.0/icons/css/search.css' rel='stylesheet'>
    </head>
    <body onload="time()" class="app sidebar-mini rtl">
        <jsp:include page="headerSales.jsp"/>
        <main class="app-content">
            <div class="app-title"> 
                <ul class="app-breadcrumb breadcrumb side">
                    <li class="breadcrumb-item active"><a href="#"><b>Ca làm việc </b></a></li>
                </ul>
                <div id="clock"></div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <div class="tile-body">
                            <div class="row element-button">
                                <div class="col-sm-2">
                            <div class="col-sm-2">
                                    <form action="WorkSheet_showdetail_forsales" method="POST">
                                        <button class="btn btn-add btn-sm" >
                                            <i class="fas fa-eye"></i> Hiển thị thông tin cá nhân
                                        </button>
                                            <input type="hidden" name="ID" id="idInput" value="<%= session.getAttribute("ID") %>" />
                                    </form>
                                </div>
                                </div>

                                <div class="col-sm-2">
                                    <form action="WorkSheet_searchdate_forsales" method="POST">
                                        <button class="btn btn-add btn-sm" onclick="searchByTime();">
                                            <i class="fas fa-search"></i> Tìm kiếm
                                        </button>
                                            <input type="hidden" name="ID" id="idInput" value="<%= session.getAttribute("ID") %>" />
                                </div>
                                <div>
                                    <label for="startTime">Từ ngày:</label>
                                    <input type="date" id="startTime" name="txtstartdate" style="width: 130px;">
                                </div>
                                <div>
                                    <label for="endTime">Đến ngày:</label>
                                    <input type="date" id="endTime" name="txtenddate" style="width: 130px;">
                                </div>
                                </form>    

                            </div>
                            <div>
                             
                            </div>




                        </div>




                        <%--   <div>
                                  <c:if test="${not empty message}">
  <div class="success-message" style="color: orange;">${message}</div>
</c:if>
                              </div> --%>

                        <table class="table table-hover table-bordered" id="sampleTable">

                            <thead>

                                <tr>
                                    <th width="10"><input type="checkbox" id="all"></th>

                                    <th>Shift ID</th>
                                    <th>Start Time</th>
                                    <th>Date Start</th>
                                    <th>End Time</th>
                                    <th>Date End</th>
                                    <th>Coef Salary</th>
                                    <th>Employee Role</th>
                                    <th>Employee's Name</th>
                                    <th>Work Status</th>
<!--                                    <th>Chức năng</th>-->
                                </tr>
                            </thead>


                            <tbody>    
                               
                                <c:forEach items="${requestScope.LIST}" var="i">

                                    <tr>
                                        <td width="10"><input type="checkbox" name="check1" value="1"></td>
                                        <td>${i.shiftid}</td>
                                        <td>${i.starttime}</td>
                                        <td>${i.startdate}</td>
                                        <td>${i.endtime}</td>
                                        <td>${i.enddate}</td>
                                        <td>${i.coefsalary}</td>
                                         
                                        <td>
                                         <c:if test="${i.employeerole == 2}">
                                               Sales
                                            </c:if>
                                            <c:if test="${i.employeerole == 3}">
                                               Guard
                                            </c:if>
                                            </td>
                                        <td>${i.worksheetemployeedto.name}</td>
                                        <td>


  
  <c:if test="${i.workstatus == 1}">
                                                <span class="badge bg-success">true</span>
                                            </c:if>
                                                 <c:if test="${i.workstatus == 2}">
                                                <span class="badge bg-danger">Thiếu người làm việc</span>
                                            </c:if>
                                                  <c:if test="${i.workstatus == 3}">
                                                <span class="badge bg-danger">Đã tính lương</span>
                                            </c:if>

                                         </td>


<!--                                        <td style="display: flex; justify-content: space-left">
                                      


                                    
 </td>-->

                                        <!-- Các trường dữ liệu khác trong biểu mẫu -->
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>

                    </div>
                </div>
            </div>
        </div>

    </main>

    <!--
      MODAL
    -->
    <div class="modal fade" id="ModalUP" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"
         data-keyboard="false">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">

                <div class="modal-body">
                    <div class="row">
                        <div class="form-group  col-md-12">
                            <span class="thong-tin-thanh-toan">
                                <h5>Chỉnh sửa lịch làm việc </h5>
                            </span>
                        </div>
                    </div>
                    <form action="WorkSheet_update" method="POST" id="update">


                    </form>

                </div>
                <div class="modal-footer">
                </div>
            </div>
        </div>
    </div>
    <!--
    MODAL
    -->

    <!-- Essential javascripts for application to work-->

    <script src="./js/jquery-3.2.1.min.js"></script>
    <script src="./js/popper.min.js"></script>
    <script src="./js/bootstrap.min.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="src/jquery.table2excel.js"></script>
    <script src="./js/main.js"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="js/plugins/pace.min.js"></script>
    <!-- Page specific javascripts-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
    <!-- Data table plugin-->
    <script type="text/javascript" src="./js/plugins/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="./js/plugins/dataTables.bootstrap.min.js"></script>
    <script type="text/javascript">

                                                            $('#sampleTable').DataTable();
                                                            //Thời Gian
                                                            function time() {
                                                                var today = new Date();
                                                                var weekday = new Array(7);
                                                                weekday[0] = "Chủ Nhật";
                                                                weekday[1] = "Thứ Hai";
                                                                weekday[2] = "Thứ Ba";
                                                                weekday[3] = "Thứ Tư";
                                                                weekday[4] = "Thứ Năm";
                                                                weekday[5] = "Thứ Sáu";
                                                                weekday[6] = "Thứ Bảy";
                                                                var day = weekday[today.getDay()];
                                                                var dd = today.getDate();
                                                                var mm = today.getMonth() + 1;
                                                                var yyyy = today.getFullYear();
                                                                var h = today.getHours();
                                                                var m = today.getMinutes();
                                                                var s = today.getSeconds();
                                                                m = checkTime(m);
                                                                s = checkTime(s);
                                                                nowTime = h + " giờ " + m + " phút " + s + " giây";
                                                                if (dd < 10) {
                                                                    dd = '0' + dd
                                                                }
                                                                if (mm < 10) {
                                                                    mm = '0' + mm
                                                                }
                                                                today = day + ', ' + dd + '/' + mm + '/' + yyyy;
                                                                tmp = '<span class="date"> ' + today + ' - ' + nowTime +
                                                                        '</span>';
                                                                document.getElementById("clock").innerHTML = tmp;
                                                                clocktime = setTimeout("time()", "1000", "Javascript");

                                                                function checkTime(i) {
                                                                    if (i < 10) {
                                                                        i = "0" + i;
                                                                    }
                                                                    return i;
                                                                }
                                                            }
    </script>
    <script>
        function submitWorksheetForm() {
            document.getElementById('worksheetForm').submit();
        }
    </script>


    <script>
        function confirmDelete(button) {
            var shiftid = button.getAttribute("data-shiftid");
            var employeeid = button.getAttribute("data-employeeid");

            swal({
                title: "Cảnh báo",
                text: "Bạn có muốn xoá nhân viên ra khỏi lịch làm việc này?",
                buttons: ["Hủy bỏ", "Đồng ý"],
            }).then((willDelete) => {
                if (willDelete) {
                    var form = button.closest("form");
                    form.action = "WorkSheet_delete?shiftid=" + shiftid + "&employeeid=" + employeeid;
                    form.submit();
                }
               
            });
        }
    </script>


    <script>
        function confirmDeleteall(button) {
            var shiftid = button.getAttribute("data-shiftid");
            swal({
                title: "Cảnh báo",
                text: "Bạn có muốn xoá ShiftID này?",
                buttons: ["Hủy bỏ", "Đồng ý"],
            }).then((willDelete) => {
                if (willDelete) {
                    var form = button.closest("form");
                    form.action = "WorkSheet_deleteall?shiftid=" + shiftid;
                    form.submit();
                }
            });
        }
    </script>
    <script>
        <% if (request.getAttribute("message") != null) {%>
        swal("<%= request.getAttribute("message")%>", "", "success");
        <% request.removeAttribute("message"); %>
        <% } %>
    </script>
    
       <script>
        <% if (request.getAttribute("messageerror") != null) {%>
        swal("<%= request.getAttribute("messageerror")%>", "", "error");
        <% request.removeAttribute("messageerror"); %>
        <% } %>
    </script>

   

    <script>
        function getData(i) {
            $.ajax({
                type: 'POST',
                url: '${pageContext.request.contextPath}/WorkSheet_loadbyid',
                data: {
                    id: i
                },
                success: function (data, textStatus, jqXHR) {
                    $('#update').html(data);
                }
            })
        }
    </script>


</body>

</html>

