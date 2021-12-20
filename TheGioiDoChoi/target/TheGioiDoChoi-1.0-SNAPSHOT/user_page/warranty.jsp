<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="vi-VN">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
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

<!-- Bao hanh -->
<!-- Sign In Section Begin -->
<section class="sign-in spad">
    <div class="container">
        <div class="title-all">Thông tin đổi trả</div>
        <div class="guarantee_wrap sign__in sign__up">

            <div class="sign__in__form sign__up__form">
                <form action="warrantity_update" method="get">
                    <input type="number" name="user_id" id="user_id" placeholder="Mã khách hàng" value="${user_id}" disabled>
                    <input type="email" name="mail" id="mail" placeholder="Email (*)" value="" required><br>
                    <input type="text" name="war_title" id="war-title" placeholder="Tiêu đề">
                    <textarea name="description" id="description" cols="30" rows="10" placeholder="Mô tả"
                              required></textarea>
                    <input type="submit" name="submit" id="submit" value="Gửi" href=""><br>
                </form>
            </div>

        </div>
    </div>
</section>
<!-- Sign In Section End -->
<!-- End Bao hanh -->

<%--status notification--%>
<c:if test="${status==1}">
    <div class="modal fade" id="notify-forget" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog forget-dialog" role="document">
            <div class="modal-content forget-content">
                <div class="modal-header forget-header">
                    <h5 class="modal-title forget-title" >Yêu cầu bảo hành đã thành công</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="x">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body forget-body">
                    <!-- <h5 class="forget-h5">Vui lòng nhập Email bạn đã đăng kí để lấy lại mật khẩu</h5> -->
                    <div>
                        <p>Yêu cầu bảo hành sản phẩm của bạn đã thành công. Bạn vui lòng chờ bên cửa hàng xem xét.
                        Hãy đợi phản hồi từ chúng tôi qua mail của bạn. Cảm ơn bạn đã sử dụng dịch vụ!
                        </p>
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