<%@ page import="vn.thegioidochoi.model.home_page.Home_page" %>
<%@ page import="vn.thegioidochoi.model.util.Util" %>
<%@ page import="vn.thegioidochoi.model.header_footer.Category" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Trinh Quang Tien
  Date: 25/12/2020
  Time: 21:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%--<%@ page import="vn.thegioidochoi.model.util.Util" %>--%>
<!DOCTYPE html>
<html lang="vi-VN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta http-equiv="Expires" CONTENT="0">
    <meta http-equiv="Cache-Control" CONTENT="no-cache">
    <meta http-equiv="Pragma" CONTENT="no-cache">
    <title>${title}</title>
    <link href="${applicationScope.header.shortcut}" rel="shortcut icon">


    <!-- Css Styles -->
    <%--    <link rel="stylesheet" href="user_page/css/bootstrap.min.css" type="text/css">--%>
    <%--    <link rel="stylesheet" href="user_page/css/font-awesome.min.css" type="text/css">--%>
    <%--    <link rel="stylesheet" href="user_page/css/elegant-icons.css" type="text/css">--%>
    <%--    <link rel="stylesheet" href="user_page/css/nice-select.css" type="text/css">--%>
    <%--    <link rel="stylesheet" href="user_page/css/jquery-ui.min.css" type="text/css">--%>
    <%--    <link rel="stylesheet" href="user_page/css/owl.carousel.min.css" type="text/css">--%>
    <%--    <link rel="stylesheet" href="user_page/css/slicknav.min.css" type="text/css">--%>
    <%--    <link rel="stylesheet" href="user_page/css/style.css" type="text/css">--%>


    <link href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,500,600,700&amp;amp;subset=latin-ext"
          rel="stylesheet">
    <!-- Css Styles -->
    <link rel="stylesheet" href="user_page/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/nice-select.css" type="text/css">
    <!--    <link rel="stylesheet" href="user_page/css/elegant-icons.css" type="text/css">-->
    <!--    <link rel="stylesheet" href="user_page/css/nice-select.css" type="text/css">-->
    <!--    <link rel="stylesheet" href="user_page/css/jquery-ui.min.css" type="text/css">-->
    <link rel="stylesheet" href="user_page/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/owl.theme.default.min.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/style.css" type="text/css">
    <!--    <link rel="stylesheet" href="user_page/css/slicknav.min.css" type="text/css">-->
    <link rel="stylesheet" href="user_page/css/style_home.css" type="text/css">
</head>

<body>

