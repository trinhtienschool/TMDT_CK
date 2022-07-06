<%--
  Created by IntelliJ IDEA.
  User: Trinh Quang Tien
  Date: 25/12/2020
  Time: 20:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!-- Popup footer -->
<%--<div class="popup-footer">--%>
<%--    <a href="${applicationScope.social_media.fb}"><i class="fa fa-comments" aria-hidden="true"></i></a>--%>
<%--    <button id="scroll-top" class="circle-wrap" href=""><i class="fa fa-angle-up " aria-hidden="true"></i></button>--%>
<%--</div>--%>
<!-- End popup footer -->

<footer class="ps-footer ps-footer--3 ps-footer--kids">
    <div class="container">
        <div class="ps-block--site-features ps-block--site-features-2">
            <div class="ps-block__item">
                <div class="ps-block__left"><i class="fa fa-paper-plane-o"></i></div>
                <div class="ps-block__right">
                    <h4>Miễn phí vận chuyển</h4>
                    <p>Cho đơn hàng trên 300.000đ</p>
                </div>
            </div>
            <div class="ps-block__item">
                <div class="ps-block__left"><i class="fa fa-refresh"></i></div>
                <div class="ps-block__right">
                    <h4>5 ngày hoàn trả</h4>
                    <p>Nếu sản phẩm có vấn đề</p>
                </div>
            </div>
            <div class="ps-block__item">
                <div class="ps-block__left"><i class="fa fa-credit-card"></i></div>
                <div class="ps-block__right">
                    <h4>Thanh toán an toàn</h4>
                    <p>100% an toàn khi thanh toán</p>
                </div>
            </div>
            <div class="ps-block__item">
                <div class="ps-block__left"><i class="fa fa-comments-o"></i></div>
                <div class="ps-block__right">
                    <h4>Hỗ trợ 24/7</h4>
                    <p>Hỗ trợ tận tâm</p>
                </div>
            </div>
        </div>
        <div class="ps-footer__content">
            <div class="row">
                <div class="col-xl-8 col-lg-8 col-md-12 col-sm-12 col-12 ">
                    <div class="row">
                        <div class="col-xl-6 col-lg-6 col-md-4 col-sm-12 col-12 ">
                            <aside class="widget widget_footer">
                                <h4 class="widget-title">Thông tin liên lạc</h4>
                                <ul class="ps-list--link">
                                    <li>Địa chỉ: ${applicationScope.address.get(0).address}</li>
                                    <li>Điện thoại: ${applicationScope.address.get(0).phone}</li>
                                    <li>Email: ${applicationScope.address.get(0).email}</li>
                                </ul>
                            </aside>
                        </div>
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12 ">
                            <aside class="widget widget_footer">
                                <h4 class="widget-title">Địa chỉ bán lẻ</h4>
                                <ul class="ps-list--link">
                                    <li>Địa chỉ: ${applicationScope.address.get(1).address}</li>
                                    <li>Điện thoại: ${applicationScope.address.get(1).phone}</li>
                                    <li>Email: ${applicationScope.address.get(1).email}</li>
                                </ul>
                            </aside>
                        </div>

                    </div>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-12 col-sm-12 col-12 ">
                    <aside class="widget widget_newletters widget_footer">
                        <h4 class="widget-title">Tin tức</h4>
                        <p>Đăng kí để nhận thông báo khuyến mãi mới nhất</p>
                        <form class="ps-form--newletter" action="#" method="get">
                            <div class="form-group--nest">
                                <input class="form-control" type="text" placeholder="Email"/>
                                <button class="ps-btn">Gửi</button>
                            </div>

                            <ul class="ps-list--social">
                                <li><a class="facebook" href="${applicationScope.social_media.fb}"><i
                                        class="fa fa-facebook"></i></a></li>
                                <li><a class="twitter" href="${applicationScope.social_media.tw}"><i
                                        class="fa fa-twitter"></i></a></li>
                                <li><a class="instagram" href="${applicationScope.social_media.in}"><i
                                        class="fa fa-instagram"></i></a></li>
                            </ul>
                        </form>
                    </aside>
                </div>
            </div>
        </div>


    </div>
