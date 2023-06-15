<%-- 
    Document   : orderDetail
    Created on : May 31, 2023, 4:31:41 AM
    Author     : PC
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Xem chi tiết đơn hàng</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Main CSS-->
        <link rel="stylesheet" type="text/css" href="css/view.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <!-- or -->
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">

        <!-- Font-icon css-->
        <link rel="stylesheet" type="text/css"
              href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">

    </head>
    <body>
    <body onload="time()" class="app sidebar-mini rtl">
        <jsp:include page="headerAdmin.jsp"/>
        <main class="app-content">
            <div class="app-title">
                <ul class="app-breadcrumb breadcrumb">
                    <li class="breadcrumb-item"><a href="OrderServlet">Danh sách đơn hàng</a></li>
                    <li class="breadcrumb-item">Xem chi tiết đơn hàng</li>
                </ul>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <h3 class="tile-title">Xem chi tiết đơn hàng</h3>
                        <table class="table table-hover table-bordered" id="sampleTable">
                            <thead>
                                <tr>
                                    <th>ID sản phẩm</th>
                                    <th>Hình ảnh</th>
                                    <th>Tên sản phẩm</th>
                                    <th>Giá</th>
                                    <th>Số lượng</th>
                                    <th>Phương thức thanh toán</th>
                                    <th>Voucher</th>
                                    <th>Ngày đặt hàng</th>
                                    <th>Thành tiền</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="isPayVoucherDisplayed" value="false" />
                                
                                <c:forEach items="${listOrderDetails}" var="o">
                                    <c:set var="total" value="${total + o.getProductPrice() * o.getQuatity()}" />
                                    <tr>
                                        <td>${o.getProductID()}</td>
                                        <td><img src="img/${o.getProductLink()}"></td>
                                        <td>${o.getProductName()}</td>
                                        <td>${o.getProductPrice()}</td>
                                        <td>${o.getQuatity()}</td>
                                        
                                            <td>${o.getPayName()}</td>
                                            <td>${o.getVoucherName()}</td>
                                            


                                        <td>${o.getOrderDate()}</td>
                                        <td><c:out value="${o.getProductPrice() * o.getQuatity()}"/></td>
                                            
                                    </tr>
                                </c:forEach>

                            </tbody>
                        </table>
                                <h4> Tổng tiền: ${total}</h4>            
                    </div>
                </div>
            </div>
        </main>
        <!-- Essential javascripts for application to work-->
        
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="src/jquery.table2excel.js"></script>
        <script src="js/main.js"></script>
        <!-- The javascript plugin to display page loading on top-->
        <script src="js/plugins/pace.min.js"></script>
        <!-- Page specific javascripts-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
        <!-- Data table plugin-->
        <script type="text/javascript" src="js/plugins/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="js/plugins/dataTables.bootstrap.min.js"></script>
        <script type="text/javascript">$('#sampleTable').DataTable();</script>
    </body>
</body>
</html>
