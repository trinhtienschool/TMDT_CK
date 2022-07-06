<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi-VN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<%--    <meta name="google-signin-client_id" content="754039935320-bme3bg6e7eg6fu147ae8pg2js6kocnsf.apps.googleusercontent.com">--%>
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>${title}</title>
    <%-- Link icon --%>
    <link href="${applicationScope.header.shortcut}" rel="shortcut icon">
    <!-- Css Styles -->
    <link rel="stylesheet" href="user_page/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/font-awesome.min.css" type="text/css">
    <%--    <link rel="stylesheet" href="user_page/css/elegant-icons.css" type="text/css">--%>
    <link rel="stylesheet" href="user_page/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/owl.carousel.min.css" type="text/css">
    <%--    <link rel="stylesheet" href="user_page/css/slicknav.min.css" type="text/css">--%>
    <link rel="stylesheet" href="user_page/css/style.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/owl.theme.default.min.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/style_home.css" type="text/css">
    <script src="https://accounts.google.com/gsi/client" async defer></script>
</head>
<body>
<form id="form" method="post" class="invisible_type_page" action="handle-google-login" accept-charset="UTF-8">
    <input type="text" name="name" id="name-form">
    <input type="text" name="email" id="email-form">
    <input type="text" name="id" id="id-form">
</form>
<%System.out.println("Co vao day+/+/+/+/+/++/");%>
<%--<jsp:include page="Menu.jsp"></jsp:include>--%>

<%--<jsp:include page="search_bar.jsp"></jsp:include>--%>
<jsp:include page="Menu.jsp"></jsp:include>

<!-- Sign In Section Begin -->
<section class="sign-in spad">
    <div class="container">
        <div class="row sign__in">
            <div class="col-lg-12 col-md-12 col-sm-12">
                <div class="sign__in__form">
                    <form action="handle-login" id="login" method="post" accept-charset="UTF-8">
                        <button><a href="handle-login?login=user" class="btn-dn">ĐĂNG NHẬP</a></button>
                        <button><a href="handle-sign-up" class="btn-dk">ĐĂNG KÝ</a></button>
                        <br>
                        <input type="email" name="email" id="email" placeholder="Nhập email" required>
                        <br>
                        <div class="passwd-wrapper">
                            <input type="password" name="pass" class="passwd" id="pass" placeholder="Mật khẩu" required>
                            <div style="top:33px;right: 30px" class="show-passwd"><i class="fa fa-eye d-block"></i> <i class="fa fa-eye-slash d-none"></i></div>
                        </div>
                        <%--                        <label id="pw-notice" class="invisible notice">Mật khẩu phải dài từ 8 - 25 kí tự và phải chứa cả số và chữ in hoa</label>--%>
                        <br>
                        <input type="submit" name="submit" id="submit" value="Đăng nhập"><br>
                    </form>
                    <button type="button" class=" forget-pass" data-toggle="modal" data-target="#change-pass">Quên Mật Khẩu</button>
                    <h4>Hoặc</h4>
<%--                    <div id="gSignInWrapper">--%>
<%--                        <div id="customBtn" class="customGPlusSignIn">--%>
<%--&lt;%&ndash;                            <span class="icon"></span>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <span class="buttonText">Đăng nhập bằng Google</span>&ndash;%&gt;--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="g-signin2" data-onsuccess="onSignIn"></div>--%>
                    <div id="g_id_onload"
                         data-client_id="754039935320-bme3bg6e7eg6fu147ae8pg2js6kocnsf.apps.googleusercontent.com"
                         data-callback="handleCredentialResponse"
                         data-auto_prompt="false">
                    </div>
                    <div class="g_id_signin"
                         data-type="standard"
                         data-shape="rectangular"
                         data-theme="filled_blue"
                         data-text="signin_with"
                         data-size="large"
                         data-locale="vi"
                         data-logo_alignment="left"
                         data-width="266px"></div>
                    <div class="fb-login-button" data-size="large" data-button-type="login_with" data-layout="default" data-auto-logout-link="false" data-use-continue-as="false" onlogin="checkLoginState()"></div>

<%--                    <fb:login-button--%>
<%--                            scope="public_profile,email"--%>
<%--                            onlogin="checkLoginState();">--%>
<%--                    </fb:login-button>--%>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Sign In Section End -->

<!-- Dialog Forget Password -->
<!-- Dialog Email -->
<%-- dang dang nhap thi phai co modal hien thi quen mat khau  --%>

<div class="modal fade" id="change-pass" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog forget-dialog" role="document">
        <div class="modal-content forget-content">
            <div class="modal-header forget-header">
                <h5 class="modal-title forget-title">Quên Mật Khẩu?</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="x">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="handle-login" method="post">
                <div class="modal-body forget-body">
                    <h5 class="forget-h5">Vui lòng nhập Email bạn đã đăng kí để lấy lại mật khẩu</h5>
                    <input type="email" name="email_forget_pass" id="mail" class="forget-mail" placeholder="thegioidochoiNLU@gmail.com">
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary forget-send" data-toggle="modal" data-target="#notify-forget">GỬI</button>
                </div>
            </form>
        </div>
    </div>
</div>

