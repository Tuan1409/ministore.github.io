

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Thêm nhân viên | Quản trị Admin</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Main CSS-->
        <link rel="stylesheet" type="text/css" href="./css/admin.css">
        <!-- Font-icon css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <!-- or -->
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
        <link rel="stylesheet" type="text/css"
              href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
        <script src="http://code.jquery.com/jquery.min.js" type="text/javascript"></script>
        <script>

            function readURL(input, thumbimage) {
                if (input.files && input.files[0]) { //Sử dụng  cho Firefox - chrome
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $("#thumbimage").attr('src', e.target.result);
                    }
                    reader.readAsDataURL(input.files[0]);
                } else { // Sử dụng cho IE
                    $("#thumbimage").attr('src', input.value);

                }
                $("#thumbimage").show();
                $('.filename').text($("#uploadfile").val());
                $('.Choicefile').css('background', '#14142B');
                $('.Choicefile').css('cursor', 'default');
                $(".removeimg").show();
                $(".Choicefile").unbind('click');

            }
            $(document).ready(function () {
                $(".Choicefile").bind('click', function () {
                    $("#uploadfile").click();

                });
                $(".removeimg").click(function () {
                    $("#thumbimage").attr('src', '').hide();
                    $("#myfileupload").html('<input type="file" id="uploadfile"  onchange="readURL(this);" />');
                    $(".removeimg").hide();
                    $(".Choicefile").bind('click', function () {
                        $("#uploadfile").click();
                    });
                    $('.Choicefile').css('background', '#14142B');
                    $('.Choicefile').css('cursor', 'pointer');
                    $(".filename").text("");
                });
            })
        </script>
    </head>

    <body class="app sidebar-mini rtl">
        <style>
            .Choicefile {
                display: block;
                background: #14142B;
                border: 1px solid #fff;
                color: #fff;
                width: 150px;
                text-align: center;
                text-decoration: none;
                cursor: pointer;
                padding: 5px 0px;
                border-radius: 5px;
                font-weight: 500;
                align-items: center;
                justify-content: center;
            }

            .Choicefile:hover {
                text-decoration: none;
                color: white;
            }

            #uploadfile,
            .removeimg {
                display: none;
            }

            #thumbbox {
                position: relative;
                width: 100%;
                margin-bottom: 20px;
            }

            .removeimg {
                height: 25px;
                position: absolute;
                background-repeat: no-repeat;
                top: 5px;
                left: 5px;
                background-size: 25px;
                width: 25px;
                /* border: 3px solid red; */
                border-radius: 50%;

            }

            .removeimg::before {
                -webkit-box-sizing: border-box;
                box-sizing: border-box;
                content: '';
                border: 1px solid red;
                background: red;
                text-align: center;
                display: block;
                margin-top: 11px;
                transform: rotate(45deg);
            }

            .removeimg::after {
                /* color: #FFF; */
                /* background-color: #DC403B; */
                content: '';
                background: red;
                border: 1px solid red;
                text-align: center;
                display: block;
                transform: rotate(-45deg);
                margin-top: -2px;
            }
        </style>
        <jsp:include page="headerAdmin.jsp"/>
        <main class="app-content">
            <div class="app-title">
                <ul class="app-breadcrumb breadcrumb">
                    <li class="breadcrumb-item">Danh sách ca làm việc</li>
                    <li class="breadcrumb-item"><a href="#">Thêm ca làm việc</a></li>
                </ul>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <h3 class="tile-title">Tạo mới ca làm việc</h3>
                        <div class="tile-body">