<jsp:include page="Menu.jsp"></jsp:include>
<div id="homepage-kids">
    <div class="container-fluid fluid-img">
        <div class="col">
            <div class="ps-carousel--dots owl-slider" data-owl-auto="true" data-owl-loop="true" data-owl-speed="5000"
                 data-owl-gap="0" data-owl-nav="false" data-owl-dots="true" data-owl-item="1" data-owl-item-xs="1"
                 data-owl-item-sm="1" data-owl-item-md="1" data-owl-item-lg="1" data-owl-duration="1000"
                 data-owl-mousedrag="on"><a href="#"><img
                    src="https://u6wdnj9wggobj.vcdn.cloud/media/revslider/home-banner/banner_NOEL_2021_1920x750_1_.jpg"
                    alt=""></a><a href="#"><img
                    src="https://u6wdnj9wggobj.vcdn.cloud/media/revslider/home-banner/bruder-1920-x-750-pxmykingdom.jpg"
                    alt=""></a><a href="#"><img
                    src="https://u6wdnj9wggobj.vcdn.cloud/media/revslider/home-banner/1920x750-LEGO-DUPLOmykingdom.jpg"
                    alt=""></a>
                <a href="#"><img
                        src="https://u6wdnj9wggobj.vcdn.cloud/media/revslider/home-banner/khunglong_Web_MKD_1920x750.png"
                        alt=""></a>
            </div>

        </div>
        <!--                <div class="ps-section__right"><a href="#"><img src="../imgs/home/slider/promotion-1.jpg" alt=""></a><a href="#"><img src="../imgs/home/slider/promotion-2.jpg" alt=""></a><a class="wide" href="#"><img src="../imgs/home/slider/promotion-3.jpg" alt=""></a><a href="#"><img src="../imgs/home/slider/promotion-4.jpg" alt=""></a><a href="#"><img src="../imgs/home/slider/promotion-5.jpg" alt=""></a></div>-->
    </div>
    <div class="container">
        <div class="ps-block__header">
            <div class="ps-section__content">
                <div class="ps-block--categories-tabs ps-tab-root">
                    <div class="ps-block__header">
                        <div class="ps-carousel--nav ps-tab-list owl-slider" data-owl-auto="false"
                             data-owl-speed="1000" data-owl-gap="0" data-owl-nav="true" data-owl-dots="true"
                             data-owl-item="1" data-owl-item-xs="1" data-owl-item-sm="2" data-owl-item-md="2"
                             data-owl-item-lg="4" data-owl-item-xl="4" data-owl-duration="500"
                             data-owl-mousedrag="on">
                            <a href="#bestseller"><i
                                    class="fa fa-flash"></i><span>Siêu sale</span></a>
                            <a href="#new"><i
                                    class="fa fa-shopping-cart"></i><span>Mua sắm</span></a>
                            <a href="#highlight"><i
                                    class="fa fa-book"></i><span>Blog</span></a>
                            <a href="#suggest"><i
                                class="fa fa-percent"></i><span>Mã giảm giá</span></a></div>
                        </div>
                    </div>
                </div>
            </div>
        <section id="age-section" style="margin-top: 50px;">
            <!-- <h2 class="sr-only">Promotion Section</h2> -->
            <div class="container">
                <div class="row">
                    <div class="col-sm-4 col-12 my-2">
                        <a href="">
                            <img src="user_page/img/age_banner/tu1_6.png" alt="">
                            <span>Từ 1-6 tuổi</span>
                        </a>
                    </div>
                    <div class="col-sm-4 col-12 my-2">
                        <a href="">
                            <img src="user_page/img/age_banner/tu_6_11.png" alt="">
                            <span>Từ 6-11 tuổi</span>
                        </a>
                    </div>
                    <div class="col-sm-4 col-12 my-2">
                        <a href="">
                            <img src="user_page/img/age_banner/tu11_.png" alt="">
                            <span>Trên 11 tuổi</span>
                        </a>
                    </div>

                </div>
            </div>
        </section>


        <div class="ps-best-sale-brands ps-section--furniture">
            <div class="ps-section__header">
                <h3>Cửa hàng nổi bật</h3>
            </div>
            <div class="ps-section__content">
                <ul class="ps-image-list">
                    <c:forEach var="bs" items="${best_supplier}">
                        <li><a href="#"><img src="${bs.logo}" alt=""></a></li>
                    </c:forEach>
                </ul>
            </div>
        </div>

        <div class="ps-deal-of-day">
            <div class="ps-section__header">
                <div class="ps-block--countdown-deal">
                    <h3 style="margin: auto;color:orangered">Giá sốc</h3>
                    <div class="ps-block__right">
                        <img src="user_page/img/icon/hot_sale.gif" alt="" style="height: 50px">
                    </div>
                </div>
                <a href="/shopping">Xem tất cả</a>
            </div>
            <div class="ps-section__content">
                <div class="ps-carousel--nav owl-slider" data-owl-auto="false" data-owl-loop="true"
                     data-owl-speed="1000" data-owl-gap="30" data-owl-nav="false" data-owl-dots="true"
                     data-owl-item="1" data-owl-item-xs="1" data-owl-item-sm="2" data-owl-item-md="3"
                     data-owl-item-lg="4" data-owl-item-xl="4" data-owl-duration="1000" data-owl-mousedrag="on">

                    <c:forEach var="dp" items="${dps}">
                        <div class="product__discount__item">

                            <div class="product__discount__item__pic">
                                <a href="/shop-detail?product=${dp.slug}"><img src="${dp.img}" alt=""></a>
                                <!--                                    <a href="" class="fload-img"></a>-->
                                <div class="product__discount__percent">-${dp.percent_sale}%</div>
                                <ul class="product__item__pic__hover">
                                    <li class="fast-checkout cursor-pointer" data-pro_id="${dp.id}"><a ><i class="fa fa-money"></i></a></li>
                                    <c:if test="${sessionScope.user_id!=null}">
                                        <li class="addFa cursor-pointer" data-current_page="home" data-pro_id="${dp.id}"><a><i class="fa fa-heart"></i></a></li>
                                    </c:if>
                                    <li class="addCart cursor-pointer" data-current_page="home" data-pro_id="${dp.id}"><a ><i class="fa fa-shopping-cart"></i></a></li>
                                </ul>
                            </div>

                            <div class="product__discount__item__text">

                                <h4 class=" text-truncate" data-toggle="tooltip" title="${dp.name}"><a
                                        href="#">${dp.name}</a></h4>
                                <div class="product__item__price"><h5 style="display: inline-block">
                                        ${Util.formatCurrency(dp.price_sale)}</h5>
                                    <span>${Util.formatCurrency(dp.price)}</span>
                                </div>
                                <p>Đã bán ${dp.sold}</p>
                                <div class="progress progress-style mb-5">

                                    <div
                                            class="progress-bar bg-warning"
                                            role="progressbar"
                                            style="width: ${dp.percent_sale_past()}%"
                                            aria-valuenow="60"
                                            aria-valuemin="0"
                                            aria-valuemax="100">
                                    </div>
                                    <div class="progress-text">
                                        <img src="user_page/img/icon/fire.png"
                                             style="width:2rem !important; display: inline-block; margin-bottom: 8px;"
                                             alt="">
                                        <p style="display: inline-block; color:#f34f00"> Còn ${dp.dayRest()} ngày</p>
                                    </div>

                                </div>
                            </div>


                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>

        <div class="ps-search-trending">
            <div class="container">
                <div class="ps-section__header">
                    <h3 style="color: orangered">Xu hướng</h3>
                </div>
                <div class="ps-section__content">
                    <div class="ps-block--categories-tabs ps-tab-root">
                        <div class="ps-block__header">
                            <div class="ps-carousel--nav ps-tab-list owl-slider" data-owl-auto="false"
                                 data-owl-speed="1000" data-owl-gap="0" data-owl-nav="true" data-owl-dots="true"
                                 data-owl-item="1" data-owl-item-xs="1" data-owl-item-sm="2" data-owl-item-md="2"
                                 data-owl-item-lg="3" data-owl-item-xl="3" data-owl-duration="500"
                                 data-owl-mousedrag="on">
                                <a href="#bestseller"><i
                                        class="fa fa-paper-plane-o"></i><span>Bán chạy</span></a>
                                <a href="#new"><i
                                        class="fa fa-clock-o"></i><span>Mới nhất</span></a>
                                <a href="#highlight"><i
                                        class="fa fa-star-o"></i><span>Nổi bật</span></a>
