<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<%System.out.println("co vao day nua ne________________");%>
<jsp:include page="Menu.jsp"></jsp:include>

<jsp:include page="search_bar.jsp"></jsp:include>

<section class="sign-in spad">
    <div class="container">
        <div class="row sign__in sign__up">
            <div class="col-lg">
                <div class="sign__in__form sign__up__form">
                    <form action="handle-login" id="formPass" method="post">
                        <h5 class="title-all">Đổi mật khẩu</h5>
                        <input type="text" name="key" id="key" value="${key}"  style="display: none" ><br>
                        <input type="email" name="email-change-pass" id="email" placeholder="Email (*)" required><br>

                        <input type="password" name="new-pass" id="passwd" placeholder="Mật Khẩu" required><br>
                        <label id="mk-notice" class="invisible" style="color: red">Mật khẩu phải dài từ 8-25 kí tự và phải chứa cả số và chữ in hoa</label>

                        <input type="password" name="new-pass-con" id="pass-again" placeholder="Nhập Lại Mật Khẩu" required><br>
                        <label class="invisible" id="mka-notice" style="color: red">Mật khẩu phải trùng khớp với mật khẩu đã nhập</label>

                        <input type="submit" name="submit" id="submit" value="ĐĂNG KÝ"><br>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="footer.jsp"></jsp:include>

<%--<script></script>--%>
<%--<script src="js/jquery-3.3.1.min.js"></script>--%>
<script src="user_page/js/jquery-3.3.1.min.js"></script>
<script src="user_page/js/bootstrap.min.js"></script>
<script src="user_page/js/jquery.nice-select.min.js"></script>
<script src="user_page/js/jquery-ui.min.js"></script>
<script src="user_page/js/jquery.slicknav.js"></script>
<script src="user_page/js/mixitup.min.js"></script>
<script src="user_page/js/owl.carousel.min.js"></script>
<script src="user_page/js/main.js"></script>
</body>