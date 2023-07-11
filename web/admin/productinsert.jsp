<%-- 
    Document   : index
    Created on : Oct 19, 2021, 11:22:48 PM
    Author     : Khuong Hung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Quản trị Admin</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Main CSS-->
        <link rel="stylesheet" type="text/css" href="admin/css/main.css">
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

    <body onload="time()" class="app sidebar-mini rtl">
        <!-- Navbar-->
        <header class="app-header">
            <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
                                            aria-label="Hide Sidebar"></a>
            <!-- Navbar Right Menu-->
            <ul class="app-nav">


                <!-- User Menu-->
                <li><a class="app-nav__item" href="home"><i class='bx bx-log-out bx-rotate-180'></i> </a>

                </li>
            </ul>
        </header>
        <!-- Sidebar menu-->
        <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
        <aside class="app-sidebar">
            <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="admin/images/user.png" width="50px"
                                                alt="User Image">
                <div>
                    <p class="app-sidebar__user-name"><b>${sessionScope.user.user_name}</b></p>
                    <p class="app-sidebar__user-designation">Chào mừng bạn trở lại</p>
                </div>
            </div>
            <hr>
            <ul class="app-menu">
                <li><a class="app-menu__item" href="dashboard"><i class='app-menu__icon bx bx-tachometer'></i><span
                            class="app-menu__label">Bảng điều khiển</span></a></li>
                <li><a class="app-menu__item" href="customermanager?action=getuser"><i class='app-menu__icon bx bx-user-voice'></i><span
                            class="app-menu__label">Quản lý khách hàng</span></a></li>
                <li><a class="app-menu__item" href="productmanager?action=allproduct"><i
                            class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Quản lý sản phẩm</span></a>
                </li>
              
            </ul>
        </aside>
        <main class="app-content">
            <div class="row">
                <div class="col-md-12">
                    <div class="app-title">
                        <ul class="app-breadcrumb breadcrumb">
                            <li class="breadcrumb-item"><a href="#"><b>Bảng điều khiển</b></a></li>
                        </ul>
                        <div id="clock"></div>
                    </div>
                </div>
            </div>
            <div class="row">
                <!-- col-6 -->

                <!-- col-6 -->
                <div class="col-md-6">
                    <div class="widget-small info coloured-icon"><i class='icon bx bxs-data fa-3x'></i>
                        <div class="info">
                            <h4>Tổng sản phẩm</h4>
                            <p><b>${requestScope.product} sản phẩm</b></p>
                            <p class="info-tong">Tổng số sản phẩm được quản lý.</p>
                        </div>
                    </div>
                </div>
                <!-- col-6 -->
                <div class="col-md-6">
                    <div class="widget-small danger coloured-icon"><i class='icon bx bxs-error-alt fa-3x'></i>
                        <div class="info">
                            <h4>Sắp hết hàng</h4>
                            <p><b>${requestScope.low} sản phẩm</b></p>
                            <p class="info-tong">Số sản phẩm cảnh báo hết cần nhập thêm.</p>
                        </div>
                    </div>
                </div>

            </div>
            <div class="col-md-12">
                <div class="tile">
                    <h3 class="tile-title">Tất cả sản phẩm</h3>
                    <div>
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Tên loại</th>
                                    <th>Mã sản phẩm</th>
                                    <th>Tên sản phẩm</th>
                                    <th>Giá sản phẩm</th>
                                    <th>Mô tả</th>
                                    <th>Số lượng</th>
                                    <th>Ảnh</th>
                                    <th>Chức năng</th>

                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${allProduct}" var="p">
                                    <tr>
                                        <td>${p.cate.category_name}</td>
                                        <td>${p.product_id}</td>
                                        <td>${p.product_name}</td>
                                        <td>${p.product_price}</td>
                                        <td>${p.product_description}</td>
                                        <td>${p.quantity}</td>
                                        <td>${p.img}</td>                                  
                                        <td> <button class="btn btn-danger btn-sm delete" type="button" title="Xóa" id="show-emp" data-toggle="modal"
                                                     data-target="#ModalDEL${p.product_id}">
                                                <i class="fas fa-trash"></i>
                                            </button></td>>
                                    </tr>
                                </c:forEach>

                            </tbody>
                        </table>
                    </div>
                    <!-- / div trống-->
                </div>
            </div><!--het-->
            <c:forEach  items="${allProduct}" var="p">
                <div class="modal fade" id="ModalDEL${p.product_id}" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"
                     data-keyboard="false">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <form method="POST" action="ProductManagement?action=deleteproduct">
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="form-group col-md-12">
                                            <span class="thong-tin-thanh-toan">
                                                <h5>Bạn có chắc chắn muốn xóa sản phẩm này?</h5>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-6">
                                            <input hidden name="user_id" value="${p.product_id}">
                                        </div>
                                    </div>
                                    <BR>
                                    <button class="btn btn-danger" type="submit">Xóa</button>
                                    <button class="btn btn-cancel" data-dismiss="modal" href="#">Hủy bỏ</button>
                                    <BR>
                                </div>
                            </form>
                            <div class="modal-footer">
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>                            


            <div class="row">
                <button type="button" class="btn btn-danger btn-lg btn-block"><i>Tạo sản phẩm mới dưới đây nè</i></button>
            </div>

            <form method="post" action="ProductManagement?action=createnew">
                <div class="form-group row">

                    <div class="col-sm-10">
                        <input type="text" name="product_id" class="form-control" placeholder="Product ID..">
                    </div>

                    <select name="category_id" class="custom-select custom-select-md mb-3 select-width">
                        <option selected>Open this select category</option>
                        <option value="1">Foliage Plants</option>
                        <option value="2">Flowering Plants</option>
                        <option value="3">Succulents</option>
                    </select>


                    <div class="col-sm-10">
                        <input type="text" name="product_name" class="form-control" placeholder="Product Name..">
                    </div>

                    <div class="col-sm-10">
                        <input type="text" name="price" class="form-control" placeholder="Listed Price..">
                    </div>

                    <div class="col-sm-10">
                        <textarea name="describe" class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                    </div>

                    <div class="col-sm-10">
                        <input type="number" name="quantity" class="form-control" placeholder="Quantity..">
                    </div>

                    <div class="col-sm-10">
                        <input type="text"  name="product_img" class="form-control" placeholder="images path here...">
                    </div>

                    <div class="col-sm-10 mt-3">
                        <button class="btn btn-success" type="submit">Submit</button>
                    </div>

                </div>
            </form>





            <div class="text-center" style="font-size: 13px">
                <p><b>Done in 
                        <script type="text/javascript">
                            document.write(new Date().getFullYear());
                        </script> Im so tired of this
                    </b></p>
            </div>
        </main>
        <script src="admin/js/jquery-3.2.1.min.js"></script>
        <!--===============================================================================================-->
        <script src="admin/js/popper.min.js"></script>
        <script src="https://unpkg.com/boxicons@latest/dist/boxicons.js"></script>
        <!--===============================================================================================-->
        <script src="admin/js/bootstrap.min.js"></script>
        <!--===============================================================================================-->
        <script src="admin/js/main.js"></script>
        <!--===============================================================================================-->
        <script src="admin/js/plugins/pace.min.js"></script>
        <!--===============================================================================================-->
        <!--===============================================================================================-->
        <script type="text/javascript">
                            var data = {
                                labels: ["Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5", "Tháng 6"],
                                datasets: [{
                                        label: "Dữ liệu đầu tiên",
                                        fillColor: "rgba(255, 213, 59, 0.767), 212, 59)",
                                        strokeColor: "rgb(255, 212, 59)",
                                        pointColor: "rgb(255, 212, 59)",
                                        pointStrokeColor: "rgb(255, 212, 59)",
                                        pointHighlightFill: "rgb(255, 212, 59)",
                                        pointHighlightStroke: "rgb(255, 212, 59)",
                                        data: [20, 59, 90, 51, 56, 100]
                                    },
                                    {
                                        label: "Dữ liệu kế tiếp",
                                        fillColor: "rgba(9, 109, 239, 0.651)  ",
                                        pointColor: "rgb(9, 109, 239)",
                                        strokeColor: "rgb(9, 109, 239)",
                                        pointStrokeColor: "rgb(9, 109, 239)",
                                        pointHighlightFill: "rgb(9, 109, 239)",
                                        pointHighlightStroke: "rgb(9, 109, 239)",
                                        data: [48, 48, 49, 39, 86, 10]
                                    }
                                ]
                            };
                            var ctxl = $("#lineChartDemo").get(0).getContext("2d");
                            var lineChart = new Chart(ctxl).Line(data);

                            var ctxb = $("#barChartDemo").get(0).getContext("2d");
                            var barChart = new Chart(ctxb).Bar(data);
        </script>
        <script type="text/javascript">
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
                m = checkTime(m);
                nowTime = h + ":" + m + "";
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
            function openModal() {
                document.querySelector('.modal').style.display = 'block';
            }

            function closeModal() {
                document.querySelector('.modal').style.display = 'none';
            }

            document.querySelector('.modal .close').addEventListener('click', closeModal);

            document.querySelector('.modal').addEventListener('click', function (event) {
                if (event.target === this) {
                    closeModal();
                }
            });
        </script>
        <style>
            .modal {
                display: none;
                position: fixed;
                z-index: 1;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: rgba(0,0,0,0.4);
            }

            .modal-dialog {
                margin: 10% auto;
                width: 80%;
                max-width: 600px;
            }

            .modal-content {
                background-color: #fff;
                padding: 20px;
                border: none;
            }

            .modal-header {
                border-bottom: 1px solid #ccc;
                padding-bottom: 10px;
            }

            modal-header .close{
                color: black;
            }
            .modal-title {
                margin: 0;
                color: #000;
            }

            .modal-body {
                padding: 10px 0;
            }

            .modal-body input {
                display: block;
                margin-bottom: 10px;
            }
        </style>


    </body>

</html>