<%--                                <a href="#suggest"><i--%>
<%--                                    class="fa fa-user-o"></i><span>Dành cho bạn</span></a></div>--%>
                        </div>
                        <div class="ps-tabs">
                            <div class="ps-tabs">
                                <div class="ps-tab active" id="bestseller">
                                    <div class="ps-carousel--nav owl-slider" data-owl-auto="true" data-owl-loop="true"
                                         data-owl-speed="1000" data-owl-gap="30" data-owl-nav="true"
                                         data-owl-dots="true"
                                         data-owl-item="1" data-owl-item-xs="1" data-owl-item-sm="2"
                                         data-owl-item-md="3"
                                         data-owl-item-lg="4" data-owl-item-xl="4" data-owl-duration="1000"
                                         data-owl-mousedrag="on">

                                        <c:forEach var="bp" items="${bps}">
                                            <c:if test="${bp.percent_sale==0}">
                                                <div class="featured__item">
                                                    <div class="featured__item__pic ">
                                                        <a href="/shop-detail?product=${bp.slug}"><img src="${bp.img}" alt=""></a>
                                                        <ul class="product__item__pic__hover">
                                                            <li class="fast-checkout cursor-pointer" data-pro_id="${bp.id}"><a ><i class="fa fa-money"></i></a></li>
                                                            <c:if test="${sessionScope.user_id!=null}">
                                                                <li class="addFa cursor-pointer" data-current_page="home" data-pro_id="${bp.id}"><a><i class="fa fa-heart"></i></a></li>
                                                            </c:if>
                                                            <li class="addCart cursor-pointer" data-current_page="home" data-pro_id="${bp.id}"><a ><i class="fa fa-shopping-cart"></i></a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="featured__item__text">
                                                        <h4 class=" text-truncate" data-toggle="tooltip"><a
                                                                href="#">${bp.name}</a></h4>
                                                        <h5>${Util.formatCurrency(bp.price)}</h5>
                                                        <p>Đã bán ${bp.sold}</p>
                                                    </div>

                                                </div>
                                            </c:if>
                                            <c:if test="${bp.percent_sale>0}">
                                                <div class="product__discount__item">

                                                    <div class="product__discount__item__pic">
                                                        <a href="/shop-detail?product=${bp.slug}"><img src="${bp.img}" alt=""></a>
                                                        <!--                                    <a href="" class="fload-img"></a>-->
                                                        <div class="product__discount__percent">-${bp.percent_sale}%
                                                        </div>
                                                        <ul class="product__item__pic__hover">
                                                            <li class="fast-checkout cursor-pointer" data-pro_id="${bp.id}"><a ><i class="fa fa-money"></i></a></li>
                                                            <c:if test="${sessionScope.user_id!=null}">
                                                                <li class="addFa cursor-pointer" data-current_page="home" data-pro_id="${bp.id}"><a><i class="fa fa-heart"></i></a></li>
                                                            </c:if>
                                                            <li class="addCart cursor-pointer" data-current_page="home" data-pro_id="${bp.id}"><a ><i class="fa fa-shopping-cart"></i></a></li>
                                                        </ul>
                                                    </div>

                                                    <div class="product__discount__item__text">

                                                        <h4 class=" text-truncate" data-toggle="tooltip"
                                                            title="${bp.name}"><a href="#">${bp.name}</a></h4>
                                                        <div class="product__item__price"><h5
                                                                style="display: inline-block">
                                                                ${Util.formatCurrency(bp.price_sale)}</h5>
                                                            <span>${Util.formatCurrency(bp.price)}</span>
                                                        </div>
                                                        <p>Đã bán ${bp.sold}</p>
                                                        <div class="progress progress-style mb-5">

                                                            <div
                                                                    class="progress-bar bg-warning"
                                                                    role="progressbar"
                                                                    style="width: ${bp.percent_sale_past()}%"
                                                                    aria-valuenow="60"
                                                                    aria-valuemin="0"
                                                                    aria-valuemax="100">
                                                            </div>
                                                            <div class="progress-text">
                                                                <img src="user_page/img/icon/fire.png"
                                                                     style="width:2rem !important; display: inline-block; margin-bottom: 8px;"
                                                                     alt="">
                                                                <p style="display: inline-block; color:#f34f00">
                                                                    Còn ${bp.dayRest()} ngày</p>
                                                            </div>

                                                        </div>
                                                    </div>


                                                </div>
                                            </c:if>

                                        </c:forEach>

                                    </div>
                                </div>
                                <div class="ps-tab" id="new">
                                    <div class="ps-carousel--nav owl-slider" data-owl-auto="true" data-owl-loop="true"
                                         data-owl-speed="1000" data-owl-gap="30" data-owl-nav="true"
                                         data-owl-dots="true"
                                         data-owl-item="1" data-owl-item-xs="1" data-owl-item-sm="2"
                                         data-owl-item-md="3"
                                         data-owl-item-lg="4" data-owl-item-xl="4" data-owl-duration="1000"
                                         data-owl-mousedrag="on">

                                        <c:forEach var="np" items="${nps}">
                                            <c:if test="${np.percent_sale==0}">
                                                <div class="featured__item">
                                                    <div class="featured__item__pic ">
                                                        <a href="/shop-detail?product=${np.slug}"><img src="${np.img}" alt=""></a>
                                                        <ul class="product__item__pic__hover">
                                                            <li class="fast-checkout cursor-pointer" data-pro_id="${np.id}"><a ><i class="fa fa-money"></i></a></li>
                                                            <c:if test="${sessionScope.user_id!=null}">
                                                                <li class="addFa cursor-pointer" data-current_page="home" data-pro_id="${np.id}"><a><i class="fa fa-heart"></i></a></li>
                                                            </c:if>
                                                            <li class="addCart cursor-pointer" data-current_page="home" data-pro_id="${np.id}"><a ><i class="fa fa-shopping-cart"></i></a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="featured__item__text">
                                                        <h4 class=" text-truncate" data-toggle="tooltip"><a
                                                                href="#">${np.name}</a></h4>
                                                        <h5>${Util.formatCurrency(np.price)}</h5>
                                                        <p>Đã bán ${np.sold}</p>
                                                    </div>

                                                </div>
                                            </c:if>
                                            <c:if test="${np.percent_sale>0}">
                                                <div class="product__discount__item">

                                                    <div class="product__discount__item__pic">
                                                        <a href="/shop-detail?product=${np.slug}"><img src="${np.img}" alt=""></a>
                                                        <!--                                    <a href="" class="fload-img"></a>-->
                                                        <div class="product__discount__percent">-${np.percent_sale}%
                                                        </div>
                                                        <ul class="product__item__pic__hover">
                                                            <li class="fast-checkout cursor-pointer" data-pro_id="${np.id}"><a ><i class="fa fa-money"></i></a></li>
                                                            <c:if test="${sessionScope.user_id!=null}">
                                                                <li class="addFa cursor-pointer" data-current_page="home" data-pro_id="${np.id}"><a><i class="fa fa-heart"></i></a></li>
                                                            </c:if>
                                                            <li class="addCart cursor-pointer" data-current_page="home" data-pro_id="${np.id}"><a ><i class="fa fa-shopping-cart"></i></a></li>
                                                        </ul>
                                                    </div>

                                                    <div class="product__discount__item__text">

                                                        <h4 class=" text-truncate" data-toggle="tooltip"
                                                            title="${np.name}"><a href="#">${np.name}</a></h4>
                                                        <div class="product__item__price"><h5
                                                                style="display: inline-block">
                                                                ${Util.formatCurrency(np.price_sale)}</h5>
                                                            <span>${Util.formatCurrency(np.price)}</span>
                                                        </div>
                                                        <p>Đã bán ${np.sold}</p>
                                                        <div class="progress progress-style mb-5">

                                                            <div
                                                                    class="progress-bar bg-warning"
                                                                    role="progressbar"
                                                                    style="width: ${np.percent_sale_past()}%"
                                                                    aria-valuenow="60"
                                                                    aria-valuemin="0"
                                                                    aria-valuemax="100">
                                                            </div>
                                                            <div class="progress-text">
                                                                <img src="user_page/img/icon/fire.png"
                                                                     style="width:2rem !important; display: inline-block; margin-bottom: 8px;"
                                                                     alt="">
                                                                <p style="display: inline-block; color:#f34f00">
                                                                    Còn ${np.dayRest()} ngày</p>
                                                            </div>

                                                        </div>
                                                    </div>


                                                </div>
                                            </c:if>

                                        </c:forEach>

                                    </div>
                                </div>
                                <div class="ps-tab" id="highlight">
                                    <div class="ps-carousel--nav owl-slider" data-owl-auto="true" data-owl-loop="true"
                                         data-owl-speed="1000" data-owl-gap="30" data-owl-nav="false"
                                         data-owl-dots="true"
                                         data-owl-item="1" data-owl-item-xs="1" data-owl-item-sm="2"
                                         data-owl-item-md="3"
                                         data-owl-item-lg="4" data-owl-item-xl="4" data-owl-duration="1000"
                                         data-owl-mousedrag="on">

                                        <c:forEach var="hlp" items="${hlps}">
                                            <c:if test="${hlp.percent_sale==0}">
                                                <div class="featured__item">
                                                    <div class="featured__item__pic ">
                                                        <a href="/shop-detail?product=${hlp.slug}"><img src="${hlp.img}" alt=""></a>
                                                        <ul class="product__item__pic__hover">
                                                            <li class="fast-checkout cursor-pointer" data-pro_id="${hlp.id}"><a ><i class="fa fa-money"></i></a></li>
                                                            <c:if test="${sessionScope.user_id!=null}">
                                                                <li class="addFa cursor-pointer" data-current_page="home" data-pro_id="${hlp.id}"><a><i class="fa fa-heart"></i></a></li>
                                                            </c:if>
                                                            <li class="addCart cursor-pointer" data-current_page="home" data-pro_id="${hlp.id}"><a ><i class="fa fa-shopping-cart"></i></a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="featured__item__text">
                                                        <h4 class=" text-truncate" data-toggle="tooltip"><a
                                                                href="#">${hlp.name}</a></h4>
                                                        <h5>${Util.formatCurrency(hlp.price)}</h5>
                                                        <p>Đã bán ${hlp.sold}</p>
                                                    </div>

                                                </div>
                                            </c:if>
                                            <c:if test="${hlp.percent_sale>0}">
                                                <div class="product__discount__item">

                                                    <div class="product__discount__item__pic">
                                                        <a href="/shop-detail?product=${hlp.slug}"><img src="${hlp.img}" alt=""></a>
                                                        <!--                                    <a href="" class="fload-img"></a>-->
                                                        <div class="product__discount__percent">-${hlp.percent_sale}%
                                                        </div>
                                                        <ul class="product__item__pic__hover">
                                                            <li class="fast-checkout cursor-pointer" data-pro_id="${hlp.id}"><a ><i class="fa fa-money"></i></a></li>
                                                            <c:if test="${sessionScope.user_id!=null}">
                                                                <li class="addFa cursor-pointer" data-current_page="home" data-pro_id="${hlp.id}"><a><i class="fa fa-heart"></i></a></li>
                                                            </c:if>
                                                            <li class="addCart cursor-pointer" data-current_page="home" data-pro_id="${hlp.id}"><a ><i class="fa fa-shopping-cart"></i></a></li>
                                                        </ul>
                                                    </div>

                                                    <div class="product__discount__item__text">

                                                        <h4 class=" text-truncate" data-toggle="tooltip"
                                                            title="${hlp.name}"><a href="#">${hlp.name}</a></h4>
                                                        <div class="product__item__price"><h5
                                                                style="display: inline-block">
                                                                ${Util.formatCurrency(hlp.price_sale)}</h5>
                                                            <span>${Util.formatCurrency(hlp.price)}</span>
                                                        </div>
                                                        <p>Đã bán ${hlp.sold}</p>
                                                        <div class="progress progress-style mb-5">

                                                            <div
                                                                    class="progress-bar bg-warning"
                                                                    role="progressbar"
                                                                    style="width: ${hlp.percent_sale_past()}%"
                                                                    aria-valuenow="60"
                                                                    aria-valuemin="0"
                                                                    aria-valuemax="100">
                                                            </div>
                                                            <div class="progress-text">
                                                                <img src="user_page/img/icon/fire.png"
                                                                     style="width:2rem !important; display: inline-block; margin-bottom: 8px;"
                                                                     alt="">
                                                                <p style="display: inline-block; color:#f34f00">
                                                                    Còn ${hlp.dayRest()} ngày</p>
                                                            </div>

                                                        </div>
                                                    </div>


                                                </div>
                                            </c:if>

                                        </c:forEach>


                                    </div>
                                </div>
