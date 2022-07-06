<%@ page import="vn.thegioidochoi.model.util.Util" %><%--
  Created by IntelliJ IDEA.
  User: Trinh Quang Tien
  Date: 26/12/2020
  Time: 21:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!-- Page Preloder -->
<%--<div id="preloder">--%>
<%--    <div class="loader"></div>--%>
<%--</div>--%>

<!-- Humberger Begin -->
<%--Start--%>
<div class="ps-promotion-kids">
    <div class="container"><a href="#"><img src="imgs/header/khuyen_mai.png" alt=""></a></div>
</div>
<header class="header header--standard header--kids" data-sticky="true">
    <div class="header__top">
        <div class="container">
            <div class="header__left"><a class="ps-logo" href="/"><img src="${applicationScope.header.logo}"
                                                                                alt=""></a>
                <div class="menu--product-categories">
                    <div class="menu__toggle"><i class="icon-menu"></i><span>Danh mục</span></div>
                    <div class="menu__content">
                        <ul class="menu--dropdown">
                            <c:forEach var="cate" items="${applicationScope.category}">
                                <c:if test="${cate.master_id == cate.id && cate.parent==0 }">
                                    <li><a href="#.html">${cate.name}</a>
                                </c:if>
                                <c:if test="${cate.master_id == cate.id && cate.parent==1 }">
                                    <li class="menu-item-has-children has-mega-menu">
                                        <a href="#">${cate.name}</a>
                                        <div class="mega-menu">
                                            <div class="mega-menu__column">
                                                <h4>${cate.name}
                                                </h4>
                                                <ul class="mega-menu__list">
                                                    <c:forEach var="subcate" items="${cate.subcategories}">
                                                        <li><a href="#.html">${subcate.name}</a>
                                                        </li>
                                                    </c:forEach>
                                                </ul>
                                            </div>

                                        </div>
                                    </li>
                                </c:if>

                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="header__center">
                <form class="ps-form--quick-search" action="shopping" method="get">
                    <input class="form-control" type="text" name="keyword" placeholder="Tìm đồ chơi...">
                    <button><i class="fa fa-search"></i></button>
                </form>
            </div>
            <div class="header__right">
                <div class="header__actions">
                <c:if test="${sessionScope.user_id!=null}">
                <a class="header__extra" href="#"><i class="icon-heart"></i><span><i>${sessionScope.favourist.size}</i></span></a>
                    </c:if>
                    <c:if test="${sessionScope.user_id==null}">
                    <a class="header__extra" style="visibility: hidden" href="#"><i class="icon-heart"></i><span><i>0</i></span></a>
                        </c:if>
                    <div class="ps-cart--mini"><a class="header__extra" href="#"><i class="icon-bag2"></i><span><i>${sessionScope.cart.size}</i></span></a>
                        <div class="ps-cart__content">
                            <div class="ps-cart__items">

                                <c:forEach var="ci" items="${sessionScope.cart.getProducts().values()}">
                                <div class="ps-product--cart-mobile">
                                    <div class="ps-product__thumbnail"><a href="#"><img
                                            src="${ci.img}" alt=""></a></div>
                                    <div class="ps-product__content"><a class="ps-product__remove" href="#"><i
                                            class="icon-cross"></i></a><a href="product-default.html">${ci.name}</a>
<%--                                        <p><strong>Sold by:</strong> YOUNG SHOP</p>--%>
                                        <c:set var="ps" value="${ci.price_sale}"></c:set>
                                        <c:set var="p" value="${ci.price}"></c:set>
                                        <c:set var="total" value="${ci.totalPrice}"></c:set>