<%-- Xac thuc da gui email--%>
<%--<c:if test="${status==3}">--%>
<%--<div class="modal fade" id="notify-forget" tabindex="-1" role="dialog" aria-hidden="true">--%>
<%--    <div class="modal-dialog forget-dialog" role="document">--%>
<%--        <div class="modal-content forget-content">--%>
<%--            <div class="modal-header forget-header">--%>
<%--                <h5 class="modal-title forget-title" >Quên Mật Khẩu?</h5>--%>
<%--                <button type="button" class="close" data-dismiss="modal" aria-label="x">--%>
<%--                    <span aria-hidden="true">&times;</span>--%>
<%--                </button>--%>
<%--            </div>--%>
<%--            <div class="modal-body forget-body">--%>
<%--                <!-- <h5 class="forget-h5">Vui lòng nhập Email bạn đã đăng kí để lấy lại mật khẩu</h5> -->--%>
<%--                <div>--%>
<%--                    <p>Email đã được gửi, nếu email đã đăng kí, vui lòng kiểm tra hộp thư!</p>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="modal-footer">--%>
<%--                <button type="button" class="btn btn-primary forget-send" data-dismiss="modal">ĐÓNG</button>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<%--</c:if>--%>

<c:if test="${status==2}">
    <div style="z-index: 10000" class="modal fade" id="wrong_info_login" tabindex="-1" role="dialog"  aria-hidden="true">
        <div class="modal-dialog forget-dialog" role="document">
            <div class="modal-content forget-content">
                <div class="modal-header forget-header">
                    <h5 class="modal-title forget-title">Thông báo</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="x">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body forget-body">
                    <!-- <h5 class="forget-h5">Vui lòng nhập Email bạn đã đăng kí để lấy lại mật khẩu</h5> -->
                    <div>
                        <p>${status_content}</p>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary forget-send" data-dismiss="modal">ĐÓNG</button>
                </div>
            </div>
        </div>
    </div>
</c:if>

<!-- Dialog Forget Password End -->


<jsp:include page="footer.jsp"></jsp:include>

<!-- Js Plugins -->


<script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js"></script>

<script>
    window.onload = function () {
        google.accounts.id.initialize({
            client_id: "754039935320-bme3bg6e7eg6fu147ae8pg2js6kocnsf.apps.googleusercontent.com",
            callback: handleCredentialResponse
        });
        google.accounts.id.prompt(); // also display the One Tap dialog
    }
    function decodeJwtResponse (token) {
        var base64Url = token.split('.')[1];
        var base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
        var jsonPayload = decodeURIComponent(atob(base64).split('').map(function(c) {
            return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
        }).join(''));

        return JSON.parse(jsonPayload);
    };
    function handleCredentialResponse(response) {
        // decodeJwtResponse() is a custom function defined by you
        // to decode the credential response.
        const responsePayload = decodeJwtResponse(response.credential);

        console.log("ID: " + responsePayload.sub);
        console.log('Full Name: ' + responsePayload.name);
        console.log('Given Name: ' + responsePayload.given_name);
        console.log('Family Name: ' + responsePayload.family_name);
        console.log("Image URL: " + responsePayload.picture);
        console.log("Email: " + responsePayload.email);
        $('#name-form').val(responsePayload.name);
        $('#email-form').val(responsePayload.email);
        $('#id-form').val(responsePayload.sub);
        $('#form').submit();
    }


    //FACEBOOK
    window.fbAsyncInit = function() {
        FB.init({
            appId      : '5080308838731051',
            cookie     : true,                     // Enable cookies to allow the server to access the session.
            xfbml      : true,                     // Parse social plugins on this webpage.
            version    : 'v9.0'           // Use this Graph API version for this call.
        });

        FB.getLoginStatus(function(response) {   // Called after the JS SDK has been initialized.
            statusChangeCallback(response);        // Returns the login status.
        });
    };
    function statusChangeCallback(response) {  // Called with the results from FB.getLoginStatus().
        // console.log('statusChangeCallback');
        // console.log(response);                   // The current login status of the person.
        if (response.status === 'connected') {   // Logged into your webpage and Facebook.
            testAPI();
        }
        // else {                                 // Not logged into your webpage or we are unable to tell.
        // document.getElementById('status').innerHTML = 'Please log ' +
        //     'into this webpage.';
        // }
    }


    function checkLoginState() {               // Called when a person is finished with the Login Button.
        FB.getLoginStatus(function(response) {   // See the onlogin handler
            statusChangeCallback(response);
        });
    }




    function testAPI() {                      // Testing Graph API after login.  See statusChangeCallback() for when this call is made.
        FB.api('/me', 'get', { fields: 'id,name,email,gender,birthday,picture' }, function(response) {
            $('#name-form').val(response.name);
            $('#email-form').val(response.email);
            $('#id-form').val(response.id);
            console.log(response.id);
            console.log(response.name);
            console.log(response.email);
            $('#form').submit();

        });
    };

</script>

<script src="user_page/js/jquery-3.3.1.min.js"></script>
<script src="user_page/js/popper.min.js"></script>
<script src="user_page/js/bootstrap.min.js"></script>
<script src="user_page/js/jquery.nice-select.min.js"></script>
<script src="user_page/js/jquery-ui.min.js"></script>
<%--<script src="user_page/js/jquery.slicknav.js"></script>--%>
<%--<script src="user_page/js/mixitup.min.js"></script>--%>
<script src="user_page/js/owl.carousel.min.js"></script>
<script src="user_page/js/main.js"></script>
<script src="user_page/js/main_home.js"></script>
</body>