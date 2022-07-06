<%@ page import="vn.thegioidochoi.model.util.Util" %>
<%@ page import="vn.thegioidochoi.model.util.Util" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title>Supplier</title>
    <link href="user_page/supplier/css" rel="stylesheet">
<%--    <link rel="stylesheet" href="user_page/supplier/font-awesome.min.css">--%>
    <link rel="stylesheet" href="user_page/supplier/demo.css">
<%--    <link rel="stylesheet" href="user_page/supplier/bootstrap.min.css">--%>
<%--    <link rel="stylesheet" href="user_page/supplier/owl.carousel.min.css">--%>
<%--    <link rel="stylesheet" href="user_page/supplier/owl.theme.default.min.css">--%>
<%--    <link rel="stylesheet" href="user_page/supplier/slick.css">--%>
<%--    <link rel="stylesheet" href="user_page/supplier/nouislider.min.css">--%>
<%--    <link rel="stylesheet" href="user_page/supplier/lightgallery.min.css">--%>
<%--    <link rel="stylesheet" href="user_page/supplier/fontawesome-stars.css">--%>
<%--    <link rel="stylesheet" href="user_page/supplier/select2.min.css">--%>
<%--    <link rel="stylesheet" href="user_page/supplier/style.css">--%>
<%--    <link rel="stylesheet" href="user_page/supplier/market-place-1.css">--%>
    <link rel="stylesheet" href="user_page/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/font-awesome.min.css" type="text/css">
    <%--    <link rel="stylesheet" href="user_page/css/elegant-icons.css" type="text/css">--%>
    <link rel="stylesheet" href="user_page/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/owl.carousel.min.css" type="text/css">
    <%--    <link rel="stylesheet" href="user_page/css/slicknav.min.css" type="text/css">--%>
    <link rel="stylesheet" href="user_page/css/style.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/owl.theme.default.min.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/style_home.css" type="text/css">
    <link rel="stylesheet" href="user_page/supplier/market-place-1.css">


    <script type="text/javascript" src="user_page/supplier/js"></script><script type="text/javascript" charset="UTF-8" src="user_page/supplier/common.js.download"></script><script type="text/javascript" charset="UTF-8" src="user_page/supplier/util.js.download"></script></head>

<jsp:include page="Menu.jsp"></jsp:include>
<div class="ps-page--single">
    <!-- <div class="ps-breadcrumb">
        <div class="container">
            <ul class="breadcrumb">
                <li><a href="http://nouthemes.net/html/martfury/index.html">Home</a></li>
                <li>Vendor Store</li>
            </ul>
        </div>
    </div> -->
    <div class="ps-vendor-store">
        <div class="container">
            <div class="ps-section__container">
                <div class="ps-section__left">
                    <div class="ps-block--vendor">
                        <div class="ps-block__thumbnail"><img src="${supplier.getLogo()}" alt=""></div>
                        <div class="ps-block__container">
                            <div class="ps-block__header">
                                <h4>${supplier.getCompany_name()}</h4>
                            </div><span class="ps-block__divider"></span>
                            <div class="ps-block__content">
                                <p><strong>${supplier.getCompany_name()}</strong>, ${supplier.getDescription()}</p><span class="ps-block__divider"></span>
                                <p><strong>Địa chỉ</strong>  ${supplier.getAddress()}</p>
                                <!-- <figure>
                                    <figcaption>Foloow us on social</figcaption>
                                    <ul class="ps-list--social-color">
                                        <li><a class="facebook" href="http://nouthemes.net/html/martfury/vendor-store.html?fbclid=IwAR34lv6i2N1F0WeQ6v_nndU5P7cY5WGoaod8mqRR6oc4XDB9CNSglLEKi3s#"><i class="fa fa-facebook"></i></a></li>
                                        <li><a class="twitter" href="http://nouthemes.net/html/martfury/vendor-store.html?fbclid=IwAR34lv6i2N1F0WeQ6v_nndU5P7cY5WGoaod8mqRR6oc4XDB9CNSglLEKi3s#"><i class="fa fa-twitter"></i></a></li>
                                        <li><a class="linkedin" href="http://nouthemes.net/html/martfury/vendor-store.html?fbclid=IwAR34lv6i2N1F0WeQ6v_nndU5P7cY5WGoaod8mqRR6oc4XDB9CNSglLEKi3s#"><i class="fa fa-linkedin"></i></a></li>
                                        <li><a class="feed" href="http://nouthemes.net/html/martfury/vendor-store.html?fbclid=IwAR34lv6i2N1F0WeQ6v_nndU5P7cY5WGoaod8mqRR6oc4XDB9CNSglLEKi3s#"><i class="fa fa-feed"></i></a></li>
                                    </ul>
                                </figure> -->
                            </div>
                            <div class="ps-block__footer">
                                <p>Liên hệ chúng tôi<strong> ${supplier.getPhone()}</strong></p>
                                <!-- <p>or Or if you have any question</p> -->
                                <!-- <a class="ps-btn ps-btn--fullwidth" href="http://nouthemes.net/html/martfury/vendor-store.html?fbclid=IwAR34lv6i2N1F0WeQ6v_nndU5P7cY5WGoaod8mqRR6oc4XDB9CNSglLEKi3s">Contact Seller</a> -->
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ps-section__right">
                    <div class="ps-shopping ps-tab-root">
                        <div class="ps-shopping__header">
                            <p><strong>  ${count}</strong> Sản phẩm được tìm thấy</p>
                        </div>
                        <div class="ps-tabs">
                            <div class="ps-tab active" id="tab-1">
                                <div class="row">