<%--                                        <small>1 x $59.99</small>--%>
                                        <p>
                                        <small>
                                            ${ci.quantity} x
                                            <c:if test="${ci.sale==true}">
                                                <%=Util.formatCurrency((double) pageContext.getAttribute("ps"))%>
                                                <span style="text-decoration: line-through;margin-left: 5px;color: gray;font-size: 13px">
                                <%=Util.formatCurrency((double) pageContext.getAttribute("p"))%>
                                </span>
                                            </c:if>
                                            <c:if test="${ci.sale==false}">
                                                <%=Util.formatCurrency((double) pageContext.getAttribute("p"))%>
                                            </c:if>
                                        </small>
                                        </p>
                                    </div>
                                </div>
                                </c:forEach>
                            </div>
                            <div class="ps-cart__footer">
                                <c:set var="tc" value="${sessionScope.cart.totalPrice}"></c:set>
                                <h3>Tổng: <strong><%=Util.formatCurrency((double) pageContext.getAttribute("tc"))%></strong></h3>

                                    <figure><a class="ps-btn" href="cart" style="color: white">Giỏ hàng</a><a class="ps-btn"
                                                                                                    href="checkout" style="color: white">Thanh toán</a>
                                </figure>
                            </div>
                        </div>
                    </div>
                    <div class="ps-block--user-header">

                        <c:if test="${sessionScope.user_name !=null}">
                            <div class="ps-block__left">
                                <img class="user_avatar" src="${sessionScope.user_avatar}" alt="avatar">
                            </div>
                            <div class="ps-block__right">
                                <div class="filter__sort" style="padding-top: 15px">

                                    <select id="login-web">
                                        <option selected disabled>${sessionScope.user_name}</option>
                                        <option value="user">Quản lí tài khoản</option>
                                        <c:if test="${isAdmin !=null}">
                                            <option value="handle-login?login=admin">Vào trang Admin</option>
                                        </c:if>
                                        <option value="handle-login?logout=true">Đăng xuất</option>
                                    </select>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${sessionScope.user_name ==null}">
                            <div class="ps-block__left"><i class="icon-user"></i></div>
                            <div class="ps-block__right">
                                <a style="margin-top: 5px" href="handle-login?login=user">Đăng nhập</a><a
                                    href="handle-sign-up">Đăng
                                kí</a>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <nav class="navigation">
        <div class="container">
            <div class="navigation__left">
                <div class="menu--product-categories">
                    <div class="menu__toggle"><i class="icon-menu"></i><span> Danh mục</span></div>
                    <div class="menu__content">
                        <ul class="menu--dropdown">
                            <c:forEach var="cate" items="${applicationScope.category}">
                                <c:if test="${cate.master_id == cate.id && cate.parent==0 }">
                                    <li><a href="#.html">${cate.name}</a>
                                </c:if>
                                <c:if test="${cate.master_id == cate.id && cate.parent==1 }">
                                    <li class="menu-item-has-children has-mega-menu">
                                        <a href="#">${cate.name}</a>
                                        <div class="mega-menu">
                                            <div class="mega-menu__column">
                                                <h4>${cate.name}
                                                </h4>
                                                <ul class="mega-menu__list">
                                                    <c:forEach var="subcate" items="${cate.subcategories}">
                                                        <li><a href="#.html">${subcate.name}</a>
                                                        </li>
                                                    </c:forEach>
                                                </ul>
                                            </div>

                                        </div>
                                    </li>
                                </c:if>

                            </c:forEach>
                            <%--                            <li><a href="#"><i class="fa fa-rocket"></i> Hot Promotions</a>--%>
                            <%--                            </li>--%>
                            <%--                            <li class="menu-item-has-children has-mega-menu"><a href="#"><i class="icon-laundry"></i>--%>
                            <%--                                Consumer Electronic</a>--%>
                            <%--                                <div class="mega-menu">--%>
                            <%--                                    <div class="mega-menu__column">--%>
                            <%--                                        <h4>Electronic<span class="sub-toggle"></span></h4>--%>
                            <%--                                        <ul class="mega-menu__list">--%>
                            <%--                                            <li><a href="#">Home Audio &amp; Theathers</a>--%>
                            <%--                                            </li>--%>
                            <%--                                            <li><a href="#">TV &amp; Videos</a>--%>
                            <%--                                            </li>--%>
                            <%--                                            <li><a href="#">Camera, Photos &amp; Videos</a>--%>
                            <%--                                            </li>--%>
                            <%--                                            <li><a href="#">Cellphones &amp; Accessories</a>--%>
                            <%--                                            </li>--%>
                            <%--                                            <li><a href="#">Headphones</a>--%>
                            <%--                                            </li>--%>
                            <%--                                            <li><a href="#">Videosgames</a>--%>
                            <%--                                            </li>--%>
                            <%--                                            <li><a href="#">Wireless Speakers</a>--%>
                            <%--                                            </li>--%>
                            <%--                                            <li><a href="#">Office Electronic</a>--%>
                            <%--                                            </li>--%>
                            <%--                                        </ul>--%>
                            <%--                                    </div>--%>
                            <%--                                    <div class="mega-menu__column">--%>
                            <%--                                        <h4>Accessories &amp; Parts<span class="sub-toggle"></span></h4>--%>
                            <%--                                        <ul class="mega-menu__list">--%>
                            <%--                                            <li><a href="#">Digital Cables</a>--%>
                            <%--                                            </li>--%>
                            <%--                                            <li><a href="#">Audio &amp; Video Cables</a>--%>
                            <%--                                            </li>--%>
                            <%--                                            <li><a href="#">Batteries</a>--%>
                            <%--                                            </li>--%>
                            <%--                                        </ul>--%>
                            <%--                                    </div>--%>
                            <%--                                </div>--%>
                            <%--                            </li>--%>
                            <%--                            <li><a href="#"><i class="icon-shirt"></i> Clothing &amp; Apparel</a>--%>
                            <%--                            </li>--%>
                            <%--                            <li><a href="#"><i class="icon-lampshade"></i> Home, Garden &amp; Kitchen</a>--%>
                            <%--                            </li>--%>
                            <%--                            <li><a href="#"><i class="icon-heart-pulse"></i> Health &amp; Beauty</a>--%>
                            <%--                            </li>--%>
                            <%--                            <li><a href="#"><i class="icon-diamond2"></i> Yewelry &amp; Watches</a>--%>
                            <%--                            </li>--%>
                            <%--                            <li class="menu-item-has-children has-mega-menu"><a href="#"><i class="icon-desktop"></i>--%>
                            <%--                                Computer &amp; Technology</a>--%>
                            <%--                                <div class="mega-menu">--%>
                            <%--                                    <div class="mega-menu__column">--%>
                            <%--                                        <h4>Computer &amp; Technologies<span class="sub-toggle"></span></h4>--%>
                            <%--                                        <ul class="mega-menu__list">--%>
                            <%--                                            <li><a href="#">Computer &amp; Tablets</a>--%>
                            <%--                                            </li>--%>
                            <%--                                            <li><a href="#">Laptop</a>--%>
                            <%--                                            </li>--%>
                            <%--                                            <li><a href="#">Monitors</a>--%>
                            <%--                                            </li>--%>
                            <%--                                            <li><a href="#">Networking</a>--%>
                            <%--                                            </li>--%>
                            <%--                                            <li><a href="#">Drive &amp; Storages</a>--%>
                            <%--                                            </li>--%>
                            <%--                                            <li><a href="#">Computer Components</a>--%>
                            <%--                                            </li>--%>
                            <%--                                            <li><a href="#">Security &amp; Protection</a>--%>
                            <%--                                            </li>--%>
                            <%--                                            <li><a href="#">Gaming Laptop</a>--%>
                            <%--                                            </li>--%>
                            <%--                                            <li><a href="#">Accessories</a>--%>
                            <%--                                            </li>--%>
                            <%--                                        </ul>--%>
                            <%--                                    </div>--%>
                            <%--                                </div>--%>
                            <%--                            </li>--%>
                            <%--                            <li><a href="#"><i class="icon-baby-bottle"></i> Babies &amp; Moms</a>--%>
                            <%--                            </li>--%>
                            <%--                            <li><a href="#"><i class="icon-baseball"></i> Sport &amp; Outdoor</a>--%>
                            <%--                            </li>--%>
                            <%--                            <li><a href="#"><i class="icon-smartphone"></i> Phones &amp; Accessories</a>--%>
                            <%--                            </li>--%>
                            <%--                            <li><a href="#"><i class="icon-book2"></i> Books &amp; Office</a>--%>
                            <%--                            </li>--%>
                            <%--                            <li><a href="#"><i class="icon-car-siren"></i> Cars &amp; Motocycles</a>--%>
                            <%--                            </li>--%>
                            <%--                            <li><a href="#"><i class="icon-wrench"></i> Home Improments</a>--%>
                            <%--                            </li>--%>
                            <%--                            <li><a href="#"><i class="icon-tag"></i> Vouchers &amp; Services</a>--%>
                            <%--                            </li>--%>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="navigation__right">
                <ul class="menu menu--recent-view">
                    <li class="menu-item-has-children"><a href="#">Sản phẩm đã xem</a>
                        <div class="navigation__recent-products">
                            <div class="ps-carousel--nav owl-slider" data-owl-auto="true" data-owl-loop="true"
                                 data-owl-speed="5000" data-owl-gap="30" data-owl-nav="true" data-owl-dots="false"
                                 data-owl-item="8" data-owl-item-xs="3" data-owl-item-sm="4" data-owl-item-md="5"
                                 data-owl-item-lg="6" data-owl-duration="1000" data-owl-mousedrag="on">
                                <c:forEach var="rp" items="${sessionScope.vp}">
                                <a href="shop-detail?product=${rp.slug}"><img
                                    src="${rp.img}" alt=""></a>
                                </c:forEach>
                            </div>
                            <p><a href="shop-default.html">Xem tất cả</a></p>
                        </div>
                    </li>
                </ul>
                <ul class="navigation__extra">
                    <li class="ps-dropdown"><a href="#">Bán hàng cùng Thế giới đồ chơi</a></li>
                    <li><a href="#">Kiểm tra đơn hàng</a></li>
                    <li><a href="#">Mã giảm giá của bạn</a></li>
                    <!--                    <li>-->
                    <!--                        <div class="ps-dropdown"><a href="#">US Dollar</a>-->
                    <!--                            <ul class="ps-dropdown-menu">-->
                    <!--                                <li><a href="#">Us Dollar</a></li>-->
                    <!--                                <li><a href="#">Euro</a></li>-->
                    <!--                            </ul>-->
                    <!--                        </div>-->
                    <!--                    </li>-->
                    <!--                    <li>-->
                    <!--                        <div class="ps-dropdown language"><a href="#"><img src="img/flag/en.png" alt="" />English</a>-->
                    <!--                            <ul class="ps-dropdown-menu">-->
                    <!--                                <li><a href="#"><img src="img/flag/germany.png" alt="" /> Germany</a></li>-->
                    <!--                                <li><a href="#"><img src="img/flag/fr.png" alt="" /> France</a></li>-->
                    <!--                            </ul>-->
                    <!--                        </div>-->
                    <!--                    </li>-->
                </ul>
            </div>
        </div>
    </nav>