<!--                            <div class="row element-button" style="margin-left:  3px; margin-right: 1px;">
                                
                                <div class="col-sm-2">
                                    <a class="btn btn-add btn-sm" data-toggle="modal" data-target="#adddanhmuc"><i
                                            class="fas fa-folder-plus"></i> Thêm danh chức vụ</a>
                                </div>
 
                            </div>-->
                           
                             <form class="row" action="WorkSheet_create" method="GET">
                                 <div class="form-group col-md-10" >
                                     <h5>Nhân viên</h5>
                                 
                                 </div>
                                
                                
                                <div class="form-group col-md-4">
                                    <label class="control-label">Thời gian bắt đầu ca 1</label>
                                    <input class="form-control" type="time" value ="06:00" required name="txtStarttimeemf">
                                </div>

                                <div class="form-group col-md-4">
                                    <label class="control-label">Thời gian bắt đầu ca 2</label>
                                    <input class="form-control" type="time"value ="12:00" required name="txtStarttimeems">
                                </div>
                                <div class="form-group  col-md-4">
                                    <label class="control-label">Thời gian bắt đầu ca 3</label>
                                    <input class="form-control" type="time" value ="18:00"required name="txtStarttimeemt">
                                </div>
                                 
                                 
                                 <div class="form-group col-md-10" >
                                     <h5>Bảo vệ</h5>
                                </div>
                                 
                            
 
                        
                                <div class="form-group col-md-4">
                                    <label class="control-label">Thời gian bắt đầu ca 1</label>
                                    <input class="form-control" type="time"value ="06:00" name="txtStarttimeguardf">
                                </div>
                                 <div class="form-group col-md-4">
                                    <label class="control-label">Thời gian bắt đầu ca 2</label>
                                    <input class="form-control" type="time"value ="18:00"name="txtStarttimeguards">
                                </div>
                                 
                                 <div class="form-group col-md-10" >
                                     <h5></h5>
                                </div>
                                 
                                 <div class="form-group col-md-4">
                                    <label class="control-label">Ngày bắt đầu</label>
                                    <input class="form-control" type="date" name="txtStartdate">
                                </div>
                                 <div class="form-group col-md-4">
                                    <label class="control-label">Ngày kết thúc</label>
                                    <input class="form-control" type="date" name="txtEnddate">
                                </div>
                                 <div class="form-group col-md-10" >
                                     <h5></h5>
                                 <div>
                                <h6>Vui lòng tạo 1 ngày liên tiếp</h6>
                            </div>
<button class="btn btn-save" href="#" title="Create" type="submit" onclick="submitWorksheetForm()">Lưu lại</button>

                        <a class="btn btn-cancel" href="WorkSheet_show">Hủy bỏ</a>


                            </form>
                        </div>
                        
                       
                    </div>
                    </main>
                                 
                                 
                                 

<!--                                <div class="form-group col-md-3">
                                    <label class="control-label">Giới tính</label>
                                    <select class="form-control" id="exampleSelect2" required name="sex">
                                        <option disabled>-- Chọn giới tính --</option>
                                        <option>Nam</option>
                                        <option>Nữ</option>
                                    </select>
                                </div>

                                <div class="form-group  col-md-3">
                                    <label for="exampleSelect1" class="control-label">Chức vụ</label>
                                    <select class="form-control" id="exampleSelect1" name="role">
                                        <option disabled>-- Chọn chức vụ --</option>
                                        <option>Manager</option>
                                        <option>Sale</option>
                                        <option>Guard</option>

                                    </select>
                                </div>
                                <div class="form-group col-md-4">
                                    <label class="control-label">Tên đăng nhập</label>
                                    <input class="form-control" type="text" name="username">
                                </div>
                                <div class="form-group col-md-4">
                                    <label class="control-label">Mật Khẩu</label>
                                    <input class="form-control" type="number" name="pass">
                                </div>



                                <div class="form-group col-md-12">
                                    <label class="control-label">Ảnh 3x4 nhân viên</label>
                                    <div id="myfileupload">
                                        <input type="file" id="uploadfile" name="ImageUpload" onchange="readURL(this);" />
                                    </div>
                                    <div id="thumbbox">
                                        <img height="300" width="300" alt="Thumb image" id="thumbimage" style="display: none" />
                                        <a class="removeimg" href="javascript:"></a>
                                    </div>
                                    <div id="boxchoice">
                                        <a href="javascript:" class="Choicefile"><i class='bx bx-upload'></i></a>
                                        <p style="clear:both"></p>
                                    </div>

                                </div>-->


                    MODAL DANH MỤC
                    -->
