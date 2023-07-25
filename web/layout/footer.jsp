<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<footer><html>
        <head>

            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            <style>
                .fly-in {
                    opacity: 0;
                    transform: translateY(100px);
                    transition: all 0.5s ease-in-out;
                }
            </style>
        </head>
        <body>


            <div class="fly-in">
                <div class="footer_top">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-6 col-md-6">
                                <div class="widgets_container contact_us">
                                    <h3>Contact us</h3>
                                    <div class="footer_contact">
                                        <p>Address: FPT University HCMC</p>
                                        <p>Phone: <a href="tel:0084835488888">(+84) 835488888</a> </p>
                                        <p>Email: <a href="mailto:andyhntd2003@gmail.com">andyhntd2003@gmail.com</a></p>
                                        <ul>
                                            <li><a href="#" title="Twitter"><i class="fa fa-twitter"></i></a></li>
                                            <li><a href="#" title="google-plus"><i class="fa fa-google-plus"></i></a></li>
                                            <li><a href="#" title="facebook"><i class="fa fa-facebook"></i></a></li>
                                            <li><a href="#" title="youtube"><i class="fa fa-youtube"></i></a></li>
                                        </ul>

                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6">
                                <div class="widgets_container newsletter">
                                    <h3>Get notification </h3>
                                    <div class="newleter-content">
                                        <p>We deliver the best</p>
                                        <div class="subscribe_form">
                                            <form id="mc-form" class="mc-form footer-newsletter" method="GET" action="">
                                                <input id="mc-email" type="email" name="EmailInfomation" autocomplete="off" placeholder="Enter you email address here..." />
                                                <button type="submit" id="mc-submit">Đăng ký</button>
                                            </form>
                                            <!-- mailchimp-alerts Start -->
                                            <div class="mailchimp-alerts text-centre">
                                                <div class="mailchimp-submitting"></div><!-- mailchimp-submitting end -->
                                                <div class="mailchimp-success"></div><!-- mailchimp-success end -->
                                                <div class="mailchimp-error"></div><!-- mailchimp-error end -->
                                            </div><!-- mailchimp-alerts end -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <script>
                $(document).ready(function () {
                    $(window).scroll(function () {
                        // Get the position of the "fly-in" div relative to the viewport
                        var flyInPos = $(".fly-in").offset().top - $(window).scrollTop();

                        // Check if the "fly-in" div is within the viewport
                        if (flyInPos < $(window).height() - 100) {
                            $(".fly-in").css({
                                opacity: 1,
                                transform: "translateY(0)"
                            });
                        }
                    });
                });
            </script>
        </body>
    </html></footer>>