</header>
<header class="header header--mobile header--mobile-kids" data-sticky="true">
    <div class="header__top">
        <div class="header__left">
            <p>Chào mừng đến với Thế giới đồ chơi !</p>
        </div>
        <div class="header__right">
            <ul class="navigation__extra">
                <li class="ps-dropdown"><a href="#">Bán hàng cùng Thế giới đồ chơi</a></li>
                <li><a href="#">Kiểm tra đơn hàng</a></li>
                <li><a href="#">Mã giảm giá của bạn</a></li>
                <!--                <li>-->
                <!--                    <div class="ps-dropdown"><a href="#">US Dollar</a>-->
                <!--                        <ul class="ps-dropdown-menu">-->
                <!--                            <li><a href="#">Us Dollar</a></li>-->
                <!--                            <li><a href="#">Euro</a></li>-->
                <!--                        </ul>-->
                <!--                    </div>-->
                <!--                </li>-->
                <!--                <li>-->
                <!--                    <div class="ps-dropdown language"><a href="#"><img src="img/flag/en.png" alt="" />English</a>-->
                <!--                        <ul class="ps-dropdown-menu">-->
                <!--                            <li><a href="#"><img src="img/flag/germany.png" alt="" /> Germany</a></li>-->
                <!--                            <li><a href="#"><img src="img/flag/fr.png" alt="" /> France</a></li>-->
                <!--                        </ul>-->
                <!--                    </div>-->
                <!--                </li>-->
            </ul>
        </div>
    </div>
    <div class="navigation--mobile">
        <div class="navigation__left"><a class="ps-logo" href="/"><img src="${applicationScope.header.logo}"
                                                                                alt=""/></a></div>
        <div class="navigation__right">
            <div class="header__actions">
                <div class="ps-cart--mini"><a class="header__extra" href="#"><i
                        class="icon-bag2"></i><span><i>${sessionScope.cart.size}</i></span></a>
<%--                    <div class="ps-cart__content">--%>
<%--                        <div class="ps-cart__items">--%>
<%--                            <div class="ps-product--cart-mobile">--%>
<%--                                <div class="ps-product__thumbnail"><a href="#"><img src="img/products/clothing/7.jpg"--%>
<%--                                                                                    alt=""/></a></div>--%>
<%--                                <div class="ps-product__content"><a class="ps-product__remove" href="#"><i--%>
<%--                                        class="icon-cross"></i></a><a href="product-default.html">MVMTH Classical--%>
<%--                                    Leather Watch In Black</a>--%>
<%--                                    <p><strong>Sold by:</strong> YOUNG SHOP</p><small>1 x $59.99</small>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="ps-product--cart-mobile">--%>
<%--                                <div class="ps-product__thumbnail"><a href="#"><img src="img/products/clothing/5.jpg"--%>
<%--                                                                                    alt=""/></a></div>--%>
<%--                                <div class="ps-product__content"><a class="ps-product__remove" href="#"><i--%>
<%--                                        class="icon-cross"></i></a><a href="product-default.html">Sleeve Linen Blend--%>
<%--                                    Caro Pane Shirt</a>--%>
<%--                                    <p><strong>Sold by:</strong> YOUNG SHOP</p><small>1 x $59.99</small>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="ps-cart__footer">--%>
<%--                            <h3>Sub Total:<strong>$59.99</strong></h3>--%>
<%--                            <figure><a class="ps-btn" href="shopping-cart.html">View Cart</a><a class="ps-btn"--%>
<%--                                                                                                href="checkout.html">Checkout</a>--%>
<%--                            </figure>--%>
<%--                        </div>--%>
<%--                    </div>--%>
                    <div class="ps-cart__content">
                        <div class="ps-cart__items">

                            <c:forEach var="ci" items="${sessionScope.cart.getProducts().values()}">
                                <div class="ps-product--cart-mobile">
                                    <div class="ps-product__thumbnail"><a href="#"><img
                                            src="${ci.img}" alt=""></a></div>
                                    <div class="ps-product__content"><a class="ps-product__remove" href="#"><i
                                            class="icon-cross"></i></a><a href="product-default.html">${ci.name}</a>
                                            <%--                                        <p><strong>Sold by:</strong> YOUNG SHOP</p>--%>
                                        <c:set var="ps" value="${ci.price_sale}"></c:set>
                                        <c:set var="p" value="${ci.price}"></c:set>
                                        <c:set var="total" value="${ci.totalPrice}"></c:set>
                                            <%--                                        <small>1 x $59.99</small>--%>
                                        <p>
                                            <small>
                                                    ${ci.quantity} x
                                                <c:if test="${ci.sale==true}">
                                                    <%=Util.formatCurrency((double) pageContext.getAttribute("ps"))%>
                                                    <span style="text-decoration: line-through;margin-left: 5px;color: gray;font-size: 13px">
                                <%=Util.formatCurrency((double) pageContext.getAttribute("p"))%>
                                </span>
                                                </c:if>
                                                <c:if test="${ci.sale==false}">
                                                    <%=Util.formatCurrency((double) pageContext.getAttribute("p"))%>
                                                </c:if>
                                            </small>
                                        </p>
                                    </div>
                                </div>
                            </c:forEach>




                        </div>
                        <div class="ps-cart__footer">
                            <c:set var="tc" value="${sessionScope.cart.totalPrice}"></c:set>
                            <h3>Tổng: <strong><%=Util.formatCurrency((double) pageContext.getAttribute("tc"))%></strong></h3>

                            <figure><a class="ps-btn" href="cart" style="color: white">Giỏ hàng</a><a class="ps-btn"
                                                                                               href="checkout" style="color: white">Thanh toán</a>
                            </figure>
                        </div>
                    </div>
                </div>
                <div class="ps-block--user-header">
