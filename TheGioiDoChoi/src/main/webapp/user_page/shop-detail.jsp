<%@ page import="vn.thegioicaycanh.model.util.Util" %><%--
  Created by IntelliJ IDEA.
  User: Trinh Quang Tien
  Date: 28/12/2020
  Time: 15:15
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
    <title>${title}</title>
    <link href="${applicationScope.header.shortcut}" rel="shortcut icon">
    <!-- Css Styles -->
    <!-- Css Styles -->
    <link rel="stylesheet" href="user_page/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/slicknav.min.css" type="text/css">
    <%--    <link rel="stylesheet" href="user_page/css/blog_style.css" type="text/css">--%>
    <link rel="stylesheet" href="user_page/css/style.css" type="text/css">
</head>

<body
        <c:if test="${position != null}">
            <c:out value="Co vo"></c:out>
            onload="load(${position})"
        </c:if>
>
<jsp:include page="Menu.jsp"></jsp:include>
<jsp:include page="search_bar.jsp"></jsp:include>
<!-- Product Details Section Begin -->
<section class="product-details spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-md-6">
                <div class="product__details__pic">
                    <div class="product__details__pic__item">
                        <img class="product__details__pic__item--large"
                             src="${product.img}" alt="">
                    </div>
                    <div class="product__details__pic__slider owl-carousel">
                        <img data-imgbigurl="img/product/details/product-details-1_1.jpg"
                             src="img/product/details/thumb-1_1.jpg" alt="">
                        <img data-imgbigurl="img/product/details/product-details-1_2.jpg"
                             src="img/product/details/thumb-1_2.jpg" alt="">
                        <img data-imgbigurl="img/product/details/product-details-1_3.jpg"
                             src="img/product/details/thumb-1_3.jpg" alt="">
                        <img data-imgbigurl="img/product/details/product-details-1_4.jpg"
                             src="img/product/details/thumb-1_4.jpg" alt="">
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-6">
                <div class="product__details__text">
                    <c:set var="price" value="${product.price}"></c:set>
                    <c:set var="pricesale" value="${product.price_sale}"></c:set>
                    <h3>${product.name}</h3>
<%--                    <div class="product__details__rating">--%>
<%--                        <i class="fa fa-star"></i>--%>
<%--                        <i class="fa fa-star"></i>--%>
<%--                        <i class="fa fa-star"></i>--%>
<%--                        <i class="fa fa-star"></i>--%>
<%--                        <i class="fa fa-star-half-o"></i>--%>

