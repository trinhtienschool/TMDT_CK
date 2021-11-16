<%@ page import="vn.thegioicaycanh.model.util.Util" %><%--
  Created by IntelliJ IDEA.
  User: Trinh Quang Tien
  Date: 27/01/2021
  Time: 3:04
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="vi-VN">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Thanh toán</title>
    <link href="img/icon/icon-logo.png" rel="shortcut icon">


    <!-- Css Styles -->
    <link rel="stylesheet" href="user_page/css/bootstrap.min.css" type="text/css" />
    <link rel="stylesheet" href="user_page/css/font-awesome.min.css" type="text/css" />

    <link rel="stylesheet" href="user_page/css/elegant-icons.css" type="text/css" />
    <link rel="stylesheet" href="user_page/css/nice-select.css" type="text/css" />
    <link rel="stylesheet" href="user_page/css/jquery-ui.min.css" type="text/css" />
    <link rel="stylesheet" href="user_page/css/owl.carousel.min.css" type="text/css" />
    <link rel="stylesheet" href="user_page/css/slicknav.min.css" type="text/css" />
    <link rel="stylesheet" href="user_page/css/style.css" type="text/css" />
</head>

<body>
<jsp:include page="Menu.jsp"></jsp:include>
<jsp:include page="search_bar.jsp"></jsp:include>
<!-- Checkout Section Begin -->
<section class="checkout spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h6>
                    <span class="icon_tag_alt"></span> Đã có mã giảm giá?
                    <a href="cart">nhấn tại đây</a> để lấy mã giảm giá
                </h6>
            </div>
        </div>
        <div class="checkout__form">
            <h4>Chi tiết đơn hàng</h4>
            <form action="order-handle" method="post">
                <div class="row">
                    <div class="col-lg-8 col-md-6">
                        <div class="checkout__input">
                            <p>Họ và tên<span>*</span></p>
                            <input style="color:black" type="text" name="name" <c:if test="${sessionScope.user_name!=null}">value="${sessionScope.user_name}"</c:if> required/>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>Điện thoại<span>*</span></p>
                                    <input style="color:black"  type="tel" name="phone"

                                           <c:if test="${sessionScope.user_phone!=null}">value="${sessionScope.user_phone}"</c:if>
                                           required/>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>Email<span>*</span></p>
                                    <input style="color:black" type="email" name="email"
                                           <c:if test="${sessionScope.user_mail!=null}">value="${sessionScope.user_mail}"</c:if>
                                           required/>
                                </div>
                            </div>
                        </div>
                        <div class="checkout__input">
                            <p>Tỉnh / Thành phố<span>*</span></p>
                            <input style="color:black" type="text" name="province"
                                    <c:if test="${province!=null}">value="${province}" </c:if>
                                   required/>
                        </div>
                        <div class="checkout__input">
                            <p>Huyện / Quận<span>*</span></p>
                            <input style="color:black" type="text" name="district"
                                   <c:if test="${district!=null}">value="${district}" </c:if>
                                   required/>
                        </div>
                        <div class="checkout__input">
                            <p>Xã / Phường<span>*</span></p>
                            <input style="color:black" type="text" name="sub-district"
                                   <c:if test="${sd!=null}">value="${sd}" </c:if>
                                   required/>
                        </div>
                        <div class="checkout__input">
                            <p>Địa chỉ chi tiết<span>*</span></p>
                            <input style="color:black"
                                    type="text"
                                    placeholder="Số nhà / Đường"
                                    class="checkout__input__add" name="d-address"
                                    <c:if test="${detail!=null}">value="${detail}" </c:if>
                                    required
                            />

                        </div>


                        <c:if test="${sessionScope.user_id==null}">
                        <div class="checkout__input">
                            <p>
                                Để mua hàng khách hàng phải tạo tài khoản. Nếu khách
                                hàng đã có tài khoản vui lòng đăng nhập hoặc nhập mật khẩu để tạo tài khoản
                                với thông tin bên trên.
                            </p>
                            <div class="checkout__input">
                                <p>Mật khẩu tài khoản<span>*</span></p>
                                <input style="color:black" id="pass" type="password" name="password"

                                       required/>
                            </div>
                        </div>
                        </c:if>


                        <div class="checkout__input">
                            <p>Lưu ý khi vận chuyển</p>
                            <input style="color:black"
                                    type="text" name="note"
                                    placeholder="Lưu ý về đơn hàng hoặc lưu ý khi vận chuyển."
                            />
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="checkout__order">
                            <h4>Đơn hàng</h4>
                            <div class="checkout__order__subtotal">
                                Tổng:<span><%=Util.formatCurrency((double)request.getAttribute("price"))%></span>
                            </div>
                            <div class="checkout__order__subtotal">
                                Phí vận chuyển: <span><%=Util.formatCurrency((double)request.getAttribute("fee_ship"))%></span>
                            </div>

                            <div class="checkout__order__total">
                                Thành tiền:<span><%=Util.formatCurrency((double)request.getAttribute("total_price"))%></span>
                            </div>

                            <button  type="submit" class="site-btn">Đặt hàng</button>