<%--                                    <c:forEach var="p" items="${products}">--%>
<%--                                    <div class="col-xl-3 col-lg-4 col-md-4 col-sm-6 col-6 ">--%>
<%--                                        <div class="ps-product">--%>
<%--                                            <div class="ps-product__thumbnail"><a href="http://nouthemes.net/html/martfury/product-default.html"><img src="${p.img}" alt=""></a>--%>
<%--                                                <c:if test="${p.percent_sale> 0}">--%>
<%--                                                    <div class="ps-product__badge">-${p.percent_sale}%</div>--%>
<%--                                                </c:if>--%>
<%--                                                <ul class="ps-product__actions">--%>
<%--                                                    <li><a href="http://nouthemes.net/html/martfury/vendor-store.html?fbclid=IwAR34lv6i2N1F0WeQ6v_nndU5P7cY5WGoaod8mqRR6oc4XDB9CNSglLEKi3s#" data-toggle="tooltip" data-placement="top" title="" data-original-title="Add To Cart"><i class="icon-bag2"></i></a></li>--%>
<%--                                                    <li><a href="http://nouthemes.net/html/martfury/vendor-store.html?fbclid=IwAR34lv6i2N1F0WeQ6v_nndU5P7cY5WGoaod8mqRR6oc4XDB9CNSglLEKi3s#" data-placement="top" title="Quick View" data-toggle="modal" data-target="#product-quickview"><i class="icon-eye"></i></a></li>--%>
<%--                                                    <li><a href="http://nouthemes.net/html/martfury/vendor-store.html?fbclid=IwAR34lv6i2N1F0WeQ6v_nndU5P7cY5WGoaod8mqRR6oc4XDB9CNSglLEKi3s#" data-toggle="tooltip" data-placement="top" title="" data-original-title="Add to Whishlist"><i class="icon-heart"></i></a></li>--%>
<%--                                                    <li><a href="http://nouthemes.net/html/martfury/vendor-store.html?fbclid=IwAR34lv6i2N1F0WeQ6v_nndU5P7cY5WGoaod8mqRR6oc4XDB9CNSglLEKi3s#" data-toggle="tooltip" data-placement="top" title="" data-original-title="Compare"><i class="icon-chart-bars"></i></a></li>--%>
<%--                                                </ul>--%>
<%--                                            </div>--%>
<%--                                            <div class="ps-product__container"><a class="ps-product__vendor" href="http://nouthemes.net/html/martfury/vendor-store.html?fbclid=IwAR34lv6i2N1F0WeQ6v_nndU5P7cY5WGoaod8mqRR6oc4XDB9CNSglLEKi3s#"></a>--%>
<%--                                                <div class="ps-product__content"><a class="ps-product__title" href="http://nouthemes.net/html/martfury/product-default.html">${p.name}</a>--%>
<%--                                                    <div class="ps-product__rating">--%>
<%--                                                        <div class="br-wrapper br-theme-fontawesome-stars"><select class="ps-rating" data-read-only="true" style="display: none;">--%>
<%--                                                            <option value="1">1</option>--%>
<%--                                                            <option value="1">2</option>--%>
<%--                                                            <option value="1">3</option>--%>
<%--                                                            <option value="1">4</option>--%>
<%--                                                            <option value="2">5</option>--%>
<%--                                                        </select><div class="br-widget br-readonly"><a href="http://nouthemes.net/html/martfury/vendor-store.html?fbclid=IwAR34lv6i2N1F0WeQ6v_nndU5P7cY5WGoaod8mqRR6oc4XDB9CNSglLEKi3s#" data-rating-value="1" data-rating-text="1" class="br-selected br-current"></a><a href="http://nouthemes.net/html/martfury/vendor-store.html?fbclid=IwAR34lv6i2N1F0WeQ6v_nndU5P7cY5WGoaod8mqRR6oc4XDB9CNSglLEKi3s#" data-rating-value="1" data-rating-text="2" class="br-selected br-current"></a><a href="http://nouthemes.net/html/martfury/vendor-store.html?fbclid=IwAR34lv6i2N1F0WeQ6v_nndU5P7cY5WGoaod8mqRR6oc4XDB9CNSglLEKi3s#" data-rating-value="1" data-rating-text="3" class="br-selected br-current"></a><a href="http://nouthemes.net/html/martfury/vendor-store.html?fbclid=IwAR34lv6i2N1F0WeQ6v_nndU5P7cY5WGoaod8mqRR6oc4XDB9CNSglLEKi3s#" data-rating-value="1" data-rating-text="4" class="br-selected br-current"></a><a href="http://nouthemes.net/html/martfury/vendor-store.html?fbclid=IwAR34lv6i2N1F0WeQ6v_nndU5P7cY5WGoaod8mqRR6oc4XDB9CNSglLEKi3s#" data-rating-value="2" data-rating-text="5"></a><div class="br-current-rating">1</div></div></div><span>01</span>--%>
<%--                                                    </div>--%>
<%--                                                        <c:if test="${p.percent_sale> 0}">--%>
<%--                                                            <p class="ps-product__price sale"> ${Util.formatCurrency(p.price_sale)} <del>${Util.formatCurrency(p.price)}</del></p>--%>
<%--                                                        </c:if>--%>
<%--                                                    <c:if test="${p.percent_sale== 0}">--%>
<%--                                                        <p class="ps-product__price sale">${Util.formatCurrency(p.price)}</p>--%>
<%--                                                    </c:if>--%>