<%--                    <div class="ps-block__left"><a href=""><i class="icon-user"></i></a></div>--%>
<%--                    <div class="ps-block__right"><a href="handle-login?login=user">Đăng nhập</a><a--%>
<%--                            href="my-account.html">Đăng--%>
<%--                        kí</a></div>--%>

    <c:if test="${sessionScope.user_name !=null}">
        <div class="ps-block__left">
            <img class="user_avatar"  src="${sessionScope.user_avatar}" alt="avatar">
        </div>
        <div class="ps-block__right">
            <div class="filter__sort" style="padding-top: 15px">

                <select id="login-mobile">
                    <option selected disabled>${sessionScope.user_name}</option>
                    <option value="user">Quản lí tài khoản</option>
                    <c:if test="${isAdmin !=null}">
                        <option value="handle-login?login=admin">Vào trang Admin</option>
                    </c:if>
                    <option value="handle-login?logout=true">Đăng xuất</option>
                </select>
            </div>
        </div>
    </c:if>
    <c:if test="${sessionScope.user_name ==null}">
        <div class="ps-block__left"><i class="icon-user"></i></div>
        <div class="ps-block__right">
            <a style="margin-top: 5px" href="handle-login?login=user">Đăng nhập</a><a
                href="handle-sign-up">Đăng
            kí</a>
        </div>
    </c:if>


                </div>
            </div>
        </div>
    </div>
    <div class="ps-search--mobile">
        <form class="ps-form--search-mobile" action="index.html" method="get">
            <div class="form-group--nest">
                <input class="form-control" type="text" placeholder="Tìm kiếm đồ chơi..."/>
                <button><i class="icon-magnifier"></i></button>
            </div>
        </form>
    </div>
</header>


<div id="back2top"><i style="color: #f6f6f6" class="fa fa-arrow-up"></i></div>
<div class="ps-site-overlay"></div>
<div class="ps-panel--sidebar" id="cart-mobile">
    <div class="ps-panel__header">
        <h3>Giỏ hàng</h3>
    </div>
    <div class="navigation__content">
        <div class="ps-cart--mobile">
            <div class="ps-cart__content">
                <c:forEach var="ci" items="${sessionScope.cart.getProducts().values()}">
                    <div class="ps-product--cart-mobile">
                        <div class="ps-product__thumbnail"><a href="#"><img
                                src="${ci.img}" alt=""></a></div>
                        <div class="ps-product__content"><a class="ps-product__remove" href="#"><i
                                class="icon-cross"></i></a><a href="product-default.html">${ci.name}</a>
                                <%--                                        <p><strong>Sold by:</strong> YOUNG SHOP</p>--%>
                            <c:set var="ps" value="${ci.price_sale}"></c:set>
                            <c:set var="p" value="${ci.price}"></c:set>
                            <c:set var="total" value="${ci.totalPrice}"></c:set>
                                <%--                                        <small>1 x $59.99</small>--%>
                            <p>
                                <small>
                                        ${ci.quantity} x
                                    <c:if test="${ci.sale==true}">
                                        <%=Util.formatCurrency((double) pageContext.getAttribute("ps"))%>
                                        <span style="text-decoration: line-through;margin-left: 5px;color: gray;font-size: 13px">
                                <%=Util.formatCurrency((double) pageContext.getAttribute("p"))%>
                                </span>
                                    </c:if>
                                    <c:if test="${ci.sale==false}">
                                        <%=Util.formatCurrency((double) pageContext.getAttribute("p"))%>
                                    </c:if>
                                </small>
                            </p>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div class="ps-cart__footer">
                <c:set var="tc" value="${sessionScope.cart.totalPrice}"></c:set>
                <h3>Tổng: <strong><%=Util.formatCurrency((double) pageContext.getAttribute("tc"))%></strong></h3>

                <figure><a class="ps-btn" href="cart" style="color: white">Giỏ hàng</a><a class="ps-btn"
                                                                                   href="checkout" style="color: white">Thanh toán</a>
                </figure>
            </div>
        </div>
    </div>