<%--                        <span>(${procountcomment.contcomment} bình luận)</span>--%>
<%--                    </div>--%>
                    <c:if test="${proavgstar.avgstar==5}">
                        <div class="product__details__rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <span>(${procountcomment.contcomment} bình luận)</span>
                        </div>
                    </c:if>
                    <c:if test="${proavgstar.avgstar==4}">
                        <div class="product__details__rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i style="color: #edbb0e;" class="fa fa-star-o"></i>
                            <span>(${procountcomment.contcomment} bình luận)</span>
                        </div>
                    </c:if>
                    <c:if test="${proavgstar.avgstar==3}">
                        <div class="product__details__rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i style="color: #edbb0e;" class="fa fa-star-o"></i>
                            <i style="color: #edbb0e;" class="fa fa-star-o"></i>
                            <span>(${procountcomment.contcomment} bình luận)</span>
                        </div>
                    </c:if>
                    <c:if test="${proavgstar.avgstar==2}">
                        <div class="product__details__rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i style="color: #edbb0e;" class="fa fa-star-o"></i>
                            <i style="color: #edbb0e;" class="fa fa-star-o"></i>
                            <i style="color: #edbb0e;" class="fa fa-star-o"></i>
                            <span>(${procountcomment.contcomment} bình luận)</span>
                        </div>
                    </c:if>
                    <c:if test="${proavgstar.avgstar==1}">
                        <div class="product__details__rating">
                            <i class="fa fa-star"></i>
                            <i style="color: #edbb0e;" class="fa fa-star-o"></i>
                            <i style="color: #edbb0e;" class="fa fa-star-o"></i>
                            <i style="color: #edbb0e;" class="fa fa-star-o"></i>
                            <i style="color: #edbb0e;" class="fa fa-star-o"></i>
                            <span>(${procountcomment.contcomment} bình luận)</span>
                        </div>
                    </c:if>
                    <c:if test="${proavgstar.avgstar>1&&proavgstar.avgstar<2}">
                        <div class="product__details__rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-half-o"></i>
                            <i style="color: #edbb0e;" class="fa fa-star-o"></i>
                            <i style="color: #edbb0e;" class="fa fa-star-o"></i>
                            <i style="color: #edbb0e;" class="fa fa-star-o"></i>
                            <span>(${procountcomment.contcomment} bình luận)</span>
                        </div>
                    </c:if>
                    <c:if test="${proavgstar.avgstar>2&&proavgstar.avgstar<3}">
                        <div class="product__details__rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-half-o"></i>
                            <i style="color: #edbb0e;" class="fa fa-star-o"></i>
                            <i style="color: #edbb0e;" class="fa fa-star-o"></i>
                            <span>(${procountcomment.contcomment} bình luận)</span>
                        </div>
                    </c:if>
                    <c:if test="${proavgstar.avgstar>3&&proavgstar.avgstar<4}">
                        <div class="product__details__rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-half-o"></i>
                            <i style="color: #edbb0e;" class="fa fa-star-o"></i>
                            <span>(${procountcomment.contcomment} bình luận)</span>
                        </div>
                    </c:if>
                    <c:if test="${proavgstar.avgstar>4&&proavgstar.avgstar<5}">
                        <div class="product__details__rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-half-o"></i>
                            <span>(${procountcomment.contcomment} bình luận)</span>
                        </div>
                    </c:if>

                    <div class="product__details__price"><%= Util.formatCurrency((double)pageContext.getAttribute("pricesale")) %><span><%= Util.formatCurrency((double)pageContext.getAttribute("price")) %></span> </div>
                    <!-- <div class="product__item__price">110.000 VNĐ <span>130.000 VNĐ</span></div>(-15%) -->
                    <!-- <p>Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Vestibulum ac diam sit amet quam
                        vehicula elementum sed sit amet dui. Sed porttitor lectus nibh. Vestibulum ac diam sit amet
                        quam vehicula elementum sed sit amet dui. Proin eget tortor risus.</p> -->

                    <a  class="addCart cursor-pointer primary-btn" data-current_page="shop-detail" data-pro_id="${id}" style="background-color: #7fad3926;color: #7fad39;border: 1px solid  #7fad39;"><i style="color: #7fad39 ;font-size: 15px;" class="fa fa-cart-plus"></i>THÊM VÀO GIỎ HÀNG</a>
                    <a  class="fast-checkout cursor-pointer primary-btn" data-pro_id="${id}">MUA NGAY</a>
                    <c:if test="${sessionScope.user_id!=null}">
                    <a class="addFa cursor-pointer heart-icon" data-current_page="shop-detail" data-pro_id="${id}"><span class="icon_heart_alt"></span></a>
                    </c:if>
                        <ul>
                        <li><b>Trình trạng hàng</b> <span><c:if test="${product.active}">Còn hàng</c:if><c:if test="${!product.active}">Hết hàng</c:if></span></li>
<%--                        <li><b>Giao hàng</b> <span>Giao hàng trong ngày. <samp>Miễn phí vận chuyển</samp></span></li>--%>
                        <li><b>Thông tin sản phẩm</b> <span>${product.description}