<%--                                <div class="ps-tab" id="suggest">--%>
<%--                                    <div class="ps-carousel--nav owl-slider" data-owl-auto="true" data-owl-loop="true"--%>
<%--                                         data-owl-speed="1000" data-owl-gap="30" data-owl-nav="true"--%>
<%--                                         data-owl-dots="true"--%>
<%--                                         data-owl-item="1" data-owl-item-xs="1" data-owl-item-sm="2"--%>
<%--                                         data-owl-item-md="3"--%>
<%--                                         data-owl-item-lg="4" data-owl-item-xl="4" data-owl-duration="1000"--%>
<%--                                         data-owl-mousedrag="on">--%>

<%--                                        <c:forEach var="bp" items="${bps}">--%>
<%--                                            <c:if test="${bp.percent_sale==0}">--%>
<%--                                                <div class="featured__item">--%>
<%--                                                    <div class="featured__item__pic ">--%>
<%--                                                        <a href="/shop-detail?product=${bp.slug}"><img src="${bp.img}" alt=""></a>--%>
<%--                                                        <ul class="product__item__pic__hover">--%>
<%--                                                            <li class="fast-checkout cursor-pointer" data-pro_id="${bp.id}"><a ><i class="fa fa-money"></i></a></li>--%>
<%--                                                            <c:if test="${sessionScope.user_id!=null}">--%>
<%--                                                                <li class="addFa cursor-pointer" data-current_page="home" data-pro_id="${bp.id}"><a><i class="fa fa-heart"></i></a></li>--%>
<%--                                                            </c:if>--%>
<%--                                                            <li class="addCart cursor-pointer" data-current_page="home" data-pro_id="${bp.id}"><a ><i class="fa fa-shopping-cart"></i></a></li>--%>
<%--                                                        </ul>--%>
<%--                                                    </div>--%>
<%--                                                    <div class="featured__item__text">--%>
<%--                                                        <h4 class=" text-truncate" data-toggle="tooltip"><a--%>
<%--                                                                href="#">${bp.name}</a></h4>--%>
<%--                                                        <h5>${Util.formatCurrency(bp.price)}</h5>--%>
<%--                                                        <p>Đã bán ${bp.sold}</p>--%>
<%--                                                    </div>--%>

