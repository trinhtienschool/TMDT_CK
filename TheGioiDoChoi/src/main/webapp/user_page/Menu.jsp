<%@ page import="vn.thegioicaycanh.model.util.Util" %><%--
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
<div class="humberger__menu__overlay"></div>
<div class="humberger__menu__wrapper">
    <div class="humberger__menu__logo">

        <a href="home"><img src="${applicationScope.header.logo}" alt=""></a>
    </div>
    <div class="humberger__menu__cart">
        <ul>
            <li><a href="user"><i class="fa fa-heart"></i> <span>1</span></a></li>
            <li><a href="cart"><i class="fa fa-shopping-bag"></i> <span>${sessionScope.cart.size}</span></a></li>
        </ul>
        <c:set var="totalPrice" value="${sessionScope.cart.totalPrice}"></c:set>
        <div class="header__cart__price">Tổng: <span><%= Util.formatCurrency((double)pageContext.getAttribute("totalPrice")) %> </span></div>
    </div>
    <div class="humberger__menu__widget">
        <div class="header__top__right__auth">
            <c:if test="${sessionScope.user_name !=null}">
                <div class="filter__sort" style="margin-bottom: 0px;">
                    <img class="user_avatar" src="${sessionScope.user_avatar}" alt="avatar">
                    <select id="login-mobile">
                        <option selected disabled>${sessionScope.user_name}</option>
                        <option value="user">Quản lí tài khoản</option>
                        <c:if test="${isAdmin !=null}">
                            <option value="handle-login?login=admin">Vào trang Admin</option>
                        </c:if>
                        <option value="handle-login?logout=true">Đăng xuất</option>
                    </select>
                </div>
            </c:if>
            <c:if test="${sessionScope.user_name ==null}">
                <div class="header__top__right__auth">
                    <a href="handle-login?login=user"><i class="fa fa-user"></i>
                        Đăng nhập
                    </a>
                </div>
            </c:if>

        </div>
    </div>
    <nav class="humberger__menu__nav mobile-menu">
        <ul>
            <%--            <c:set var="page_menu" scope="request" value="${requestScope.page_menu}"></c:set>--%>
            <c:choose>
                <c:when test="${page_menu=='home'}">
                    <li class="active"><a href="home">Trang Chủ</a></li>
                    <li><a href="shopping">Mua Sắm</a></li>
                    <li><a href="shopping-sale">Giảm giá</a></li>

                    <li><a href="blog">Bài Viết</a></li>
                    <li><a href="contact">Liên Hệ</a></li>
                </c:when>
                <c:when test="${page_menu=='discount'}">
                    <li ><a href="home">Trang Chủ</a></li>
                    <li><a href="shopping">Mua Sắm</a></li>
                    <li class="active"><a href="shopping-sale">Giảm giá</a></li>

                    <li><a href="blog">Bài Viết</a></li>
                    <li><a href="contact">Liên Hệ</a></li>
                </c:when>
                <c:when test="${page_menu=='shopping'}">
                    <li ><a href="home">Trang Chủ</a></li>
                    <li class="active"><a href="shopping">Mua Sắm</a></li>
                    <li><a href="shopping-sale">Giảm giá</a></li>

                    <li><a href="blog">Bài Viết</a></li>
                    <li><a href="contact">Liên Hệ</a></li>
                </c:when>
                <c:when test="${page_menu=='blog'}">
                    <li ><a href="home">Trang Chủ</a></li>
                    <li><a href="shopping">Mua Sắm</a></li>
                    <li><a href="shopping-sale">Giảm giá</a></li>

                    <li class="active"><a href="blog">Bài Viết</a></li>
                    <li><a href="contact">Liên Hệ</a></li>
                </c:when>
                <c:when test="${page_menu=='contact'}">
                    <li ><a href="home">Trang Chủ</a></li>
                    <li><a href="shopping">Mua Sắm</a></li>
                    <li><a href="shopping-sale">Giảm giá</a></li>

                    <li><a href="blog">Bài Viết</a></li>
                    <li class="active"><a href="contact">Liên Hệ</a></li>
                </c:when>
                <c:otherwise>
                    <li ><a href="home">Trang Chủ</a></li>
                    <li><a href="shopping">Mua Sắm</a></li>
                    <li><a href="shopping-sale">Giảm giá</a></li>

                    <li><a href="blog">Bài Viết</a></li>
                    <li><a href="contact">Liên Hệ</a></li>
                </c:otherwise>
            </c:choose>
        </ul>
    </nav>
    <div id="mobile-menu-wrap"></div>
    <div class="header__top__right__social">
        <a href="${applicationScope.social_media.fb}"><i class="fa fa-facebook"></i></a>
        <a href="${applicationScope.social_media.in}"><i class="fa fa-instagram"></i></a>
        <a href="${applicationScope.social_media.tw}"><i class="fa fa-twitter"></i></a>
        <a href="${applicationScope.social_media.pi}"><i class="fa fa-pinterest-p"></i></a>
    </div>
    <div class="humberger__menu__contact">
        <ul>
            <li><i class="fa fa-envelope"></i> ${applicationScope.address.get(0).email}</li>
        </ul>
    </div>