</div>
<!--include ../../data/menu/menu-product-categories-->
<div class="ps-panel--sidebar" id="navigation-mobile">
    <div class="ps-panel__header">
        <h3>Danh mục</h3>
    </div>
    <div class="ps-panel__content">
        <div class="menu--product-categories">
            <div class="menu__toggle"><i class="icon-menu"></i><span>Danh mục</span></div>
            <div class="menu__content">
                <ul class="menu--dropdown">
                    <c:forEach var="cate" items="${applicationScope.category}">
                        <c:if test="${cate.master_id == cate.id && cate.parent==0 }">
                            <li><a href="#.html">${cate.name}</a>
                        </c:if>
                        <c:if test="${cate.master_id == cate.id && cate.parent==1 }">
                            <li class="menu-item-has-children has-mega-menu">
                                <a href="#">${cate.name}</a>
                                <div class="mega-menu">
                                    <div class="mega-menu__column">
                                        <h4>${cate.name}
                                        </h4>
                                        <ul class="mega-menu__list">
                                            <c:forEach var="subcate" items="${cate.subcategories}">
                                                <li><a href="#.html">${subcate.name}</a>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>

                                </div>
                            </li>
                        </c:if>

                    </c:forEach>
                </ul>
            </div>
        </div>
        <!--+createMenu(product_categories, 'menu--mobile')-->
    </div>
</div>
<div class="navigation--list">
    <div class="navigation__content">
        <a class="navigation__item ps-toggle--sidebar" href="#menu-mobile"><i
            class="icon-menu"></i><span> Menu</span></a>
        <a class="navigation__item ps-toggle--sidebar"
                                                           href="#navigation-mobile"><i class="icon-list4"></i><span> Danh mục</span></a>
        <a
            class="navigation__item ps-toggle--sidebar" href="#search-sidebar"><i class="icon-magnifier"></i><span> Tìm kiếm</span></a>
        <a
            class="navigation__item ps-toggle--sidebar" href="#cart-mobile"><i
            class="icon-bag2"></i><span> Giỏ hàng</span></a>
<c:if test="${sessionScope.user_name ==null}">
        <a
                class="navigation__item" href="handle-login?login=user"><i
                class="icon-user"></i><span>Đăng nhập</span></a>
</c:if>
        <c:if test="${sessionScope.user_name !=null}">
            <a
            class="navigation__item ps-toggle--sidebar" href="#user-sidebar">
                <i class="icon-user"></i>
                <span>${sessionScope.user_name}</span></a>
            </c:if>
    </div>
</div>
<div class="ps-panel--sidebar" id="user-sidebar">
    <div class="ps-panel__header">
            <h3>${sessionScope.user_name}</h3>
    </div>
    <div class="navigation__content">
        <div class="left-sidebar-parent" style="display: block !important;">
            <a class="left-sidebar-title " href="user" style="margin-left: 20px;border-bottom: none"
               role="button" >
                <span>Quản lý tài khoản</span>
            </a>
        </div>
        <c:if test="${isAdmin !=null}">
            <div class="left-sidebar-parent" style="display: block !important; ">
                <a class="left-sidebar-title"  href="handle-login?login=admin" style="margin-left: 20px;border-bottom: none"
                   role="button" >
                    <span>Vào trang Admin</span>
                </a>
            </div>
        </c:if>
        <div class="left-sidebar-parent" style="display: block !important;">
            <a class="left-sidebar-title" href="handle-login?logout=true" style="margin-left: 20px;border-bottom: none"
               role="button" >
                <span>Đăng xuất</span>
            </a>
        </div>
<%--        <ul>--%>

<%--        <li><a href="user">Quản lí tài khoản</a></li>--%>
<%--        <c:if test="${isAdmin !=null}">--%>
<%--            <li><a href="handle-login?login=admin">Vào trang Admin</a></li>--%>
<%--        </c:if>--%>
<%--        <li><a href="handle-login?logout=true">Đăng xuất</a></li>--%>
<%--        </ul>--%>
    </div>
</div>
<div class="ps-panel--sidebar" id="search-sidebar">
    <div class="ps-panel__header">
        <form class="ps-form--search-mobile" action="/shopping" method="get">
            <div class="form-group--nest">
                <input class="form-control" name="keyword" type="text" placeholder="Tìm kiếm đồ chơi...">
                <button><i class="icon-magnifier"></i></button>
            </div>
        </form>
    </div>
    <div class="navigation__content"></div>
