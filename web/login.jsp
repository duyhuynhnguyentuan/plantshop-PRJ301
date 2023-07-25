<%-- 
    Document   : login
    Created on : Mar 2, 2023, 8:02:35 PM
    Author     : DUY HUYNH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html class="no-js" lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <!--By including this meta tag, the page ensures that it is rendered using the latest standards supported by the web browser-->
        <!--, which helps to ensure that the page is displayed correctly and consistently across different browsers and devices.-->
        <title>Login</title>
        <meta name="description" content="This is a login page">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--Favicon-->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/icon/monstera-leaf.png">
        <!--css-->
        <!--plugin css-->
        <link rel="stylesheet" href="assets/css/plugins.css">
        <!--Main CSS-->
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </head>
    <body>
        <div class="off_canvars_overlay"></div>
        <jsp:include page="layout/menu.jsp"/>
        <!--breadcrums area start-->
        <div class="breadcrumbs_area other_bread">
            <div class="container">   
                <div class="row">
                    <div class="col-12">
                        <div class="breadcrumb_content">
                            <ul>
                                <li><a href="home">home</a></li>
                                <li>/</li>
                                <li>Login</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>         
        </div>
        <!--breadcrumbs area end-->

        <!-- customer login start -->
        <div class="customer_login">
            <div class="container">
                <div class="row">
                    <!--login area start-->
                    <div class="login-form col-lg-6 col-md-6">

                        <div class="account_form">
                            <h2>Login</h2>
                            <c:set var="cookie" value="${pageContext.request.cookies}"/>
                            <form action="user?action=checkLogin" method="POST">
                                <p style="color: red; align-content: center;">
                                    ${requestScope.error}
                                </p>
                                <p>   
                                    <label>Email <span>*</span></label>
                                    <input name="user_email" type="text" value="${cookie.email.value}">
                                </p>
                                <p>   
                                    <label>Password <span>*</span></label>
                                    <input name="user_pass" type="password" value="${cookie.pass.value}">
                                </p>   
                                <div class="login_submit">
                                    <a href="#">Forget password?</a>
                                    <label for="remember">
                                        <input ${(cookie.rem.value eq 'ON')?"checked":""} id="remember" name="remember" value="ON" type="checkbox">
                                        Remember me
                                    </label>
                                    <button type="submit">Login</button>

                                </div>

                            </form>
                        </div>    

                    </div>
                    <!--login area start-->

                    <!--register area start-->
                    <div class="register-form col-lg-6 col-md-6">

                        <div class="account_form register">
                            <h2>Register</h2>
                            <form action="user?action=signup" method="POST">
                                <p style="color: red; align-content: center;">
                                    ${requestScope.error_pass}
                                </p>
                                <p style="color: blue; align-content: center;">
                                    ${requestScope.done}
                                </p>
                                <p style="color: red; align-content: center;">
                                    ${requestScope.emailavailable}
                                </p>
                                <p>   
                                    <label>Email <span>*</span></label>
                                    <input type="email" name="user_email">
                                </p>
                                <p>   
                                    <label>Password <span>*</span></label>
                                    <input type="password" name="user_pass">
                                </p>
                                <p>   
                                    <label>Confirm password <span>*</span></label>
                                    <input type="password" name="re_pass">
                                </p>
                                <div class="login_submit">
                                    <button type="submit">Register</button>
                                </div>
                            </form>
                        </div>    
                    </div>
                </div>
                <!--register area end-->
            </div>

        </div>
        <!-- customer login end -->

        <!--footer area start-->
        <jsp:include page="layout/footer.jsp" />
        <!--footer area end-->
        <!-- JS
 ============================================ -->

        <!-- footer animation here -->
              
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
      
        <!--map js code here-->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAdWLY_Y6FL7QGW5vcO3zajUEsrKfQPNzI"></script>
        <script  src="https://www.google.com/jsapi"></script>
        <script src="assets/js/map.js"></script>


        <!-- Plugins JS -->
        <script src="assets/js/plugins.js"></script>

        <!-- Main JS -->
        <script src="assets/js/main.js"></script>
        <script src="assets/js/greeting"></script>
        <!-- Additional animation to the login and register form -->
        <style>
  
       
            /* Login form animation */
            .login-form {
                animation: slide-in-left 1.0s ease-out forwards;
            }

            @keyframes slide-in-left {
                from {
                    transform: translateX(-100%);
                }
                to {
                    transform: translateX(0);
                }
            }

            /* Registration form animation */
            .register-form {
                animation: slide-in-right 1.0s ease-out forwards;
            }

            @keyframes slide-in-right {
                from {
                    transform: translateX(100%);
                }
                to {
                    transform: translateX(0);
                }
            }
        </style>
    </body>
</html>