<%--                            id="checkout-btn"--%>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>
<c:if test="${type=='err'}">
    <div class="modal fade" id="wrong_info_login" tabindex="-1" role="dialog"  aria-hidden="true">
        <div class="modal-dialog forget-dialog" role="document">
            <div class="modal-content forget-content">
                <div class="modal-header forget-header">
                    <h5 class="modal-title forget-title">Thanh toán không thành công!</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="x">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body forget-body">
                    <!-- <h5 class="forget-h5">Vui lòng nhập Email bạn đã đăng kí để lấy lại mật khẩu</h5> -->
                    <div>
                        <p>Đã xảy ra lỗi trong quá trình thanh toán!</p>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary forget-send" data-dismiss="modal">ĐÓNG</button>
                </div>
            </div>
        </div>
    </div>
</c:if>
<c:if test="${type=='suc'}">
    <div class="modal fade" id="wrong_info_login" tabindex="-1" role="dialog"  aria-hidden="true">
        <div class="modal-dialog forget-dialog" role="document">
            <div class="modal-content forget-content">
                <div class="modal-header forget-header">
                    <h5 class="modal-title forget-title">Thanh toán thành công!</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="x">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body forget-body">
                    <!-- <h5 class="forget-h5">Vui lòng nhập Email bạn đã đăng kí để lấy lại mật khẩu</h5> -->
                    <div>
                        <p>Khách hàng đã thanh toán thành công!</p>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary forget-send" data-dismiss="modal">ĐÓNG</button>
                </div>
            </div>
        </div>
    </div>
</c:if>
<!-- Checkout Section End -->
<!-- Modal -->
<%--<div class="modal fade" id="momo-payment" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">--%>
<%--    <div class="modal-dialog modal-dialog-centered" role="document">--%>
<%--        <div class="modal-content">--%>
<%--            <div class="modal-header">--%>
<%--                <h5 class="modal-title" id="exampleModalLongTitle">Quét QR</h5>--%>
<%--                <button type="button" class="close" data-dismiss="modal" aria-label="Close">--%>
<%--                    <span aria-hidden="true">&times;</span>--%>
<%--                </button>--%>
<%--            </div>--%>
<%--            <div class="modal-body">--%>
<%--                <div class="container">--%>
<%--                    <img src="img/qr_code/qr_code1.png" alt="">--%>
<%--                    <p>Vui lòng mở momo và quét QR code trong vòng <span id="count-down-time">200</span> giây</p>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<!-- ......................................................................................-->
<!-- Kết thúc phần xử lí -->

<%--<!-- Popup footer -->--%>
<%--<div class="popup-footer">--%>
<%--    <a href=""><i class="fa fa-comments" aria-hidden="true"></i></a>--%>
<%--    <button id="scroll-top" class="circle-wrap" href=""><i class="fa fa-angle-up " aria-hidden="true"></i></button>--%>
<%--</div>--%>
<%--<!-- End popup footer -->--%>

<%--<!-- Footer Section Begin -->--%>
<%--<footer class="footer spad">--%>
<%--    <div class="container">--%>
<%--        <div class="row">--%>
<%--            <div class="col-lg-4 col-md-6 col-sm-6">--%>
<%--                <div class="footer__about">--%>
<%--                    <div class="footer__about__logo">--%>
<%--                        <a href="./index.html"><img src="img/banner/bieutuong_off.png" alt=""></a>--%>
<%--                    </div>--%>
<%--                    <ul>--%>
<%--                        <li>Địa chỉ: Đại học Nông Lâm TP.HCM</li>--%>
<%--                        <li>Điện thoại: +84353535355</li>--%>
<%--                        <li>Email: thegioicaycanhNLU@gmail.com</li>--%>
<%--                    </ul>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col-lg-4 col-md-6 col-sm-6 ">--%>
<%--                <div class="footer__widget no_flex">--%>
<%--                    <h6>Địa chỉ bán lẻ</h6>--%>
<%--                    <ul>--%>
<%--                        <li>Địa chỉ: KIOT 35, đường số 6, Đại học Nông Lâm</li>--%>
<%--                        <li>Điện thoại: +84353535355</li>--%>
<%--                        <li>Email: thegioicaycanhNLU@gmail.com</li>--%>
<%--                    </ul>--%>

<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col-lg-4 col-md-12">--%>
<%--                <div class="footer__widget no_flex">--%>
<%--                    <h6>Để lại thông tin liên hệ</h6>--%>
<%--                    <p>Sản phẩm mới nhất, chương trình khuyến mãi</p>--%>
<%--                    <form action="#">--%>
<%--                        <input style="color:black" type="text" placeholder="Email">--%>
<%--                        <button type="submit" class="site-btn">Gửi</button>--%>
<%--                    </form>--%>
<%--                    <a class="term" href="terms-and-conditions.html">Xem thêm chính sách và điều khoản <i class="fa fa-arrow-right"></i></a>--%>
<%--                    <div class="footer__widget__social">--%>
<%--                        <a href="#"><i class="fa fa-facebook"></i></a>--%>
<%--                        <a href="#"><i class="fa fa-instagram"></i></a>--%>
<%--                        <a href="#"><i class="fa fa-twitter"></i></a>--%>
<%--                        <a href="#"><i class="fa fa-pinterest"></i></a>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</footer>--%>

<!-- Footer Section End -->
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