</div>
<!-- Humberger End -->

<!-- Header Section Begin -->
<header class="header">
    <div class="header__top">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="header__top__left">
                        <ul>
                            <li><i class="fa fa-envelope"></i>${applicationScope.address.get(0).email}</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="header__top__right">
                        <div class="header__top__right__social">
                            <a href="${applicationScope.social_media.fb}"><i class="fa fa-facebook"></i></a>
                            <a href="${applicationScope.social_media.in}"><i class="fa fa-instagram"></i></a>
                            <a href="${applicationScope.social_media.tw}"><i class="fa fa-twitter"></i></a>
                            <a href="${applicationScope.social_media.pi}"><i class="fa fa-pinterest-p"></i></a>
                        </div>
                        <div class="header__top__right__auth">
                            <c:if test="${sessionScope.user_name !=null}">
                                <div class="filter__sort" style="margin-bottom: 0px;">
                                    <img class="user_avatar" src="${sessionScope.user_avatar}" alt="avatar">
                                    <select id="login-web">
                                        <option selected disabled>${sessionScope.user_name}</option>
                                        <option value="user">Quản lí tài khoản</option>
                                        <c:if test="${isAdmin !=null}">
                                            <option value="handle-login?login=admin">Vào trang Admin</option>
                                        </c:if>
                                        <option value="handle-login?logout=true">Đăng xuất</option>
                                    </select>
                                </div>
                            </c:if>
                            <c:if test="${sessionScope.user_name ==null}">
                                <div class="header__top__right__auth">
                                    <a href="handle-login?login=user"><i class="fa fa-user"></i>
                                        Đăng nhập
                                    </a>
                                </div>
                            </c:if>

                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="header__logo">
                    <a href="home"><img src="${applicationScope.header.logo}" alt=""></a>
                </div>
            </div>
            <div class="col-lg-6">
                <nav class="header__menu">
                    <ul>
                        <c:set var="page_menu" scope="request" value="${requestScope.page_menu}"></c:set>
                        <c:choose>
                            <c:when test="${page_menu=='home'}">
                                <li class="active"><a href="home">Trang Chủ</a></li>
                                <li><a href="shopping">Mua Sắm</a></li>
                                <li><a href="shopping-sale">Giảm giá</a></li>

                                <li><a href="blog">Bài Viết</a></li>
                                <li><a href="contact">Liên Hệ</a></li>
                            </c:when>
                            <c:when test="${page_menu=='discount'}">
                                <li ><a href="home">Trang Chủ</a></li>
                                <li><a href="shopping">Mua Sắm</a></li>

                                <li class="active"><a href="shopping-sale">Giảm giá</a></li>
                                <li><a href="blog">Bài Viết</a></li>
                                <li><a href="contact">Liên Hệ</a></li>
                            </c:when>
                            <c:when test="${page_menu=='shopping'}">
                                <li ><a href="home">Trang Chủ</a></li>
                                <li class="active"><a href="shopping">Mua Sắm</a></li>
                                <li><a href="shopping-sale">Giảm giá</a></li>

                                <li><a href="blog">Bài Viết</a></li>
                                <li><a href="contact">Liên Hệ</a></li>
                            </c:when>
                            <c:when test="${page_menu=='blog'}">
                                <li ><a href="home">Trang Chủ</a></li>
                                <li><a href="shopping">Mua Sắm</a></li>
                                <li><a href="shopping-sale">Giảm giá</a></li>

                                <li class="active"><a href="blog">Bài Viết</a></li>
                                <li><a href="contact">Liên Hệ</a></li>
                            </c:when>
                            <c:when test="${page_menu=='contact'}">
                                <li ><a href="home">Trang Chủ</a></li>
                                <li><a href="shopping">Mua Sắm</a></li>
                                <li><a href="shopping-sale">Giảm giá</a></li>

                                <li><a href="blog">Bài Viết</a></li>
                                <li class="active"><a href="contact">Liên Hệ</a></li>
                            </c:when>
                            <c:otherwise>
                                <li ><a href="home">Trang Chủ</a></li>
                                <li><a href="shopping">Mua Sắm</a></li>
                                <li><a href="shopping-sale">Giảm giá</a></li>

                                <li><a href="blog">Bài Viết</a></li>
                                <li><a href="contact">Liên Hệ</a></li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </nav>
            </div>
            <div class="col-lg-3">
                <div class="header__cart">
                    <ul>
                        <c:if test="${sessionScope.favourist!=null}">
                        <li><a href="user"><i class="fa fa-heart"></i> <span>${sessionScope.favourist.size}</span></a></li>
                        </c:if>
                        <li><a href="cart"><i class="fa fa-shopping-bag"></i> <span>${sessionScope.cart.size}</span></a></li>
                    </ul>
                    <c:set var="totalPrice" value="${sessionScope.cart.totalPrice}"></c:set>
                    <div class="header__cart__price">Tổng: <span><%= Util.formatCurrency((double)pageContext.getAttribute("totalPrice")) %> </span></div>
                </div>
            </div>
        </div>
        <div class="humberger__open">
            <i class="fa fa-bars"></i>
        </div>
    </div>
</header>
<!-- Header Section End -->