<%--                        <li><b>Cân nặng</b> <span>0.5 kg</span></li>--%>
<%--                        <li><b>Chia sẻ</b>--%>
<%--                            <div class="share">--%>
<%--                                <a href="${applicationScope.social_media.fb}"><i class="fa fa-facebook"></i></a>--%>
<%--                                <a href="${applicationScope.social_media.in}"><i class="fa fa-instagram"></i></a>--%>
<%--                                <a href="${applicationScope.social_media.tw}"><i class="fa fa-twitter"></i></a>--%>
<%--                                <a href="${applicationScope.social_media.pi}"><i class="fa fa-pinterest-p"></i></a>--%>
<%--                            </div>--%>
<%--                        </li>--%>
                    </ul>
                </div>
            </div>
            <div class="col-lg-12">
                <div class="product__details__tab">
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
                               aria-selected="true">Mô tả sản phẩm</a>
                        </li>
                        <!-- <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab"
                                aria-selected="false">Information</a>
                        </li> -->
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab"
                               aria-selected="false">Đánh giá sản phẩm <span>(3)</span></a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tabs-1" role="tabpanel">
                            <div class="product__details__tab__desc">
                                <h6>Mô tả sản phẩm</h6>
                                <p>${product.content}</p>
                            </div>
                        </div>
                        <div class="tab-pane" id="tabs-2" role="tabpanel">
                            <div class="product__details__tab__desc">
                                <h6>Mô tả sản phẩm</h6>
                                <p>${product.description}</p>
                            </div>
                        </div>
                        <div class="tab-pane" id="tabs-3" role="tabpanel">
                            <div class="product__details__tab__desc">
                                <h6>Mô tả sản phẩm </h6>
                                <p>${product.description}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Product Details Section End -->
<!-- Product Reviews Section Begin -->