<%--                                                </div>--%>
<%--                                            </c:if>--%>
<%--                                            <c:if test="${bp.percent_sale>0}">--%>
<%--                                                <div class="product__discount__item">--%>

<%--                                                    <div class="product__discount__item__pic">--%>
<%--                                                        <a href="/shop-detail?product=${bp.slug}"><img src="${bp.img}" alt=""></a>--%>
<%--                                                        <!--                                    <a href="" class="fload-img"></a>-->--%>
<%--                                                        <div class="product__discount__percent">-${bp.percent_sale}%--%>
<%--                                                        </div>--%>
<%--                                                        <ul class="product__item__pic__hover">--%>
<%--                                                            <li class="fast-checkout cursor-pointer" data-pro_id="${bp.id}"><a ><i class="fa fa-money"></i></a></li>--%>
<%--                                                            <c:if test="${sessionScope.user_id!=null}">--%>
<%--                                                                <li class="addFa cursor-pointer" data-current_page="home" data-pro_id="${bp.id}"><a><i class="fa fa-heart"></i></a></li>--%>
<%--                                                            </c:if>--%>
<%--                                                            <li class="addCart cursor-pointer" data-current_page="home" data-pro_id="${bp.id}"><a ><i class="fa fa-shopping-cart"></i></a></li>--%>
<%--                                                        </ul>--%>
<%--                                                    </div>--%>

