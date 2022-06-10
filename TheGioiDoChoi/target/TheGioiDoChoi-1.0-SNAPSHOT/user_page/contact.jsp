<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="vi-VN">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>${title}</title>
    <%-- Link icon --%>
    <link href="${applicationScope.header.shortcut}" rel="shortcut icon">
    <!-- Css Styles -->
    <link rel="stylesheet" href="user_page/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/style.css" type="text/css">
</head>

<body>
<jsp:include page="Menu.jsp"></jsp:include>

<jsp:include page="search_bar.jsp"></jsp:include>

    <!-- Contact Section Begin -->
    <section class="contact spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                    <div class="contact__widget">
                        <span class="icon_phone"></span>
                        <h4>Liên hệ</h4>
                        <p>+${applicationScope.address.get(0).phone}</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                    <div class="contact__widget">
                        <span class="icon_pin_alt"></span>
                        <h4>Địa chỉ</h4>
                        <p>${applicationScope.address.get(0).address}</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                    <div class="contact__widget">
                        <span class="icon_clock_alt"></span>
                        <h4>Giờ mở cửa</h4>
                        <p>${applicationScope.address.get(0).timeOpen}</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                    <div class="contact__widget">
                        <span class="icon_mail_alt"></span>
                        <h4>Email</h4>
                        <p>${applicationScope.address.get(0).email}</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Contact Section End -->

    <!-- Map Begin -->
    <div class="col-lg-12">
        <div class="map">
            <iframe
                src="${applicationScope.address.get(0).map}"
                height="500" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
            <div class="map-inside">
                <i class="icon_pin"></i>
                <div class="inside-widget">
                    <h4>TP.HCM</h4>
                    <ul>
                        <li>Liên hệ: +${applicationScope.address.get(0).phone}</li>
                        <li>Địa chỉ: ${applicationScope.address.get(0).address}</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- Map End -->

    <!-- Contact Form Begin -->
    <div class="contact-form spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="contact__form__title">
                        <h2>Đóng góp ý kiến</h2>
                    </div>
                </div>
            </div>
            <form action="contact" method="post" accept-charset="UTF-8">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <input type="text" placeholder="Họ tên:" name="fullname">
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <input type="text" placeholder="Email:" name="emailaddress">
                    </div>
                    <div class="col-lg-12 text-center">
                        <textarea placeholder="Ý kiến của bạn là:" name="content"></textarea>
                        <button type="submit" class="site-btn">Gửi</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- Contact Form End -->

<%--status notification--%>

<c:if test="${status==1}">
    <div class="modal fade" id="notify-forget" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog forget-dialog" role="document">
            <div class="modal-content forget-content">
                <div class="modal-header forget-header">
                    <h5 class="modal-title forget-title" >Đóng góp ý kiến được gửi thành công</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="x">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body forget-body">
                    <!-- <h5 class="forget-h5">Vui lòng nhập Email bạn đã đăng kí để lấy lại mật khẩu</h5> -->
                    <div>
                        <p>Đóng góp ý kiến của bạn được gửi thành công. Cảm ơn bạn đã đóng góp ý kiến!</p>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary forget-send" data-dismiss="modal">ĐÓNG</button>
                </div>
            </div>
        </div>
    </div>
</c:if>

<jsp:include page="footer.jsp"></jsp:include>

<!-- Js Plugins -->
<script src="user_page/js/jquery-3.3.1.min.js"></script>
<script src="user_page/js/bootstrap.min.js"></script>
<script src="user_page/js/jquery.nice-select.min.js"></script>
<script src="user_page/js/jquery-ui.min.js"></script>
<script src="user_page/js/jquery.slicknav.js"></script>
<script src="user_page/js/mixitup.min.js"></script>
<script src="user_page/js/owl.carousel.min.js"></script>
<script src="user_page/js/main.js"></script>
</body>

</html>