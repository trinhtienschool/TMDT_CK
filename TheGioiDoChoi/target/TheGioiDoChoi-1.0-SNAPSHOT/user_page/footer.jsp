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
<div class="popup-footer">
    <a href="${applicationScope.social_media.fb}"><i class="fa fa-comments" aria-hidden="true"></i></a>
    <button id="scroll-top" class="circle-wrap" href=""><i class="fa fa-angle-up " aria-hidden="true"></i></button>
</div>
<!-- End popup footer -->

<!-- Footer Section Begin -->
<footer class="footer spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="footer__about">
                    <div class="footer__about__logo">
                        <a href="home"><img src="${applicationScope.header.logo}" alt=""></a>
                    </div>
                    <ul>
                        <li>Địa chỉ: ${applicationScope.address.get(0).address}</li>
                        <li>Điện thoại: ${applicationScope.address.get(0).phone}</li>
                        <li>Email: ${applicationScope.address.get(0).email}</li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6 ">
                <div class="footer__widget no_flex">
                    <h6>Địa chỉ bán lẻ</h6>
                    <ul>
                        <li>Địa chỉ: ${applicationScope.address.get(1).address}</li>
                        <li>Điện thoại: ${applicationScope.address.get(1).phone}</li>
                        <li>Email: ${applicationScope.address.get(1).email}</li>
                    </ul>

                </div>
            </div>
            <div class="col-lg-4 col-md-12">
                <div class="footer__widget no_flex">
                    <h6>Để lại thông tin liên hệ</h6>
                    <p>Sản phẩm mới nhất, chương trình khuyến mãi</p>
                    <form action="email_footer" method="get">
                        <input type="email" placeholder="Email" name="email">
                        <button type="submit" class="site-btn">Gửi</button>
                    </form>
                    <a class="term" href="TermAndCondition_direct">Xem thêm chính sách và điều khoản <i class="fa fa-arrow-right"></i></a>
                    <div class="footer__widget__social">
                        <a href="${applicationScope.social_media.fb}"><i class="fa fa-facebook"></i></a>
                        <a href="${applicationScope.social_media.in}"><i class="fa fa-instagram"></i></a>
                        <a href="${applicationScope.social_media.tw}"><i class="fa fa-twitter"></i></a>
                        <a href="${applicationScope.social_media.pi}"><i class="fa fa-pinterest-p"></i></a>

                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>

<!-- Footer Section End -->