</div>
<div class="ps-panel--sidebar" id="menu-mobile">
    <div class="ps-panel__header">
        <h3>Menu</h3>
    </div>
    <div class="ps-panel__content">
        <ul class="menu--mobile">
            <li class="menu-item-has-children"><a href="index">Home</a><span class="sub-toggle"></span>
                <ul class="sub-menu">
                    <li><a href="index.html">Marketplace Full Width</a>
                    </li>
                    <li><a href="home-autopart.html">Home Auto Parts</a>
                    </li>
                    <li><a href="home-technology.html">Home Technology</a>
                    </li>
                    <li><a href="home-organic.html">Home Organic</a>
                    </li>
                    <li><a href="home-marketplace.html">Home Marketplace V1</a>
                    </li>
                    <li><a href="home-marketplace-2.html">Home Marketplace V2</a>
                    </li>
                    <li><a href="home-marketplace-3.html">Home Marketplace V3</a>
                    </li>
                    <li><a href="home-marketplace-4.html">Home Marketplace V4</a>
                    </li>
                    <li><a href="home-electronic.html">Home Electronic</a>
                    </li>
                    <li><a href="home-furniture.html">Home Furniture</a>
                    </li>
                    <li><a href="home-kid.html">Home Kids</a>
                    </li>
                    <li><a href="homepage-photo-and-video.html">Home photo and picture</a>
                    </li>
                    <li><a href="home-medical.html">Home Medical</a>
                    </li>
                </ul>
            </li>
            <li class="menu-item-has-children has-mega-menu"><a href="shop-default">Shop</a><span
                    class="sub-toggle"></span>
                <div class="mega-menu">
                    <div class="mega-menu__column">
                        <h4>Catalog Pages<span class="sub-toggle"></span></h4>
                        <ul class="mega-menu__list">
                            <li><a href="shop-default.html">Shop Default</a>
                            </li>
                            <li><a href="shop-default.html">Shop Fullwidth</a>
                            </li>
                            <li><a href="shop-categories.html">Shop Categories</a>
                            </li>
                            <li><a href="shop-sidebar.html">Shop Sidebar</a>
                            </li>
                            <li><a href="shop-sidebar-without-banner.html">Shop Without Banner</a>
                            </li>
                            <li><a href="shop-carousel.html">Shop Carousel</a>
                            </li>
                        </ul>
                    </div>
                    <div class="mega-menu__column">
                        <h4>Product Layout<span class="sub-toggle"></span></h4>
                        <ul class="mega-menu__list">
                            <li><a href="product-default.html">Default</a>
                            </li>
                            <li><a href="product-extend.html">Extended</a>
                            </li>
                            <li><a href="product-full-content.html">Full Content</a>
                            </li>
                            <li><a href="product-box.html">Boxed</a>
                            </li>
                            <li><a href="product-sidebar.html">Sidebar</a>
                            </li>
                            <li><a href="product-default.html">Fullwidth</a>
                            </li>
                        </ul>
                    </div>
                    <div class="mega-menu__column">
                        <h4>Product Types<span class="sub-toggle"></span></h4>
                        <ul class="mega-menu__list">
                            <li><a href="product-default.html">Simple</a>
                            </li>
                            <li><a href="product-default.html">Color Swatches</a>
                            </li>
                            <li><a href="product-image-swatches.html">Images Swatches</a>
                            </li>
                            <li><a href="product-countdown.html">Countdown</a>
                            </li>
                            <li><a href="product-multi-vendor.html">Multi-Vendor</a>
                            </li>
                            <li><a href="product-instagram.html">Instagram</a>
                            </li>
                            <li><a href="product-affiliate.html">Affiliate</a>
                            </li>
                            <li><a href="product-on-sale.html">On sale</a>
                            </li>
                            <li><a href="product-video.html">Video Featured</a>
                            </li>
                            <li><a href="product-groupped.html">Grouped</a>
                            </li>
                            <li><a href="product-out-stock.html">Out Of Stock</a>
                            </li>
                        </ul>
                    </div>
                    <div class="mega-menu__column">
                        <h4>Woo Pages<span class="sub-toggle"></span></h4>
                        <ul class="mega-menu__list">
                            <li><a href="shopping-cart.html">Shopping Cart</a>
                            </li>
                            <li><a href="checkout.html">Checkout</a>
                            </li>
                            <li><a href="whishlist.html">Whishlist</a>
                            </li>
                            <li><a href="compare.html">Compare</a>
                            </li>
                            <li><a href="order-tracking.html">Order Tracking</a>
                            </li>
                            <li><a href="my-account.html">My Account</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </li>
            <li class="menu-item-has-children has-mega-menu"><a href="">Pages</a><span class="sub-toggle"></span>
                <div class="mega-menu">
                    <div class="mega-menu__column">
                        <h4>Basic Page<span class="sub-toggle"></span></h4>
                        <ul class="mega-menu__list">
                            <li><a href="about-us.html">About Us</a>
                            </li>
                            <li><a href="contact-us.html">Contact</a>
                            </li>
                            <li><a href="faqs.html">Faqs</a>
                            </li>
                            <li><a href="comming-soon.html">Comming Soon</a>
                            </li>
                            <li><a href="404-page.html">404 Page</a>
                            </li>
                        </ul>
                    </div>
                    <div class="mega-menu__column">
                        <h4>Vendor Pages<span class="sub-toggle"></span></h4>
                        <ul class="mega-menu__list">
                            <li><a href="become-a-vendor.html">Become a Vendor</a>
                            </li>
                            <li><a href="vendor-store.html">Vendor Store</a>
                            </li>
                            <li><a href="vendor-dashboard-free.html">Vendor Dashboard Free</a>
                            </li>
                            <li><a href="vendor-dashboard-pro.html">Vendor Dashboard Pro</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </li>
            <li class="menu-item-has-children has-mega-menu"><a href="">Blogs</a><span class="sub-toggle"></span>
                <div class="mega-menu">
                    <div class="mega-menu__column">
                        <h4>Blog Layout<span class="sub-toggle"></span></h4>
                        <ul class="mega-menu__list">
                            <li><a href="blog-grid.html">Grid</a>
                            </li>
                            <li><a href="blog-list.html">Listing</a>
                            </li>
                            <li><a href="blog-small-thumb.html">Small Thumb</a>
                            </li>
                            <li><a href="blog-left-sidebar.html">Left Sidebar</a>
                            </li>
                            <li><a href="blog-right-sidebar.html">Right Sidebar</a>
                            </li>
                        </ul>
                    </div>
                    <div class="mega-menu__column">
                        <h4>Single Blog<span class="sub-toggle"></span></h4>
                        <ul class="mega-menu__list">
                            <li><a href="blog-detail.html">Single 1</a>
                            </li>
                            <li><a href="blog-detail-2.html">Single 2</a>
                            </li>
                            <li><a href="blog-detail-3.html">Single 3</a>
                            </li>
                            <li><a href="blog-detail-4.html">Single 4</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </li>
        </ul>
    </div>
</div>
<div id="loader-wrapper">
    <div class="loader-section section-left"></div>
    <div class="loader-section section-right"></div>
</div>
<div class="ps-search" id="site-search"><a class="ps-btn--close" href="#"></a>
    <div class="ps-search__content">
        <form class="ps-form--primary-search" action="do_action" method="post">
            <input class="form-control" type="text" placeholder="Tìm kiếm đồ chơi...">
            <button><i class="aroma-magnifying-glass"></i></button>
        </form>
    </div>
</div>

<c:if test="${title !='Trang chủ'}">
    <nav aria-label="breadcrumb">
        <div class="container" style="padding: 25px 0px;">
            <ol class="breadcrumb" style="
    padding: 20px;
    border-radius: 10px;
">
                <li class="breadcrumb-item"><a href="#">Home</a></li>
                <li class="breadcrumb-item"><a href="#">Library</a></li>
                <li class="breadcrumb-item active" aria-current="page">Data</li>
            </ol>
        </div>
    </nav>
</c:if>

<%--End--%>


<%--<div class="humberger__menu__overlay"></div>--%>
<%--<div class="humberger__menu__wrapper">--%>
<%--    <div class="humberger__menu__logo">--%>

