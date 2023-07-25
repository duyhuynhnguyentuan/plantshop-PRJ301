
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="vi">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>My Shop</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/icon/guitar.png">
        <!-- Plugins CSS -->
        <link rel="stylesheet" href="assets/css/plugins.css">
        <!-- Main Style CSS -->
        <link rel="stylesheet" href="assets/css/style.css">
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
         <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </head>

    <body>

        <!-- Main Wrapper Start -->
        <!--Offcanvas menu area start-->
        <div class="off_canvars_overlay"></div>

        <jsp:include page="layout/menu.jsp"/>

        <!--slider area start-->
        <div class="slider_area slider_style home_three_slider owl-carousel">
            <div class="single_slider" data-bgimg="assets/img/slider/slider4.jpg">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-12">
                            <div class="slider_content content_one">
                                <img src="assets/img/slider/slider_summer3.png" alt="" style="width: 150%;">
                              
                                <a href="product">Discover Now</a>
                            </div>    
                        </div>
                    </div>
                </div>    
            </div>
            <div class="single_slider" data-bgimg="assets/img/slider/slider5.jpg">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-12">
                            <div class="slider_content content_two">
                                <img src="assets/img/slider/content4.png" alt="">
                              
                                <a href="product">Discover Now</a>
                            </div>    
                        </div>
                    </div>
                </div>
            </div>
            <div class="single_slider" data-bgimg="assets/img/slider/slider6.jpg">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-12">
                            <div class="slider_content content_three">
                                <img src="assets/img/slider/content5.png" alt="">
                          
                                <a href="product">Discover Now</a>
                            </div>    
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--slider area end-->

        <!--banner area start-->
        <div class="banner_section banner_section_three">
            <div class="container-fluid">
                <div class="row ">
                    <div class="col-lg-4 col-md-6">
                        <div class="banner_area">
                            <div class="banner_thumb">
                                <a href="product"><img src="assets/img/bg/banner8.png" alt="#"></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="banner_area">
                            <div class="banner_thumb">
                                <a href="product"><img src="assets/img/bg/banner9.png" alt="#"></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="banner_area bottom">
                            <div class="banner_thumb">
                                <a href="product"><img src="assets/img/bg/banner10.png" alt="#"></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--banner area end-->

        <!--product section area start-->
        <section class="product_section womens_product bottom">
            <div class="container">
                <div class="row">   
                    <div class="col-12">
                        <div class="section_title">
                            <h2>Our Plants</h2>
                            <p>For you</p>
                        </div>
                    </div> 
                </div>    
                <div class="product_area"> 
                    <div class="row">
                        <div class="product_carousel product_three_column4 owl-carousel">
                            <c:forEach items="${top10}" var="top10">
                                <div class="col-lg-3">
                                    <div class="single_product">
                                        <div class="product_thumb">
                                            <a class="primary_img" href="product?action=productdetail&product_id=${top10.product_id}"><img src="${top10.img}" width="10px;" alt=""></a>
                                            <div class="quick_button">
                                                <a href="product?action=productdetail&product_id=${top10.product_id}" title="quick_view">See this product</a>
                                            </div>
                                        </div>
                                        <div class="product_content">
                                            <h3><a href="product?action=productdetail&product_id=${top10.product_id}">${top10.product_name}</a></h3>
                                            <span class="current_price">${top10.product_price}đ</span>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--banner area start-->
        <section class="banner_section banner_section_three">
            <div class="container-fluid">
                <div class="row ">
                    <div class="col-lg-6 col-md-6">
                        <div class="banner_area">
                            <div class="banner_thumb">
                                <a href="product"><img src="assets/img/bg/banner11.png" style="width: 100%" alt="#"></a>
                                <div class="banner_content">
                                    <h1>Monstera <br> Home's plant</h1>
                                    <a href="product">Discover Now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="banner_area">
                            <div class="banner_thumb">
                                <a href="product"><img src="assets/img/bg/banner12.png" style="width: 100%" alt="#"></a>
                                <div class="banner_content">
                                    <h1>Small pots <br> Garden’s Collection</h1>
                                    <a href="product">Discover Now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--banner area end-->

        <!--product section area start-->
        <section class="product_section womens_product bottom">
            <div class="container">
                <div class="row">   
                    <div class="col-12">
                        <div class="section_title">
                            <h2>Best-seller</h2>
                            <p>Most impressive and most sold plant</p>
                        </div>
                    </div> 
                </div>    
                <div class="product_area"> 
                    <div class="row">
                        <div class="product_carousel product_three_column4 owl-carousel">
                            <c:forEach items="${topTrend}" var="td">
                            <div class="col-lg-3">
                                    <div class="single_product">
                                        <div class="product_thumb">
                                            <a class="primary_img" href="product?action=productdetail&product_id=${td.product_id}"><img src="${td.img}" width="10px;" alt=""></a>
                                            <div class="quick_button">
                                                <a href="product?action=productdetail&product_id=${td.product_id}" title="quick_view">Xem sản phẩm</a>
                                            </div>
                                        </div>
                                        <div class="product_content">
                                            <h3><a href="product?action=productdetail&product_id=${td.product_id}">${td.product_name}</a></h3>
                                            <span class="current_price">${td.product_price}đ</span>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>

   </section>
       <c:if test="${sessionScope.user != null }">
            <div class="toast" role="alert" aria-live="assertive" aria-atomic="true" style="width: 300px; z-index: 500000">
                <div class="toast-header">
<!--                     <img src="assets/img/logo/guitar.png" class="rounded me-2" alt="iconlmao" style= "  max-width: 100%;
    height: auto;
    max-height: 20px;">-->
                    <strong class="mr-auto">Notification</strong>
                    <small>just now</small>
                    <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="toast-body">
                    Login successfully
                </div>
            </div>
            <script>
                $(document).ready(function () {
                    $('.toast').toast({
                        delay: 3500 // 5 seconds delay before fade-out animation
                    });
                    $('.toast').toast('show');
                });

            </script>
            <style>
                .toast {
                    position: fixed;
                    bottom: 20px;
                    right: 20px;
                }
            </style>
        </c:if>>
        <!--product section area end-->
        <!--footer area start-->
        <jsp:include page="layout/footer.jsp"/>
        <!--footer area end-->
        <!-- JS
        ============================================ -->
<!-- style non-stop rolling-->

        <!-- Plugins JS -->
        <script src="assets/js/plugins.js"></script>

        <!-- Main JS -->
        <script src="assets/js/main.js"></script>
           <style>
            .product_thumb {
                width: 100%;
                height: 300px; /* set a fixed height */
                overflow: hidden;
            }

            .product_thumb img {
                width: 100%;
                height: 100%;
                object-fit: cover; /* ensure the image covers the container without distortion */
            }

        </style>
    </body>

</html>
