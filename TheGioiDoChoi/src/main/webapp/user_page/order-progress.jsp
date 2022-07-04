<%--
  User: TRAN NHAT THY
--%>
<%@ page import="vn.thegioidochoi.model.util.Util" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html lang="vi-VN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>${title}</title>
    <link href="img/icon/icon-logo.png" rel="shortcut icon">
    <!-- Css Styles -->
    <link rel="stylesheet" href="user_page/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/owl.theme.default.min.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/style.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/style_home.css" type="text/css">
    <link href="user_page/css/progress-wizard.min.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="Menu.jsp"></jsp:include>

    <section class="follow spad">
        <div class="container">
            <div class="row">
                <div class="col-lg">
                    <div class="follow__style">
                        <div class="order-heading">
                            <h3>
                                Theo dõi đơn hàng #
                                ${order.id}
                            </h3>
                            <button class="cancel-order" <c:if test="${order.status==3}">disabled</c:if>>Hủy Đơn Hàng</button>
                            <div class="view-detail"><a href="order_detail?id=${order.id}">Xem Chi Tiết Đơn Hàng</a></div>

                        </div>
                        <c:if test="${order.status==3}">
                        <ul class="progress-indicator">
                            <li class="completed"> <span class="bubble"></span> Đặt hàng thành công </li>
                            <li class="completed"> <span class="bubble"></span> Đang xử lý </li>
                            <li><span class="bubble"></span> Đang đóng gói </li>
                            <li> <span class="bubble"></span> Đang vận chuyển </li>
                            <li><span class="bubble"></span> Thành công </li>
                        </ul>
                        </c:if>
                        <c:if test="${order.status==4}">
                            <ul class="progress-indicator">
                                <li class="completed"> <span class="bubble"></span> Đặt hàng thành công </li>
                                <li class="completed"> <span class="bubble"></span> Đang xử lý </li>
                                <li class="completed"><span class="bubble"></span> Đang đóng gói </li>
                                <li> <span class="bubble"></span> Đang vận chuyển </li>
                                <li><span class="bubble"></span> Thành công </li>
                            </ul>
                        </c:if>
                        <c:if test="${order.status==5}">
                            <ul class="progress-indicator">
                                <li class="completed"> <span class="bubble"></span> Đặt hàng thành công </li>
                                <li class="completed"> <span class="bubble"></span> Đang xử lý </li>
                                <li class="completed"><span class="bubble"></span> Đang đóng gói </li>
                                <li class="completed"> <span class="bubble"></span> Đang vận chuyển </li>
                                <li><span class="bubble"></span> Thành công </li>
                            </ul>
                        </c:if>
                        <c:if test="${order.status==6}">
                            <ul class="progress-indicator">
                                <li class="completed"> <span class="bubble"></span> Đặt hàng thành công </li>
                                <li class="completed"> <span class="bubble"></span> Đang xử lý </li>
                                <li class="completed"><span class="bubble"></span> Đang đóng gói </li>
                                <li class="completed"> <span class="bubble"></span> Đang vận chuyển </li>
                                <li class="completed"><span class="bubble"></span> Thành công </li>
                            </ul>
                        </c:if>
                        <div class="order-detail">
                            <p class="title">Chi tiết  trạng thái đơn hàng</p>
                            <div class="detail">
                                <div class="border">
                                    <c:forEach items="${progress}" var="p">
                                        <c:set var="date" value="${p.date_created}"></c:set>
                                    <div class="style-order-detail style-normal-0">
                                        <span class="left"><%= Util.dateFormat((Date) pageContext.getAttribute("date")) %></span>
                                        <c:if test="${p.status==6}"><span class="right">Thành công</span></c:if>
                                        <c:if test="${p.status==5}"><span class="right">Đang vận chuyển</span></c:if>
                                        <c:if test="${p.status==4}"><span class="right">Đang đóng gói</span></c:if>
                                        <c:if test="${p.status==3}"><span class="right">Đang xử lý</span></c:if>
                                    </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

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
    <script src="user_page/js/main_home.js"></script>
    <script src="user_page/js/progress-bar.js"></script>
</body>
</html>