</footer>
<%--<footer class="footer spad">--%>
<%--    <div class="container">--%>
<%--        <div class="row">--%>
<%--            <div class="col-lg-4 col-md-6 col-sm-6">--%>
<%--                <div class="footer__about">--%>
<%--                    <div class="footer__about__logo">--%>
<%--                        <a href="home"><img src="${applicationScope.header.logo}" alt=""></a>--%>
<%--                    </div>--%>
<%--                    <ul>--%>
<%--                        <li>Địa chỉ: ${applicationScope.address.get(0).address}</li>--%>
<%--                        <li>Điện thoại: ${applicationScope.address.get(0).phone}</li>--%>
<%--                        <li>Email: ${applicationScope.address.get(0).email}</li>--%>
<%--                    </ul>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col-lg-4 col-md-6 col-sm-6 ">--%>
<%--                <div class="footer__widget no_flex">--%>
<%--                    <h6>Địa chỉ bán lẻ</h6>--%>
<%--                    <ul>--%>
<%--                        <li>Địa chỉ: ${applicationScope.address.get(1).address}</li>--%>
<%--                        <li>Điện thoại: ${applicationScope.address.get(1).phone}</li>--%>
<%--                        <li>Email: ${applicationScope.address.get(1).email}</li>--%>
<%--                    </ul>--%>

<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col-lg-4 col-md-12">--%>
<%--                <div class="footer__widget no_flex">--%>
<%--                    <h6>Để lại thông tin liên hệ</h6>--%>
<%--                    <p>Sản phẩm mới nhất, chương trình khuyến mãi</p>--%>
<%--                    <form action="email_footer" method="get">--%>
<%--                        <input type="email" placeholder="Email" name="email">--%>
<%--                        <button type="submit" class="site-btn">Gửi</button>--%>
<%--                    </form>--%>
<%--                    <a class="term" href="TermAndCondition_direct">Xem thêm chính sách và điều khoản <i--%>
<%--                            class="fa fa-arrow-right"></i></a>--%>
<%--                    <div class="footer__widget__social">--%>
<%--                        <a href="${applicationScope.social_media.fb}"><i class="fa fa-facebook"></i></a>--%>
<%--                        <a href="${applicationScope.social_media.in}"><i class="fa fa-instagram"></i></a>--%>
<%--                        <a href="${applicationScope.social_media.tw}"><i class="fa fa-twitter"></i></a>--%>
<%--                        <a href="${applicationScope.social_media.pi}"><i class="fa fa-pinterest-p"></i></a>--%>

<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</footer>--%>


<!-- Footer Section Begin -->
<%--<footer class="footer spad">--%>
<%--    <div class="container">--%>
<%--        <div class="row">--%>
<%--            <div class="col-lg-4 col-md-6 col-sm-6">--%>
<%--                <div class="footer__about">--%>
<%--                    <div class="footer__about__logo">--%>
<%--                        <a href="home"><img src="${applicationScope.header.logo}" alt=""></a>--%>
<%--                    </div>--%>
<%--                    <ul>--%>
<%--                        <li>Địa chỉ: ${applicationScope.address.get(0).address}</li>--%>
<%--                        <li>Điện thoại: ${applicationScope.address.get(0).phone}</li>--%>
<%--                        <li>Email: ${applicationScope.address.get(0).email}</li>--%>
<%--                    </ul>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col-lg-4 col-md-6 col-sm-6 ">--%>
<%--                <div class="footer__widget no_flex">--%>
<%--                    <h6>Địa chỉ bán lẻ</h6>--%>
<%--                    <ul>--%>
<%--                        <li>Địa chỉ: ${applicationScope.address.get(1).address}</li>--%>
<%--                        <li>Điện thoại: ${applicationScope.address.get(1).phone}</li>--%>
<%--                        <li>Email: ${applicationScope.address.get(1).email}</li>--%>
<%--                    </ul>--%>

<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col-lg-4 col-md-12">--%>
<%--                <div class="footer__widget no_flex">--%>
<%--                    <h6>Để lại thông tin liên hệ</h6>--%>
<%--                    <p>Sản phẩm mới nhất, chương trình khuyến mãi</p>--%>
<%--                    <form action="email_footer" method="get">--%>
<%--                        <input type="email" placeholder="Email" name="email">--%>
<%--                        <button type="submit" class="site-btn">Gửi</button>--%>
<%--                    </form>--%>
<%--                    <a class="term" href="TermAndCondition_direct">Xem thêm chính sách và điều khoản <i class="fa fa-arrow-right"></i></a>--%>
<%--                    <div class="footer__widget__social">--%>
<%--                        <a href="${applicationScope.social_media.fb}"><i class="fa fa-facebook"></i></a>--%>
<%--                        <a href="${applicationScope.social_media.in}"><i class="fa fa-instagram"></i></a>--%>
<%--                        <a href="${applicationScope.social_media.tw}"><i class="fa fa-twitter"></i></a>--%>
<%--                        <a href="${applicationScope.social_media.pi}"><i class="fa fa-pinterest-p"></i></a>--%>

<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</footer>--%>

<!-- Footer Section End -->