<%--        <a href="home"><img src="${applicationScope.header.logo}" alt=""></a>--%>
<%--    </div>--%>
<%--    <div class="humberger__menu__cart">--%>
<%--        <ul>--%>
<%--            <li><a href="user"><i class="fa fa-heart"></i> <span>1</span></a></li>--%>
<%--            <li><a href="cart"><i class="fa fa-shopping-bag"></i> <span>${sessionScope.cart.size}</span></a></li>--%>
<%--        </ul>--%>
<%--        <c:set var="totalPrice" value="${sessionScope.cart.totalPrice}"></c:set>--%>
<%--        <div class="header__cart__price">Tổng: <span><%= Util.formatCurrency((double)pageContext.getAttribute("totalPrice")) %> </span></div>--%>
<%--    </div>--%>
<%--    <div class="humberger__menu__widget">--%>
<%--        <div class="header__top__right__auth">--%>
<%--            <c:if test="${sessionScope.user_name !=null}">--%>
<%--                <div class="filter__sort" style="margin-bottom: 0px;">--%>
<%--                    <img class="user_avatar" src="${sessionScope.user_avatar}" alt="avatar">--%>
<%--                    <select id="login-mobile">--%>
<%--                        <option selected disabled>${sessionScope.user_name}</option>--%>
<%--                        <option value="user">Quản lí tài khoản</option>--%>
<%--                        <c:if test="${isAdmin !=null}">--%>
<%--                            <option value="handle-login?login=admin">Vào trang Admin</option>--%>
<%--                        </c:if>--%>
<%--                        <option value="handle-login?logout=true">Đăng xuất</option>--%>
<%--                    </select>--%>
<%--                </div>--%>
<%--            </c:if>--%>
<%--            <c:if test="${sessionScope.user_name ==null}">--%>
<%--                <div class="header__top__right__auth">--%>
<%--                    <a href="handle-login?login=user"><i class="fa fa-user"></i>--%>
<%--                        Đăng nhập--%>
<%--                    </a>--%>
<%--                </div>--%>
<%--            </c:if>--%>

<%--        </div>--%>
<%--    </div>--%>
<%--    <nav class="humberger__menu__nav mobile-menu">--%>
<%--        <ul>--%>
<%--            &lt;%&ndash;            <c:set var="page_menu" scope="request" value="${requestScope.page_menu}"></c:set>&ndash;%&gt;--%>
<%--            <c:choose>--%>
<%--                <c:when test="${page_menu=='home'}">--%>
<%--                    <li class="active"><a href="home">Trang Chủ</a></li>--%>
<%--                    <li><a href="shopping">Mua Sắm</a></li>--%>
<%--                    <li><a href="shopping-sale">Giảm giá</a></li>--%>

<%--                    <li><a href="blog">Bài Viết</a></li>--%>
<%--                    <li><a href="contact">Liên Hệ</a></li>--%>
<%--                </c:when>--%>
<%--                <c:when test="${page_menu=='discount'}">--%>
<%--                    <li ><a href="home">Trang Chủ</a></li>--%>
<%--                    <li><a href="shopping">Mua Sắm</a></li>--%>
<%--                    <li class="active"><a href="shopping-sale">Giảm giá</a></li>--%>

<%--                    <li><a href="blog">Bài Viết</a></li>--%>
<%--                    <li><a href="contact">Liên Hệ</a></li>--%>
<%--                </c:when>--%>
<%--                <c:when test="${page_menu=='shopping'}">--%>
<%--                    <li ><a href="home">Trang Chủ</a></li>--%>
<%--                    <li class="active"><a href="shopping">Mua Sắm</a></li>--%>
<%--                    <li><a href="shopping-sale">Giảm giá</a></li>--%>

<%--                    <li><a href="blog">Bài Viết</a></li>--%>
<%--                    <li><a href="contact">Liên Hệ</a></li>--%>
<%--                </c:when>--%>
<%--                <c:when test="${page_menu=='blog'}">--%>
<%--                    <li ><a href="home">Trang Chủ</a></li>--%>
<%--                    <li><a href="shopping">Mua Sắm</a></li>--%>
<%--                    <li><a href="shopping-sale">Giảm giá</a></li>--%>

<%--                    <li class="active"><a href="blog">Bài Viết</a></li>--%>
<%--                    <li><a href="contact">Liên Hệ</a></li>--%>
<%--                </c:when>--%>
<%--                <c:when test="${page_menu=='contact'}">--%>
<%--                    <li ><a href="home">Trang Chủ</a></li>--%>
<%--                    <li><a href="shopping">Mua Sắm</a></li>--%>
<%--                    <li><a href="shopping-sale">Giảm giá</a></li>--%>

<%--                    <li><a href="blog">Bài Viết</a></li>--%>
<%--                    <li class="active"><a href="contact">Liên Hệ</a></li>--%>
<%--                </c:when>--%>
<%--                <c:otherwise>--%>
<%--                    <li ><a href="home">Trang Chủ</a></li>--%>
<%--                    <li><a href="shopping">Mua Sắm</a></li>--%>
<%--                    <li><a href="shopping-sale">Giảm giá</a></li>--%>

<%--                    <li><a href="blog">Bài Viết</a></li>--%>
<%--                    <li><a href="contact">Liên Hệ</a></li>--%>
<%--                </c:otherwise>--%>
<%--            </c:choose>--%>
<%--        </ul>--%>
<%--    </nav>--%>
<%--    <div id="mobile-menu-wrap"></div>--%>
<%--    <div class="header__top__right__social">--%>
<%--        <a href="${applicationScope.social_media.fb}"><i class="fa fa-facebook"></i></a>--%>
<%--        <a href="${applicationScope.social_media.in}"><i class="fa fa-instagram"></i></a>--%>
<%--        <a href="${applicationScope.social_media.tw}"><i class="fa fa-twitter"></i></a>--%>
<%--        <a href="${applicationScope.social_media.pi}"><i class="fa fa-pinterest-p"></i></a>--%>
<%--    </div>--%>
<%--    <div class="humberger__menu__contact">--%>
<%--        <ul>--%>
<%--            <li><i class="fa fa-envelope"></i> ${applicationScope.address.get(0).email}</li>--%>
<%--        </ul>--%>
<%--    </div>--%>
<%--</div>--%>
<%--<!-- Humberger End -->--%>