<section class="product-reviews">
    <!-- <div class="container" style="background-color: bisque;width: 85%;height: 300px;">

    </div> -->

    <b style="margin-left: 101px;font-size: 16px;">Đánh giá sản phẩm</b><br><br>
    <div class="product-rating-overview">
        <div class="product-rating-overview__briefing">
            <div class="product-rating-overview__score-wrapper">

                <span class="product-rating-overview__rating-score">${proavgstar.avgstar}/5</span>
                <c:if test="${proavgstar.avgstar==5}">
                    <div class="starratingcontain">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                    </div>
                </c:if>
                <c:if test="${proavgstar.avgstar==4}">
                    <div class="starratingcontain">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i style="color: #edbb0e;" class="fa fa-star-o"></i>
                    </div>
                </c:if>
                <c:if test="${proavgstar.avgstar==3}">
                    <div class="starratingcontain">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i style="color: #edbb0e;" class="fa fa-star-o"></i>
                        <i style="color: #edbb0e;" class="fa fa-star-o"></i>
                    </div>
                </c:if>
                <c:if test="${proavgstar.avgstar==2}">
                    <div class="starratingcontain">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i style="color: #edbb0e;" class="fa fa-star-o"></i>
                        <i style="color: #edbb0e;" class="fa fa-star-o"></i>
                        <i style="color: #edbb0e;" class="fa fa-star-o"></i>
                    </div>
                </c:if>
                <c:if test="${proavgstar.avgstar==1}">
                    <div class="starratingcontain">
                        <i class="fa fa-star"></i>
                        <i style="color: #edbb0e;" class="fa fa-star-o"></i>
                        <i style="color: #edbb0e;" class="fa fa-star-o"></i>
                        <i style="color: #edbb0e;" class="fa fa-star-o"></i>
                        <i style="color: #edbb0e;" class="fa fa-star-o"></i>
                    </div>
                </c:if>
                <c:if test="${proavgstar.avgstar>1&&proavgstar.avgstar<2}">
                    <div class="starratingcontain">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star-half-o"></i>
                        <i style="color: #edbb0e;" class="fa fa-star-o"></i>
                        <i style="color: #edbb0e;" class="fa fa-star-o"></i>
                        <i style="color: #edbb0e;" class="fa fa-star-o"></i>
                    </div>
                </c:if>
                <c:if test="${proavgstar.avgstar>2&&proavgstar.avgstar<3}">
                    <div class="starratingcontain">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star-half-o"></i>
                        <i style="color: #edbb0e;" class="fa fa-star-o"></i>
                        <i style="color: #edbb0e;" class="fa fa-star-o"></i>
                    </div>
                </c:if>
                <c:if test="${proavgstar.avgstar>3&&proavgstar.avgstar<4}">
                    <div class="starratingcontain">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star-half-o"></i>
                        <i style="color: #edbb0e;" class="fa fa-star-o"></i>
                    </div>
                </c:if>
                <c:if test="${proavgstar.avgstar>4&&proavgstar.avgstar<5}">
                    <div class="starratingcontain">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star-half-o"></i>
                    </div>
                </c:if>

                <span class="product-rating-overview__rating-score-out-of"></span><br>

            </div>
            <!-- <div class="shopee-rating-stars product-rating-overview__stars">
                    <div class="shopee-rating-stars__stars">
                        <div class="shopee-rating-stars__star-wrapper">
                            <div class="shopee-rating-stars__lit" style="width: 100%;">
                                <svg enable-background="new 0 0 15 15" viewBox="0 0 15 15" x="0" y="0" class="shopee-svg-icon shopee-rating-stars__primary-star icon-rating-solid">
                                        <polygon points="7.5 .8 9.7 5.4 14.5 5.9 10.7 9.1 11.8 14.2 7.5 11.6 3.2 14.2 4.3 9.1 .5 5.9 5.3 5.4" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10"></polygon>
                                </svg>
                            </div>
                                <svg enable-background="new 0 0 15 15" viewBox="0 0 15 15" x="0" y="0" class="shopee-svg-icon shopee-rating-stars__hollow-star icon-rating">
                                <polygon fill="none" points="7.5 .8 9.7 5.4 14.5 5.9 10.7 9.1 11.8 14.2 7.5 11.6 3.2 14.2 4.3 9.1 .5 5.9 5.3 5.4" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10"></polygon>
                                </svg>
                        </div>
                        <div class="shopee-rating-stars__star-wrapper">
                            <div class="shopee-rating-stars__lit" style="width: 100%;"><svg enable-background="new 0 0 15 15" viewBox="0 0 15 15" x="0" y="0" class="shopee-svg-icon shopee-rating-stars__primary-star icon-rating-solid">
                                <polygon points="7.5 .8 9.7 5.4 14.5 5.9 10.7 9.1 11.8 14.2 7.5 11.6 3.2 14.2 4.3 9.1 .5 5.9 5.3 5.4" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10"></polygon>
                                </svg>
                            </div>
                                <svg enable-background="new 0 0 15 15" viewBox="0 0 15 15" x="0" y="0" class="shopee-svg-icon shopee-rating-stars__hollow-star icon-rating">
                                    <polygon fill="none" points="7.5 .8 9.7 5.4 14.5 5.9 10.7 9.1 11.8 14.2 7.5 11.6 3.2 14.2 4.3 9.1 .5 5.9 5.3 5.4" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10"></polygon>
                                </svg>
                        </div>
                        <div class="shopee-rating-stars__star-wrapper">
                            <div class="shopee-rating-stars__lit" style="width: 100%;">
                                <svg enable-background="new 0 0 15 15" viewBox="0 0 15 15" x="0" y="0" class="shopee-svg-icon shopee-rating-stars__primary-star icon-rating-solid">
                                    <polygon points="7.5 .8 9.7 5.4 14.5 5.9 10.7 9.1 11.8 14.2 7.5 11.6 3.2 14.2 4.3 9.1 .5 5.9 5.3 5.4" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10">
                                    </polygon>
                                </svg>
                            </div>
                            <svg enable-background="new 0 0 15 15" viewBox="0 0 15 15" x="0" y="0" class="shopee-svg-icon shopee-rating-stars__hollow-star icon-rating">
                                <polygon fill="none" points="7.5 .8 9.7 5.4 14.5 5.9 10.7 9.1 11.8 14.2 7.5 11.6 3.2 14.2 4.3 9.1 .5 5.9 5.3 5.4" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10">

                            </polygon>
                            </svg>
                        </div>
                        <div class="shopee-rating-stars__star-wrapper">
                            <div class="shopee-rating-stars__lit" style="width: 100%;">
                                <svg enable-background="new 0 0 15 15" viewBox="0 0 15 15" x="0" y="0" class="shopee-svg-icon shopee-rating-stars__primary-star icon-rating-solid">
                                    <polygon points="7.5 .8 9.7 5.4 14.5 5.9 10.7 9.1 11.8 14.2 7.5 11.6 3.2 14.2 4.3 9.1 .5 5.9 5.3 5.4" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10">

                                    </polygon>
                                </svg>
                            </div>
                                <svg enable-background="new 0 0 15 15" viewBox="0 0 15 15" x="0" y="0" class="shopee-svg-icon shopee-rating-stars__hollow-star icon-rating">
                                    <polygon fill="none" points="7.5 .8 9.7 5.4 14.5 5.9 10.7 9.1 11.8 14.2 7.5 11.6 3.2 14.2 4.3 9.1 .5 5.9 5.3 5.4" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10">

                                    </polygon>
                                </svg>
                        </div>
                        <div class="shopee-rating-stars__star-wrapper">
                            <div class="shopee-rating-stars__lit" style="width: 93.75%;">
                                <svg enable-background="new 0 0 15 15" viewBox="0 0 15 15" x="0" y="0" class="shopee-svg-icon shopee-rating-stars__primary-star icon-rating-solid">
                                    <polygon points="7.5 .8 9.7 5.4 14.5 5.9 10.7 9.1 11.8 14.2 7.5 11.6 3.2 14.2 4.3 9.1 .5 5.9 5.3 5.4" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10">

                                    </polygon>
                                </svg>
                            </div>
                                <svg enable-background="new 0 0 15 15" viewBox="0 0 15 15" x="0" y="0" class="shopee-svg-icon shopee-rating-stars__hollow-star icon-rating">
                                    <polygon fill="none" points="7.5 .8 9.7 5.4 14.5 5.9 10.7 9.1 11.8 14.2 7.5 11.6 3.2 14.2 4.3 9.1 .5 5.9 5.3 5.4" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10">

                                </polygon>
                        </svg>
                    </div>
                </div>
            </div> -->
        </div>
        <div class="product-rating-overview__filters"><div class="product-rating-overview__filter product-rating-overview__filter--active product-rating-overview__filter--all">tất cả (${totalratestar})</div>
            <div class="product-rating-overview__filter">5 Sao (${prostar5.countstar})</div>
            <div class="product-rating-overview__filter">4 Sao (${prostar4.countstar})</div>
            <div class="product-rating-overview__filter">3 Sao (${prostar3.countstar})</div>
            <div class="product-rating-overview__filter">2 Sao (${prostar2.countstar})</div>
            <div class="product-rating-overview__filter">1 Sao (${prostar1.countstar})</div>
            <div class="product-rating-overview__filter product-rating-overview__filter--with-comment">Có Bình luận (${procountcomment.contcomment})</div>