<%--                                                </div>--%>
<%--                                                <div class="ps-product__content hover"><a class="ps-product__title" href="http://nouthemes.net/html/martfury/product-default.html">${p.name}</a>--%>
<%--                                                    <c:if test="${p.percent_sale> 0}">--%>
<%--                                                        <p class="ps-product__price sale"> ${Util.formatCurrency(p.price_sale)} <del>${Util.formatCurrency(p.price)}</del></p>--%>
<%--                                                    </c:if>--%>
<%--                                                    <c:if test="${p.percent_sale== 0}">--%>
<%--                                                        <p class="ps-product__price sale">${Util.formatCurrency(p.price)}</p>--%>
<%--                                                    </c:if>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                    </c:forEach>--%>
                                    <c:forEach var="sgd" items="${products}">
                                        <div class="col-lg-4 col-md-6 col-sm-6" style="margin-bottom: 10px;margin-top: 10px">
                                            <c:if test="${sgd.percent_sale==0}">
                                                <div class="featured__item">
                                                    <div class="featured__item__pic ">
                                                        <a href="/shop-detail?product=${sgd.slug}"><img src="${sgd.img}" alt=""></a>
                                                        <ul class="featured__item__pic__hover">
                                                            <li class="fast-checkout cursor-pointer" data-pro_id="${sgd.id}"><a><i class="fa fa-money"></i></a></li>
                                                            <c:if test="${sessionScope.user_id!=null}">
                                                                <li class="addFa cursor-pointer" data-current_page="shopping" data-pro_id="${sgd.id}"><a ><i class="fa fa-heart"></i></a></li>
                                                            </c:if>
                                                            <li class="addCart cursor-pointer" data-current_page="shopping" data-pro_id="${sgd.id}"><a ><i class="fa fa-shopping-cart"></i></a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="featured__item__text">
                                                        <h4 class=" text-truncate" data-toggle="tooltip"><a href="#">${sgd.name}</a></h4>
                                                        <h5>${Util.formatCurrency(sgd.price)}</h5>
                                                        <p>Đã bán ${sgd.sold}</p>
                                                    </div>

                                                </div>
                                            </c:if>
                                            <c:if test="${sgd.percent_sale>0}">
                                                <div class="product__discount__item">

                                                    <div class="product__discount__item__pic">
                                                        <a href=""><img src="${sgd.img}" alt=""></a>
                                                        <!--                                    <a href="" class="fload-img"></a>-->
                                                        <div class="product__discount__percent">-${sgd.percent_sale}%</div>
                                                        <ul class="product__item__pic__hover">
                                                            <li><a href="#"><i class="fa fa-money"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>


                                                        </ul>
                                                    </div>

                                                    <div class="product__discount__item__text">

                                                        <h4 class=" text-truncate" data-toggle="tooltip" title="${sgd.name}"><a href="#">${sgd.name}</a></h4>
                                                        <div class="product__item__price"><h5 style="display: inline-block">
                                                                ${Util.formatCurrency(sgd.price_sale)}</h5> <span>${Util.formatCurrency(sgd.price)}</span>
                                                        </div>
                                                        <p>Đã bán ${sgd.sold}</p>
                                                            <%--                                    <div class="progress progress-style mb-5">--%>

                                                            <%--                                        <div--%>
                                                            <%--                                                class="progress-bar bg-warning"--%>
                                                            <%--                                                role="progressbar"--%>
                                                            <%--                                                style="width: ${sgd.percent_sale_past()}%"--%>
                                                            <%--                                                aria-valuenow="60"--%>
                                                            <%--                                                aria-valuemin="0"--%>
                                                            <%--                                                aria-valuemax="100">--%>
                                                            <%--                                        </div>--%>
                                                            <%--                                        <div class="progress-text" >--%>
                                                            <%--                                            <img src="user_page/img/icon/fire.png" style="width:2rem !important; display: inline-block; margin-bottom: 8px;" alt="">--%>
                                                            <%--                                            <p style="display: inline-block; color:#f34f00"> Còn ${sgd.dayRest()} ngày</p>--%>
                                                            <%--                                        </div>--%>

                                                            <%--                                    </div>--%>
                                                    </div>


                                                </div>
                                            </c:if>
                                        </div>

                                    </c:forEach>
                                </div>
                            </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%--<jsp:include page="footer.jsp"></jsp:include>--%>
