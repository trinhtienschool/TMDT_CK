<%--
  Created by IntelliJ IDEA.
  User: MyPC
  Date: 11/20/2021
  Time: 10:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
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
<%--Aboutus section begin--%>
<%--<header>--%>
<%--    <div id="homeFullScreen">--%>
<%--        <div class="header-text">--%>
<%--            <h1>THẾ GIỚI ĐỒ CHƠI</h1>--%>
<%--            <div class="vertical-line"></div>--%>
<%--            <p>--%>
<%--                SÀN THƯƠNG MẠI ĐIỆN TỬ CHUYÊN CUNG CẤP ĐỒ CHƠI--%>
<%--                <!-- <br />--%>
<%--                INTERDUM VIVAMUS DONCE SED LIBERO. -->--%>
<%--            </p>--%>
<%--        </div><!-- End HeaderText -->--%>
<%--    </div><!-- End homeFullScreen -->--%>
<%--</header><!-- End Header -->--%>

<!-- Feature -->

<section class="feature">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-sm-6">
                <div class="feature-box">
                    <h1>Giới thiệu</h1>
                    <p>Đây là sàn thương mại điện tử đồ chơi cho phép mọi cá nhân hay tổ chức có thể đăng tin, bán hàng trực tiếp trên website.
                    </p>
                </div>
            </div><!-- End col-md-6 -->
            <div class="col-md-6 col-sm-6 nopadding">
                <img src="https://i-giadinh.vnecdn.net/2020/10/02/1a-1601625636-1601625649-2142-8981-3585-1601635885_680x0.jpg">
            </div><!-- End col-md-6 -->

            <div class="clearfix"></div><!-- End clearfix -->

            <div class="col-md-6 col-sm-6 nopadding">
                <img src="https://i-giadinh.vnecdn.net/2020/10/02/1a-1601625636-1601625649-2142-8981-3585-1601635885_680x0.jpg">
            </div><!-- End col-md-6 -->
            <div class="col-md-6 col-sm-6">
                <div class="feature-box">
                    <h1>Mục tiêu</h1>
                    <p>Tạo ra một sàn giao dịch đồ chơi để giải quyết các khó khăn trong quá trình mua bán. Từ đó có thể thu được lợi nhuận, đồng thời thúc đẩy dự án phát triễn mạnh mẽ và rộng rãi hơn.
                    </p>
                </div>
            </div><!-- End col-md-6 -->
        </div>
    </div>
</section>

<!-- portfolio -->

<section class="portfolio">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1 class="heading">Hình ảnh về công ty chúng tôi</h1>
            </div><!-- End col-md-12 -->

            <div class="col-md-4 col-sm-4">
                <img src="https://i-giadinh.vnecdn.net/2020/10/02/1a-1601625636-1601625649-2142-8981-3585-1601635885_680x0.jpg">
            </div><!-- End col-md-4 -->
            <div class="col-md-4 col-sm-4">
                <img src="https://i-giadinh.vnecdn.net/2020/10/02/1a-1601625636-1601625649-2142-8981-3585-1601635885_680x0.jpg">
            </div><!-- End col-md-4 -->
            <div class="col-md-4 col-sm-4 last-img">
                <img src="https://i-giadinh.vnecdn.net/2020/10/02/1a-1601625636-1601625649-2142-8981-3585-1601635885_680x0.jpg">
            </div><!-- End col-md-4 -->

            <div class="clearfix"></div><!-- End clearfix -->

            <div class="col-md-4 col-sm-4">
                <img src="https://i-giadinh.vnecdn.net/2020/10/02/1a-1601625636-1601625649-2142-8981-3585-1601635885_680x0.jpg">
            </div><!-- End col-md-4 -->
            <div class="col-md-4 col-sm-4">
                <img src="https://i-giadinh.vnecdn.net/2020/10/02/1a-1601625636-1601625649-2142-8981-3585-1601635885_680x0.jpg">
            </div><!-- End col-md-4 -->
            <div class="col-md-4 col-sm-4 last-img">
                <img src="https://i-giadinh.vnecdn.net/2020/10/02/1a-1601625636-1601625649-2142-8981-3585-1601635885_680x0.jpg">
            </div><!-- End col-md-4 -->
        </div><!-- End row -->
    </div><!-- End container -->
</section>

<!-- Call to Action -->
<%--<section class="call-top-action text-center">--%>
<%--    <div class="container">--%>
<%--        <div class="row">--%>
<%--            <div class="col-md-12">--%>
<%--                <h1>Chìa khóa thành công</h1>--%>
<%--                <p>Tập trung và hướng đến khách hàng--%>
<%--                    <br />--%>
<%--                <p>Chất lượng sản phẩm tốt và đa dạng--%>
<%--                    <br />--%>
<%--                <p>Đảm bảo và chịu trách nhiệm cho lợi ích khách hàng--%>
<%--                </p>--%>
<%--                <!-- <span>Trân trọng</span>	 -->--%>
<%--            </div><!-- End col-md-12 -->--%>
<%--        </div><!-- End row -->--%>
<%--    </div><!-- End container -->--%>
<%--</section>--%>

<%--Aboutus section end--%>

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