<%--            <div class="product-rating-overview__filter product-rating-overview__filter--with-photo">Có hình ảnh / video (0)--%>
            </div>
        </div>
    </div>
    <!-- comment section begin -->
<c:forEach items="${usercomment}" var="cv">
    <div class="comment-reviews">
        <a class="shopee-product-rating__avatar" ></a>
        <div class="shopee-avatar" >
<%--            <div class="shopee-avatar" style="width: 50px;height: 50px;border-color: #00acc1;display: block">--%>
<%--                <svg enable-background="new 0 0 15 15" viewBox="0 0 15 15" x="0" y="0" class="shopee-svg-icon icon-headshot">--%>
<%--                    <g>--%>
<%--                        <circle cx="7.5" cy="4.5" fill="none" r="3.8" stroke-miterlimit="10">--%>

<%--                        </circle>--%>
<%--                        <path d="m1.5 14.2c0-3.3 2.7-6 6-6s6 2.7 6 6" fill="none" stroke-linecap="round" stroke-miterlimit="10">--%>

<%--                        </path>--%>
<%--                    </g>--%>
<%--                </svg>--%>
                <img style="border-radius: 50% ;display: block;height: 30px;width: 30px" class="shopee-avatar__img" src="${cv.avatar}">
<%--            </div>--%>
        </div>
        <b>${cv.name}</b><i class="fa fa-check-circle" style="color:  #7fad39;font-size: 20px;margin-left: 5px; margin-right: 5px;"></i><i style="color: #7fad39 ;">Đã mua hàng ở thế giới cây cảnh</i><br>
        <i class="size-time">${cv.date_created_commnent}</i><br>
        <i>Đánh giá: </i><b class="sao"><c:if test="${cv.rating_type_id==1}">5/5</c:if><c:if test="${cv.rating_type_id==2}">4/5</c:if><c:if test="${cv.rating_type_id==3}">3/5</c:if><c:if test="${cv.rating_type_id==4}">2/5</c:if><c:if test="${cv.rating_type_id==5}">1/5</c:if></b>
        <c:if test="${cv.rating_type_id==1}">
        <div class="starrating">
            <i class="fa fa-star"></i>
            <i class="fa fa-star"></i>
            <i class="fa fa-star"></i>
            <i class="fa fa-star"></i>
            <i class="fa fa-star"></i>
        </div>
        </c:if>
        <c:if test="${cv.rating_type_id==2}">
            <div class="starrating">
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
                <i style="color: #edbb0e;" class="fa fa-star-o"></i>
            </div>
        </c:if>
        <c:if test="${cv.rating_type_id==3}">
            <div class="starrating">
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
                <i style="color: #edbb0e;" class="fa fa-star-o"></i>
                <i style="color: #edbb0e;" class="fa fa-star-o"></i>
            </div>
        </c:if>
        <c:if test="${cv.rating_type_id==4}">
            <div class="starrating">
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
                <i style="color: #edbb0e;" class="fa fa-star-o"></i>
                <i style="color: #edbb0e;" class="fa fa-star-o"></i>
                <i style="color: #edbb0e;" class="fa fa-star-o"></i>
            </div>
        </c:if>
        <c:if test="${cv.rating_type_id==5}">
            <div class="starrating">
                <i class="fa fa-star"></i>
                <i style="color: #edbb0e;" class="fa fa-star-o"></i>
                <i style="color: #edbb0e;" class="fa fa-star-o"></i>
                <i style="color: #edbb0e;" class="fa fa-star-o"></i>
                <i style="color: #edbb0e;" class="fa fa-star-o"></i>
            </div>
        </c:if>