<%--<script src="user_page/supplier/jquery.min.js.download"></script>--%>
<%--<script src="user_page/supplier/nouislider.min.js.download"></script>--%>
<%--<script src="user_page/supplier/popper.min.js.download"></script>--%>
<%--<script src="user_page/supplier/owl.carousel.min.js.download"></script>--%>
<%--<script src="user_page/supplier/bootstrap.min.js.download"></script>--%>
<%--<script src="user_page/supplier/imagesloaded.pkgd.min.js.download"></script>--%>
<%--<script src="user_page/supplier/masonry.pkgd.min.js.download"></script>--%>
<%--<script src="user_page/supplier/isotope.pkgd.min.js.download"></script>--%>
<%--<script src="user_page/supplier/jquery.matchHeight-min.js.download"></script>--%>
<%--<script src="user_page/supplier/slick.min.js.download"></script>--%>
<%--<script src="user_page/supplier/jquery.barrating.min.js.download"></script>--%>
<%--<script src="user_page/supplier/slick-animation.min.js.download"></script>--%>
<%--<script src="user_page/supplier/lightgallery-all.min.js.download"></script>--%>
<%--<script src="user_page/supplier/sticky-sidebar.min.js.download"></script>--%>
<%--<script src="user_page/supplier/select2.full.min.js.download"></script>--%>
<%--<script src="user_page/supplier/gmap3.min.js.download"></script>--%>
<!-- custom scripts-->
<%--<script src="user_page/supplier/main.js.download"></script>--%>

<script src="user_page/js/jquery-3.3.1.min.js"></script>
<script src="user_page/js/popper.min.js"></script>
<script src="user_page/js/bootstrap.min.js"></script>
<script src="user_page/js/jquery.nice-select.min.js"></script>
<script src="user_page/js/jquery-ui.min.js"></script>
<script src="user_page/js/owl.carousel.min.js"></script>
<script src="user_page/js/main.js"></script>
<script src="user_page/js/main_home.js"></script>


<%--</body><grammarly-desktop-integration data-grammarly-shadow-root="true"></grammarly-desktop-integration></html>--%>
