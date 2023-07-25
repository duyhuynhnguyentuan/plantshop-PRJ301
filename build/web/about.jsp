<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>About us page</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
        <!-- CSS 
        ========================= -->

        <!-- Plugins CSS -->
        <link rel="stylesheet" href="assets/css/plugins.css">

        <!-- Main Style CSS -->
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
        <!-- JQuery -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!-- fly-in effect -->
        <style>
                .fly-in1 {
                    opacity: 0;
                    transform: translateY(100px);
                    transition: all 0.5s ease-in-out;
                }
            </style>

    </head>

    <body>

        <!-- Main Wrapper Start -->
        <!--Offcanvas menu area start-->
        <div class="off_canvars_overlay"></div>
        <jsp:include page="layout/menu.jsp"/>
        <!--breadcrumbs area start-->
        <div class="breadcrumbs_area other_bread">
            <div class="container">   
                <div class="row">
                    <div class="col-12">
                        <div class="breadcrumb_content">
                            <ul>
                                <li><a href="index.html">Home</a></li>
                                <li>/</li>
                                <li>About us</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>         
        </div>
        <!--breadcrumbs area end-->

        <!--about section area -->
        <div class="about_section fly-in1">
            <div class="container">  
                <div class="row">
                    <div class="col-lg-6 col-md-12">
                        <div class="about_content">
                            <h1>Welcome to PLANTO !</h1>
                            <p> Nature is a gift that keeps on giving. It brings us peace, joy, and beauty. And there's nothing quite like having a piece of nature in your own home.</p>
                            <p>Founded in 2023, we have a passion for bringing nature to people's homes. Our team of experts carefully selects the best plants from local growers, ensuring that each one is healthy, vibrant, and ready to thrive in its new home."</p>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-12">
                        <div class="about_thumb">
                            <img src="assets/img/about/about.jpg" alt="">
                        </div>
                    </div>
                </div>
            </div>     
        </div>
        <!--about section end-->

        <jsp:include page="layout/footer.jsp"/>

        <!-- JS
        
        ============================================ -->
   <script>
                $(document).ready(function () {
                    $(window).scroll(function () {
                        // Get the position of the "fly-in" div relative to the viewport
                        var flyInPos = $(".fly-in1").offset().top - $(window).scrollTop();

                        // Check if the "fly-in" div is within the viewport
                        if (flyInPos < $(window).height() - 100) {
                            $(".fly-in1").css({
                                opacity: 1,
                                transform: "translateY(0)"
                            });
                        }
                    });
                });
            </script>
        <!-- Plugins JS -->
        <script src="assets/js/plugins.js"></script>

        <!-- Main JS -->
        <script src="assets/js/main.js"></script>



    </body>

</html>