<%--                                                    <div class="product__discount__item__text">--%>

<%--                                                        <h4 class=" text-truncate" data-toggle="tooltip"--%>
<%--                                                            title="${bp.name}"><a href="#">${bp.name}</a></h4>--%>
<%--                                                        <div class="product__item__price"><h5--%>
<%--                                                                style="display: inline-block">--%>
<%--                                                                ${Util.formatCurrency(bp.price_sale)}</h5>--%>
<%--                                                            <span>${Util.formatCurrency(bp.price)}</span>--%>
<%--                                                        </div>--%>
<%--                                                        <p>Đã bán ${bp.sold}</p>--%>
<%--                                                        <div class="progress progress-style mb-5">--%>

<%--                                                            <div--%>
<%--                                                                    class="progress-bar bg-warning"--%>
<%--                                                                    role="progressbar"--%>
<%--                                                                    style="width: ${bp.percent_sale_past()}%"--%>
<%--                                                                    aria-valuenow="60"--%>
<%--                                                                    aria-valuemin="0"--%>
<%--                                                                    aria-valuemax="100">--%>
<%--                                                            </div>--%>
<%--                                                            <div class="progress-text">--%>
<%--                                                                <img src="user_page/img/icon/fire.png"--%>
<%--                                                                     style="width:2rem !important; display: inline-block; margin-bottom: 8px;"--%>
<%--                                                                     alt="">--%>
<%--                                                                <p style="display: inline-block; color:#f34f00">--%>
<%--                                                                    Còn ${bp.dayRest()} ngày</p>--%>
<%--                                                            </div>--%>

<%--                                                        </div>--%>
<%--                                                    </div>--%>