<%--<!-- Header Section Begin -->--%>
<%--<header class="header">--%>
<%--    <div class="header__top">--%>
<%--        <div class="container">--%>
<%--            <div class="row">--%>
<%--                <div class="col-lg-6 col-md-6">--%>
<%--                    <div class="header__top__left">--%>
<%--                        <ul>--%>
<%--                            <li><i class="fa fa-envelope"></i>${applicationScope.address.get(0).email}</li>--%>
<%--                        </ul>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="col-lg-6 col-md-6">--%>
<%--                    <div class="header__top__right">--%>
<%--                        <div class="header__top__right__social">--%>
<%--                            <a href="${applicationScope.social_media.fb}"><i class="fa fa-facebook"></i></a>--%>
<%--                            <a href="${applicationScope.social_media.in}"><i class="fa fa-instagram"></i></a>--%>
<%--                            <a href="${applicationScope.social_media.tw}"><i class="fa fa-twitter"></i></a>--%>
<%--                            <a href="${applicationScope.social_media.pi}"><i class="fa fa-pinterest-p"></i></a>--%>
<%--                        </div>--%>
<%--                        <div class="header__top__right__auth">--%>
<%--                            <c:if test="${sessionScope.user_name !=null}">--%>
<%--                                <div class="filter__sort" style="margin-bottom: 0px;">--%>
<%--                                    <img class="user_avatar" src="${sessionScope.user_avatar}" alt="avatar">--%>
<%--                                    <select id="login-web">--%>
<%--                                        <option selected disabled>${sessionScope.user_name}</option>--%>
<%--                                        <option value="user">Quản lí tài khoản</option>--%>
<%--                                        <c:if test="${isAdmin !=null}">--%>
<%--                                            <option value="handle-login?login=admin">Vào trang Admin</option>--%>
<%--                                        </c:if>--%>
<%--                                        <option value="handle-login?logout=true">Đăng xuất</option>--%>
<%--                                    </select>--%>
<%--                                </div>--%>
<%--                            </c:if>--%>
<%--                            <c:if test="${sessionScope.user_name ==null}">--%>
<%--                                <div class="header__top__right__auth">--%>
<%--                                    <a href="handle-login?login=user"><i class="fa fa-user"></i>--%>
<%--                                        Đăng nhập--%>
<%--                                    </a>--%>
<%--                                </div>--%>
<%--                            </c:if>--%>

<%--                        </div>--%>

<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <div class="container">--%>
<%--        <div class="row">--%>
<%--            <div class="col-lg-3">--%>
<%--                <div class="header__logo">--%>
<%--                    <a href="home"><img src="${applicationScope.header.logo}" alt=""></a>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col-lg-6">--%>
<%--                <nav class="header__menu">--%>
<%--                    <ul>--%>
<%--                        <c:set var="page_menu" scope="request" value="${requestScope.page_menu}"></c:set>--%>
<%--                        <c:choose>--%>
<%--                            <c:when test="${page_menu=='home'}">--%>
<%--                                <li class="active"><a href="home">Trang Chủ</a></li>--%>
<%--                                <li><a href="shopping">Mua Sắm</a></li>--%>
<%--                                <li><a href="shopping-sale">Giảm giá</a></li>--%>

<%--                                <li><a href="blog">Bài Viết</a></li>--%>
<%--                                <li><a href="contact">Liên Hệ</a></li>--%>
<%--                            </c:when>--%>
<%--                            <c:when test="${page_menu=='discount'}">--%>
<%--                                <li ><a href="home">Trang Chủ</a></li>--%>
<%--                                <li><a href="shopping">Mua Sắm</a></li>--%>

<%--                                <li class="active"><a href="shopping-sale">Giảm giá</a></li>--%>
<%--                                <li><a href="blog">Bài Viết</a></li>--%>
<%--                                <li><a href="contact">Liên Hệ</a></li>--%>
<%--                            </c:when>--%>
<%--                            <c:when test="${page_menu=='shopping'}">--%>
<%--                                <li ><a href="home">Trang Chủ</a></li>--%>
<%--                                <li class="active"><a href="shopping">Mua Sắm</a></li>--%>
<%--                                <li><a href="shopping-sale">Giảm giá</a></li>--%>

<%--                                <li><a href="blog">Bài Viết</a></li>--%>
<%--                                <li><a href="contact">Liên Hệ</a></li>--%>
<%--                            </c:when>--%>
<%--                            <c:when test="${page_menu=='blog'}">--%>
<%--                                <li ><a href="home">Trang Chủ</a></li>--%>
<%--                                <li><a href="shopping">Mua Sắm</a></li>--%>
<%--                                <li><a href="shopping-sale">Giảm giá</a></li>--%>

<%--                                <li class="active"><a href="blog">Bài Viết</a></li>--%>
<%--                                <li><a href="contact">Liên Hệ</a></li>--%>
<%--                            </c:when>--%>
<%--                            <c:when test="${page_menu=='contact'}">--%>
<%--                                <li ><a href="home">Trang Chủ</a></li>--%>
<%--                                <li><a href="shopping">Mua Sắm</a></li>--%>
<%--                                <li><a href="shopping-sale">Giảm giá</a></li>--%>

<%--                                <li><a href="blog">Bài Viết</a></li>--%>
<%--                                <li class="active"><a href="contact">Liên Hệ</a></li>--%>
<%--                            </c:when>--%>
<%--                            <c:otherwise>--%>
<%--                                <li ><a href="home">Trang Chủ</a></li>--%>
<%--                                <li><a href="shopping">Mua Sắm</a></li>--%>
<%--                                <li><a href="shopping-sale">Giảm giá</a></li>--%>

<%--                                <li><a href="blog">Bài Viết</a></li>--%>
<%--                                <li><a href="contact">Liên Hệ</a></li>--%>
<%--                            </c:otherwise>--%>
<%--                        </c:choose>--%>
<%--                    </ul>--%>
<%--                </nav>--%>
<%--            </div>--%>
<%--            <div class="col-lg-3">--%>
<%--                <div class="header__cart">--%>
<%--                    <ul>--%>
<%--                        <c:if test="${sessionScope.favourist!=null}">--%>
<%--                        <li><a href="user"><i class="fa fa-heart"></i> <span>${sessionScope.favourist.size}</span></a></li>--%>
<%--                        </c:if>--%>
<%--                        <li><a href="cart"><i class="fa fa-shopping-bag"></i> <span>${sessionScope.cart.size}</span></a></li>--%>
<%--                    </ul>--%>
<%--                    <c:set var="totalPrice" value="${sessionScope.cart.totalPrice}"></c:set>--%>
<%--                    <div class="header__cart__price">Tổng: <span><%= Util.formatCurrency((double)pageContext.getAttribute("totalPrice")) %> </span></div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="humberger__open">--%>
<%--            <i class="fa fa-bars"></i>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</header>--%>
<%--<!-- Header Section End -->--%>