<%--        <i>Phân loại hàng:</i> Cây để bàn<br>--%>
        <i>Nhận xét : </i>${cv.comment}<br>
        <div class="containhuuich" >
<%--            <div class="huuich">--%>
<%--                <i>="class="fa fa-thumbs-up"></i> <i style="color: #7fad39;">Hữu ích (5)</i>--%>
<%--            </div>--%>
<%--            <i style="float: left;margin-left: 5px;color:#7fad39 ;padding-top: 2px;cursor: pointer;">Gửi trả lời</i>--%>
        </div>
        </a>
    </div>
    </c:forEach>
    <!-- end binh luan 1 -->

    <!-- comment section end -->
</section>
<!-- Product Reviews Section End -->
<!-- Related Product Section Begin -->
<section class="related-product">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title related__product__title">
                    <h2>Sản phẩm liên quan</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <c:forEach items="${relaproducts}" var="rl">
                <c:set var="price" value="${rl.price}"></c:set>
                <c:set var="pricesale" value="${rl.price_sale}"></c:set>
<%--                <%= Util.formatCurrency((double)pageContext.getAttribute("pricesale")) %>--%>
<%--                <%= Util.formatCurrency((double)pageContext.getAttribute("price")) %>--%>
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="product__item">
                    <div class="product__item__pic set-bg" data-setbg="${rl.img}">
                        <ul class="product__item__pic__hover">
<%--                            <li><a href="#"><i class="fa fa-money"></i></a></li>--%>
<%--                            <c:if test="${sessionScope.user_id!=null}">--%>
<%--                            <li><a href="#"><i class="fa fa-heart"></i></a></li>--%>
<%--                            </c:if>--%>
<%--                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>--%>

                            <li class="fast-checkout cursor-pointer" data-pro_id="${rl.id}"><a ><i class="fa fa-money"></i></a></li>
                            <c:if test="${sessionScope.user_id!=null}">
                                <li class="addFa cursor-pointer" data-current_page="shop-detail" data-pro_id="${rl.id}"><a><i class="fa fa-heart"></i></a></li>
                            </c:if>
                            <li class="addCart cursor-pointer" data-current_page="shop-detail" data-pro_id="${rl.id}"><a ><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="product__item__text">
                        <h6><a href="shop-detail?id=${rl.id}">${rl.name}</a></h6>
                        <h5><%= Util.formatCurrency((double)pageContext.getAttribute("pricesale")) %> <span> <%= Util.formatCurrency((double)pageContext.getAttribute("pricesale")) %> </span></h5>
                    </div>
                </div>
            </div>
            </c:forEach>
        </div>
    </div>
</section>
<!-- Related Product Section End -->
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