<%--                                                </div>--%>
<%--                                            </c:if>--%>
<%--                                        </c:forEach>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="ps-block--products-of-category">
            <div class="ps-block__categories">
                <h3>${applicationScope.category.get(1).name}</h3>
                <ul>
                    <c:forEach var="p" items="${applicationScope.category.get(1).subcategories}">

                        <li><a href="/shopping?cate=${p.slug}">${p.name}</a></li>
                    </c:forEach>
                </ul>
                <a class="ps-block__more-link" href="/shopping?cate=${applicationScope.category.get(1).slug}">Xem tất cả</a>
            </div>
            <div class="ps-block__slider">
                <div class="ps-carousel--product-box owl-slider" data-owl-auto="true" data-owl-loop="true"
                     data-owl-speed="7000" data-owl-gap="0" data-owl-nav="true" data-owl-dots="true" data-owl-item="1"
                     data-owl-item-xs="1" data-owl-item-sm="1" data-owl-item-md="1" data-owl-item-lg="1"
                     data-owl-duration="500" data-owl-mousedrag="off"><a href="#"><img
                        src="imgs/home/slider/lego_2.png" alt=""></a><a href="#"><img
                        src="imgs/home/slider/lego_1.png" alt=""></a></div>
            </div>
            <div class="ps-block__product-box">
                <c:set var="count" value="1"></c:set>
                <c:forEach var="sp" items="${sps}">
                <c:if test="${sp.percent_sale==0}">
                <c:if test="${count>=5}">
                <div class="hidden-item featured__item">
                    </c:if>
                    <c:if test="${count<5}">
                    <div class="featured__item">
                        </c:if>
                        <div class="featured__item__pic ">
                            <a href="/shop-detail?product=${sp.slug}"><img src="${sp.img}" alt=""></a>
                            <ul class="featured__item__pic__hover">
                                <li class="fast-checkout cursor-pointer" data-pro_id="${sp.id}"><a ><i class="fa fa-money"></i></a></li>
                                <c:if test="${sessionScope.user_id!=null}">
                                    <li class="addFa cursor-pointer" data-current_page="home" data-pro_id="${sp.id}"><a><i class="fa fa-heart"></i></a></li>
                                </c:if>
                                <li class="addCart cursor-pointer" data-current_page="home" data-pro_id="${sp.id}"><a ><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h4 class=" text-truncate" data-toggle="tooltip"><a href="#">${sp.name}</a></h4>
                            <h5>${Util.formatCurrency(sp.price)}</h5>
                            <p>Đã bán ${sp.sold}</p>
                        </div>

                    </div>
                    <c:set var="count" value="${count+1}"></c:set>
                    </c:if>
                    </c:forEach>

            </div>
        </div>
        <div class="ps-block--products-of-category">
            <div class="ps-block__categories">
                <h3>${applicationScope.category.get(3).name}</h3>
                <ul>
                    <c:forEach var="p" items="${applicationScope.category.get(3).subcategories}">

                        <li><a href="/shopping?cate=${p.slug}">${p.name}</a></li>
                    </c:forEach>
                </ul>
                <a class="ps-block__more-link" href="/shopping?cate=${applicationScope.category.get(3).slug}">Xem tất cả</a>
            </div>
            <div class="ps-block__slider">
                <div class="ps-carousel--product-box owl-slider" data-owl-auto="true" data-owl-loop="true"
                     data-owl-speed="7000" data-owl-gap="0" data-owl-nav="true" data-owl-dots="true"
                     data-owl-item="1"
                     data-owl-item-xs="1" data-owl-item-sm="1" data-owl-item-md="1" data-owl-item-lg="1"
                     data-owl-duration="500" data-owl-mousedrag="off"><a href="#"><img
                        src="imgs/home/slider/nv_1.png" alt=""></a><a href="#"><img
                        src="imgs/home/slider/nv_2.png" alt=""></a></div>
            </div>
            <div class="ps-block__product-box">
                <c:set var="count" value="1"></c:set>
                <c:forEach var="cp" items="${cps}">
                <c:if test="${cp.percent_sale==0}">
                <c:if test="${count>=5}">
                <div class="hidden-item featured__item">
                    </c:if>
                    <c:if test="${count<5}">
                    <div class="featured__item">
                        </c:if>
                        <div class="featured__item__pic ">
                            <a href="/shop-detail?product=${cp.slug}"><img src="${cp.img}" alt=""></a>
                            <ul class="featured__item__pic__hover">
                                <li class="fast-checkout cursor-pointer" data-pro_id="${cp.id}"><a ><i class="fa fa-money"></i></a></li>
                                <c:if test="${sessionScope.user_id!=null}">
                                    <li class="addFa cursor-pointer" data-current_page="home" data-pro_id="${cp.id}"><a><i class="fa fa-heart"></i></a></li>
                                </c:if>
                                <li class="addCart cursor-pointer" data-current_page="home" data-pro_id="${cp.id}"><a ><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h4 class=" text-truncate" data-toggle="tooltip"><a href="#">${cp.name}</a></h4>
                            <h5>${Util.formatCurrency(cp.price)}</h5>
                            <p>Đã bán ${cp.sold}</p>
                        </div>

                    </div>
                    <c:set var="count" value="${count+1}"></c:set>
                    </c:if>
                    </c:forEach>
                </div>
            </div>

        <div class="ps-block--products-of-category">
            <div class="ps-block__categories">
                <h3>${applicationScope.category.get(2).name}</h3>
                <ul>
                    <c:forEach var="p" items="${applicationScope.category.get(2).subcategories}">

                        <li><a href="/shopping?cate=${p.slug}">${p.name}</a></li>
                    </c:forEach>
                </ul>
                <a class="ps-block__more-link" href="/shopping?cate=${applicationScope.category.get(2).slug}">Xem tất cả</a>
            </div>
            <div class="ps-block__slider">
                <div class="ps-carousel--product-box owl-slider" data-owl-auto="true" data-owl-loop="true"
                     data-owl-speed="7000" data-owl-gap="0" data-owl-nav="true" data-owl-dots="true"
                     data-owl-item="1"
                     data-owl-item-xs="1" data-owl-item-sm="1" data-owl-item-md="1" data-owl-item-lg="1"
                     data-owl-duration="500" data-owl-mousedrag="off"><a href="#"><img
                        src="imgs/home/slider/ptgt_1.png" alt=""></a><a href="#"><img
                        src="imgs/home/slider/ptgt_2.png" alt=""></a></div>
            </div>
            <div class="ps-block__product-box">
                <c:set var="count" value="1"></c:set>
                <c:forEach var="tp" items="${tps}">
                <c:if test="${tp.percent_sale==0}">
                <c:if test="${count>=5}">
                <div class="hidden-item featured__item">
                    </c:if>
                    <c:if test="${count<5}">
                    <div class="featured__item">
                        </c:if>
                        <div class="featured__item__pic ">
                            <a href="/shop-detail?product=${tp.slug}"><img src="${tp.img}" alt=""></a>
                            <ul class="featured__item__pic__hover">
                                <li class="fast-checkout cursor-pointer" data-pro_id="${tp.id}"><a ><i class="fa fa-money"></i></a></li>
                                <c:if test="${sessionScope.user_id!=null}">
                                    <li class="addFa cursor-pointer" data-current_page="home" data-pro_id="${tp.id}"><a><i class="fa fa-heart"></i></a></li>
                                </c:if>
                                <li class="addCart cursor-pointer" data-current_page="home" data-pro_id="${tp.id}"><a ><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h4 class=" text-truncate" data-toggle="tooltip"><a href="#">${tp.name}</a></h4>
                            <h5>${Util.formatCurrency(tp.price)}</h5>
                            <p>Đã bán ${tp.sold}</p>
                        </div>

                    </div>
                    <c:set var="count" value="${count+1}"></c:set>
                    </c:if>
                    </c:forEach>
                </div>
            </div>


        <div class="ps-block--recent-viewed">
            <div class="ps-block__header">
                <h3>Sản phẩm đã xem</h3>