<!--                    <div class="modal fade" id="adddanhmuc" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
                         data-backdrop="static" data-keyboard="false">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">

                                <div class="modal-body">
                                    <form action="createCategory" method="post">
                                        <div class="row">
                                            <div class="form-group  col-md-12">
                                                <span class="thong-tin-thanh-toan">
                                                    <h5>Thêm mới danh mục </h5>
                                                </span>
                                            </div>
                                            <div class="form-group col-md-12">
                                                <label class="control-label">Nhập tên danh mục mới</label>
                                                <input class="form-control" type="text" required>
                                            </div>
                                            <div class="form-group col-md-12">
                                                <label class="control-label">Danh mục sản phẩm hiện đang có</label>
                                                <ul style="padding-left: 20px;">
                     <%--                               <c:forEach items="${requestScope.list}" var="i">
                                                        <li>${i.name}</li>
                                                        </c:forEach>--%>
                                                </ul>
                                            </div>
                                        </div>
                                        <BR>
                                        <button class="btn btn-save" type="submit">Lưu lại</button>
                                        <a class="btn btn-cancel" data-dismiss="modal" href="#">Hủy bỏ</a>
                                        <BR>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                </div>
                            </div>
                        </div>
                    </div>-->
                    <script src="./js/jquery-3.2.1.min.js"></script>
                    <script src="./js/popper.min.js"></script>
                    <script src="./js/bootstrap.min.js"></script>
                    <script src="./js/main.js"></script>
                    <script src="./js/plugins/pace.min.js"></script>
                    <script>
                            const inpFile = document.getElementById("inpFile");
                            const loadFile = document.getElementById("loadFile");
                            const previewContainer = document.getElementById("imagePreview");
                            const previewContainer = document.getElementById("imagePreview");
                            const previewImage = previewContainer.querySelector(".image-preview__image");
                            const previewDefaultText = previewContainer.querySelector(".image-preview__default-text");
                            inpFile.addEventListener("change", function () {
                                const file = this.files[0];
                                if (file) {
                                    const reader = new FileReader();
                                    previewDefaultText.style.display = "none";
                                    previewImage.style.display = "block";
                                    reader.addEventListener("load", function () {
                                        previewImage.setAttribute("src", this.result);
                                    });
                                    reader.readAsDataURL(file);
                                }
                            });

                    </script>
                            <script>
    function submitWorksheetForm() {
        document.getElementById('worksheetForm').submit();
    }
</script>
<script>
    <% if (request.getAttribute("message") != null) { %>
        swal("<%= request.getAttribute("message") %>", "", "success");
        <% request.removeAttribute("message"); %>
    <% } %>
</script>

<script>
    <% if (request.getAttribute("messageerror") != null) { %>
        swal("<%= request.getAttribute("messageerror") %>", "", "error");
        <% request.removeAttribute("messageerror"); %>
    <% } %>
</script>
                    </body>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script>
    flatpickr(".timepicker", {
        enableTime: true,
        noCalendar: true,
        dateFormat: "H:i",
        time_24hr: true
    });
</script>
<!--<script>
  // Lấy ngày hôm nay
  var today = new Date();
  
  // Định dạng ngày tháng cho input
  var yyyy = today.getFullYear();
  var mm = String(today.getMonth() + 1).padStart(2, '0');
  var dd = String(today.getDate()).padStart(2, '0');
  var formattedDate = yyyy + '-' + mm + '-' + dd;
  
  // Gán giá trị ngày hôm nay cho input
  document.getElementById('start-date').value = formattedDate;
</script>-->

    </body>




                    </html>