<%--                <a href="/shop-detail">Xem tất cả</a>--%>
            </div>
            <div class="ps-block__content">
<c:forEach var="rp" items="${sessionScope.vp}">
                <a href="/shop-detail?product=${rp.slug}"><img src="${rp.img}"
                                                            alt=""></a>
    </c:forEach>

            </div>
        </div>


    </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>

<!-- Js Plugins -->
<%--<script src="user_page/js/jquery-3.3.1.min.js"></script>--%>
<%--<script src="user_page/js/bootstrap.min.js"></script>--%>
<%--<script src="user_page/js/jquery.nice-select.min.js"></script>--%>
<%--<script src="user_page/js/jquery-ui.min.js"></script>--%>
<%--<script src="user_page/js/jquery.slicknav.js"></script>--%>
<%--<script src="user_page/js/mixitup.min.js"></script>--%>
<%--<script src="user_page/js/owl.carousel.min.js"></script>--%>
<%--<script src="user_page/js/main.js"></script>--%>


<script src="user_page/js/jquery-3.3.1.min.js"></script>
<script src="user_page/js/popper.min.js"></script>
<script src="user_page/js/bootstrap.min.js"></script>
<script src="user_page/js/jquery.nice-select.min.js"></script>
<script src="user_page/js/jquery-ui.min.js"></script>
<!--<script src="user_page/js/jquery.nice-select.min.js"></script>-->
<!--<script src="user_page/js/jquery-ui.min.js"></script>-->
<!--<script src="user_page/js/jquery.slicknav.js"></script>-->
<!--<script src="user_page/js/mixitup.min.js"></script>-->
<script src="user_page/js/owl.carousel.min.js"></script>
<script src="user_page/js/main.js"></script>
<script src="user_page/js/main_home.js"></script>
</body>

</html>
