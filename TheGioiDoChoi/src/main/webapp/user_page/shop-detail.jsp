<%@ page import="vn.thegioidochoi.model.util.Util" %><%--
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
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>${title}</title>
    <link href="${applicationScope.header.shortcut}" rel="shortcut icon">
    <link href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,500,600,700&amp;amp;subset=latin-ext"
          rel="stylesheet">
    <link rel="stylesheet" href="user_page/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/nice-select.css" type="text/css">
<%--        <link rel="stylesheet" href="user_page/css/nice-select.css" type="text/css">--%>
    <link rel="stylesheet" href="user_page/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/owl.theme.default.min.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/slick.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/lightgallery.min.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/fontawesome-stars.css" type="text/css">
    <%--    <link rel="stylesheet" href="user_page/css/blog_style.css" type="text/css">--%>
    <link rel="stylesheet" href="user_page/css/style.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/style_home.css" type="text/css">
</head>

<body style="background: #f1f1f1"
<%--        <c:if test="${position != null}">--%>
<%--            <c:out value="Co vo"></c:out>--%>
<%--            onload="load(${position})"--%>
<%--        </c:if>--%>
>
<div style="display: none" class="no_nice_selection"></div>
<jsp:include page="Menu.jsp"></jsp:include>
<%--<jsp:include page="search_bar.jsp"></jsp:include>--%>

<%-- Product details begin--%>
<%-- Details begin --%>
<%--<section class="product-details" style="margin-top: 40px">--%>
<%--    <div class="container">--%>
<%--        <div class="row  mb--60">--%>
<%--            <div class="col-lg-5 mb--30">--%>
<%--                <div class="product-imgs">--%>
<%--                    <div class="img-display">--%>
<%--                        <div class="img-showcase">--%>
<%--                            <img class="zoom" src="${product.img}">--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="img-select">--%>
<%--                        <div class="img-item">--%>
<%--                            <a href="#" data-id="1" data-toggle="modal" data-target=".bd-example-modal-lg">--%>
<%--                                <img src="${product.img}" onclick="changeImage('img-one')">--%>
<%--                            </a>--%>
<%--                        </div>--%>
<%--                        <div class="img-item">--%>
<%--                            <a href="#" data-id="2" data-toggle="modal" data-target=".bd-example-modal-lg">--%>
<%--                                <img src="${images[0].url}" onclick="changeImage('img-two')">--%>
<%--                            </a>--%>
<%--                        </div>--%>
<%--                        <div class="img-item">--%>
<%--                            <a href="#" data-id="3" data-toggle="modal" data-target=".bd-example-modal-lg">--%>
<%--                                <img src="${images[1].url}" onclick="changeImage('img-three')">--%>
<%--                            </a>--%>
<%--                        </div>--%>
<%--                        <div class="img-item" data-toggle="modal" data-target=".bd-example-modal-lg">--%>
<%--                            <a href="#" data-id="4">--%>
<%--                                <img src="${images[2].url}" onclick="changeImage('img-four')">--%>
<%--                            </a>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col-lg-7">--%>
<%--                <div class="product-content">--%>
<%--                    <h2 class="product-title ">${product.name}</h2>--%>
<%--                    <div class="product-detail">--%>
<%--                        <div>Thương hiệu<span>${supplier.company_name}</span></div>--%>
<%--                        <div>Mã sản phẩm<span>${product.product_code}</span></div>--%>
<%--                        <div>Tình trạng<span><c:if test="${product.active}">Còn hàng</c:if><c:if--%>
<%--                                test="${!product.active}">Hết hàng</c:if></span></div>--%>
<%--                    </div>--%>
<%--                    <div class="product-price">--%>
<%--                        <c:set var="price" value="${product.price}"></c:set>--%>
<%--                        <c:set var="pricesale" value="${product.price_sale}"></c:set>--%>
<%--                        <p class="last-price "><%= Util.formatCurrency((double) pageContext.getAttribute("pricesale")) %>--%>
<%--                            <span class="sale-price"><%= Util.formatCurrency((double) pageContext.getAttribute("price")) %></span>--%>
<%--                        </p>--%>
<%--                    </div>--%>
<%--                    <div class="product-rating">--%>
<%--                        <c:if test="${proavgstar.avgstar==5}">--%>
<%--                            <div class="product__details__rating">--%>
<%--                                <i class="fa fa-star"></i>--%>
<%--                                <i class="fa fa-star"></i>--%>
<%--                                <i class="fa fa-star"></i>--%>
<%--                                <i class="fa fa-star"></i>--%>
<%--                                <i class="fa fa-star"></i>--%>
<%--                                <span>(${procountcomment.contcomment} bình luận)</span>--%>
<%--                            </div>--%>
<%--                        </c:if>--%>
<%--                        <c:if test="${proavgstar.avgstar==4}">--%>
<%--                            <div class="product__details__rating">--%>
<%--                                <i class="fa fa-star"></i>--%>
<%--                                <i class="fa fa-star"></i>--%>
<%--                                <i class="fa fa-star"></i>--%>
<%--                                <i class="fa fa-star"></i>--%>
<%--                                <i style="color: #edbb0e;" class="fa fa-star-o"></i>--%>
<%--                                <span>(${procountcomment.contcomment} bình luận)</span>--%>
<%--                            </div>--%>
<%--                        </c:if>--%>
<%--                        <c:if test="${proavgstar.avgstar==3}">--%>
<%--                            <div class="product__details__rating">--%>
<%--                                <i class="fa fa-star"></i>--%>
<%--                                <i class="fa fa-star"></i>--%>
<%--                                <i class="fa fa-star"></i>--%>
<%--                                <i style="color: #edbb0e;" class="fa fa-star-o"></i>--%>
<%--                                <i style="color: #edbb0e;" class="fa fa-star-o"></i>--%>
<%--                                <span>(${procountcomment.contcomment} bình luận)</span>--%>
<%--                            </div>--%>
<%--                        </c:if>--%>
<%--                        <c:if test="${proavgstar.avgstar==2}">--%>
<%--                            <div class="product__details__rating">--%>
<%--                                <i class="fa fa-star"></i>--%>
<%--                                <i class="fa fa-star"></i>--%>
<%--                                <i style="color: #edbb0e;" class="fa fa-star-o"></i>--%>
<%--                                <i style="color: #edbb0e;" class="fa fa-star-o"></i>--%>
<%--                                <i style="color: #edbb0e;" class="fa fa-star-o"></i>--%>
<%--                                <span>(${procountcomment.contcomment} bình luận)</span>--%>
<%--                            </div>--%>
<%--                        </c:if>--%>
<%--                        <c:if test="${proavgstar.avgstar==1}">--%>
<%--                            <div class="product__details__rating">--%>
<%--                                <i class="fa fa-star"></i>--%>
<%--                                <i style="color: #edbb0e;" class="fa fa-star-o"></i>--%>
<%--                                <i style="color: #edbb0e;" class="fa fa-star-o"></i>--%>
<%--                                <i style="color: #edbb0e;" class="fa fa-star-o"></i>--%>
<%--                                <i style="color: #edbb0e;" class="fa fa-star-o"></i>--%>
<%--                                <span>(${procountcomment.contcomment} bình luận)</span>--%>
<%--                            </div>--%>
<%--                        </c:if>--%>
<%--                        <c:if test="${proavgstar.avgstar>1&&proavgstar.avgstar<2}">--%>
<%--                            <div class="product__details__rating">--%>
<%--                                <i class="fa fa-star"></i>--%>
<%--                                <i class="fa fa-star-half-o"></i>--%>
<%--                                <i style="color: #edbb0e;" class="fa fa-star-o"></i>--%>
<%--                                <i style="color: #edbb0e;" class="fa fa-star-o"></i>--%>
<%--                                <i style="color: #edbb0e;" class="fa fa-star-o"></i>--%>
<%--                                <span>(${procountcomment.contcomment} bình luận)</span>--%>
<%--                            </div>--%>
<%--                        </c:if>--%>
<%--                        <c:if test="${proavgstar.avgstar>2&&proavgstar.avgstar<3}">--%>
<%--                            <div class="product__details__rating">--%>
<%--                                <i class="fa fa-star"></i>--%>
<%--                                <i class="fa fa-star"></i>--%>
<%--                                <i class="fa fa-star-half-o"></i>--%>
<%--                                <i style="color: #edbb0e;" class="fa fa-star-o"></i>--%>
<%--                                <i style="color: #edbb0e;" class="fa fa-star-o"></i>--%>
<%--                                <span>(${procountcomment.contcomment} bình luận)</span>--%>
<%--                            </div>--%>
<%--                        </c:if>--%>
<%--                        <c:if test="${proavgstar.avgstar>3&&proavgstar.avgstar<4}">--%>
<%--                            <div class="product__details__rating">--%>
<%--                                <i class="fa fa-star"></i>--%>
<%--                                <i class="fa fa-star"></i>--%>
<%--                                <i class="fa fa-star"></i>--%>
<%--                                <i class="fa fa-star-half-o"></i>--%>
<%--                                <i style="color: #edbb0e;" class="fa fa-star-o"></i>--%>
<%--                                <span>(${procountcomment.contcomment} bình luận)</span>--%>
<%--                            </div>--%>
<%--                        </c:if>--%>
<%--                        <c:if test="${proavgstar.avgstar>4&&proavgstar.avgstar<5}">--%>
<%--                            <div class="product__details__rating">--%>
<%--                                <i class="fa fa-star"></i>--%>
<%--                                <i class="fa fa-star"></i>--%>
<%--                                <i class="fa fa-star"></i>--%>
<%--                                <i class="fa fa-star"></i>--%>
<%--                                <i class="fa fa-star-half-o"></i>--%>
<%--                                <span>(${procountcomment.contcomment} bình luận)</span>--%>
<%--                            </div>--%>
<%--                        </c:if>--%>
<%--                    </div>--%>
<%--                    <div class="product-detail-short">--%>
<%--                        <p>Hàng chính hãng, chứng nhận an toàn.--%>
<%--                            Miễn phí giao hàng toàn quốc cho đơn trên 400.000 VNĐ</p>--%>
<%--                    </div>--%>
<%--                    <div class="product-purchase">--%>
<%--                        <div class="row">--%>
<%--                            <div class="col-lg-4 col-md-5 col-sm-4">--%>
<%--                                <div class="product-quantity">--%>
<%--                                    <span class="decrease quantity-btn">-</span>--%>
<%--                                    <input type="number" value="1">--%>
<%--                                    <span class="increase quantity-btn">+</span>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="col-lg-8 col-sm-8">--%>
<%--                                <div class="product-cart">--%>
<%--                                    <button type="button" class="btn-cart" data-current_page="shop-detail"--%>
<%--                                            data-pro_id="${id}">--%>
<%--                                        Thêm vào giỏ hàng--%>
<%--                                        <i class="fa fa-shopping-cart"></i>--%>
<%--                                    </button>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="row mb--60">--%>
<%--            <div class="col-lg-12">--%>
<%--                <div class="supplier-summary">--%>
<%--                    <div class="supplier-avatar">--%>
<%--                        <img src="${supplier.logo}">--%>
<%--                    </div>--%>
<%--                    <div class="supplier-detail">--%>
<%--                        <div class="supplier-infor">--%>
<%--                            <div class="supplier-name">${supplier.company_name}</div>--%>
<%--                            <div class="supplier-product">Sản phẩm: <span>${supplier.total_product}</span></div>--%>
<%--                        </div>--%>
<%--                        <button class="btn btn-outline-primary btn-supplier"><i class="fas fa-store-alt"></i>Nhà cung--%>
<%--                            cấp--%>
<%--                        </button>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</section>--%>



<%--///////////////////--%>
<div class="ps-page--product ps-page--product-box">
    <div class="container" style="background: white;
">
        <div class="ps-product--detail ps-product--box">
            <div class="ps-product__header ps-product__box">
                <div class="ps-product__thumbnail" data-vertical="true">
                    <figure>
                        <div class="ps-wrapper">
                            <div class="ps-product__gallery" data-arrow="true">
                                <div class="item"><a href="${product.img}"><img
                                        src="${product.img}" alt=""></a></div>
                                <c:forEach items="${images}" var="image">
                                <div class="item"><a href="${image.url}"><img
                                        src="${image.url}" alt=""></a></div>
                                </c:forEach>
<%--    <div class="item"><a href="user_page/img/products/detail/fullwidth/1.jpg"><img--%>
<%--            src="user_page/img/products/detail/fullwidth/1.jpg" alt=""></a></div>--%>

<%--                                <div class="item"><a href="user_page/img/products/detail/fullwidth/2.jpg"><img--%>
<%--                                        src="user_page/img/products/detail/fullwidth/2.jpg" alt=""></a></div>--%>
<%--                                <div class="item"><a href="user_page/img/products/detail/fullwidth/3.jpg"><img--%>
<%--                                        src="user_page/img/products/detail/fullwidth/3.jpg" alt=""></a></div>--%>
<%--    <div class="item"><a href="user_page/img/products/detail/fullwidth/4.jpg"><img--%>
<%--            src="user_page/img/products/detail/fullwidth/4.jpg" alt=""></a></div>--%>
                            </div>
                        </div>
                    </figure>
                    <div class="ps-product__variants" data-item="4" data-md="4" data-sm="4" data-arrow="false">
                        <div class="item"><img src="${product.img}" alt=""></div>
                        <c:forEach items="${images}" var="image">
                        <div class="item"><img src="${image.url}" alt=""></div>
                        </c:forEach>
<%--                        <div class="item"><img src="user_page/img/products/detail/fullwidth/1.jpg" alt=""></div>--%>
<%--                        <div class="item"><img src="user_page/img/products/detail/fullwidth/2.jpg" alt=""></div>--%>
<%--                        <div class="item"><img src="user_page/img/products/detail/fullwidth/3.jpg" alt=""></div>--%>
<%--                        <div class="item"><img src="user_page/img/products/detail/fullwidth/4.jpg" alt=""></div>--%>
                    </div>
                </div>
                <div class="ps-product__info">
                    <h1>${product.name}</h1>
                    <div class="ps-product__meta">
                        <p class="categories"><strong> Danh mục: </strong><a href="/shopping?cate=${category.slug}">${category.name}</a></p>
                        <p><strong>SKU: </strong> ${product.product_code}</p>

                        <div class="ps-product__rating">
<%--                                                <div class="product-rating">--%>
                                                    <c:if test="${proavgstar.avgstar==5}">
                                                        <div class="product__details__rating">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>

                                                        </div>
                                                    </c:if>
                                                    <c:if test="${proavgstar.avgstar==4}">
                                                        <div class="product__details__rating">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i style="color: #edbb0e;" class="fa fa-star-o"></i>

                                                        </div>
                                                    </c:if>
                                                    <c:if test="${proavgstar.avgstar==3}">
                                                        <div class="product__details__rating">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i style="color: #edbb0e;" class="fa fa-star-o"></i>
                                                            <i style="color: #edbb0e;" class="fa fa-star-o"></i>

                                                        </div>
                                                    </c:if>
                                                    <c:if test="${proavgstar.avgstar==2}">
                                                        <div class="product__details__rating">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i style="color: #edbb0e;" class="fa fa-star-o"></i>
                                                            <i style="color: #edbb0e;" class="fa fa-star-o"></i>
                                                            <i style="color: #edbb0e;" class="fa fa-star-o"></i>

                                                        </div>
                                                    </c:if>
                                                    <c:if test="${proavgstar.avgstar==1}">
                                                        <div class="product__details__rating">
                                                            <i class="fa fa-star"></i>
                                                            <i style="color: #edbb0e;" class="fa fa-star-o"></i>
                                                            <i style="color: #edbb0e;" class="fa fa-star-o"></i>
                                                            <i style="color: #edbb0e;" class="fa fa-star-o"></i>
                                                            <i style="color: #edbb0e;" class="fa fa-star-o"></i>

                                                        </div>
                                                    </c:if>
                                                    <c:if test="${proavgstar.avgstar>1&&proavgstar.avgstar<2}">
                                                        <div class="product__details__rating">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-half-o"></i>
                                                            <i style="color: #edbb0e;" class="fa fa-star-o"></i>
                                                            <i style="color: #edbb0e;" class="fa fa-star-o"></i>
                                                            <i style="color: #edbb0e;" class="fa fa-star-o"></i>

                                                        </div>
                                                    </c:if>
                                                    <c:if test="${proavgstar.avgstar>2&&proavgstar.avgstar<3}">
                                                        <div class="product__details__rating">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-half-o"></i>
                                                            <i style="color: #edbb0e;" class="fa fa-star-o"></i>
                                                            <i style="color: #edbb0e;" class="fa fa-star-o"></i>

                                                        </div>
                                                    </c:if>
                                                    <c:if test="${proavgstar.avgstar>3&&proavgstar.avgstar<4}">
                                                        <div class="product__details__rating">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-half-o"></i>
                                                            <i style="color: #edbb0e;" class="fa fa-star-o"></i>

                                                        </div>
                                                    </c:if>
                                                    <c:if test="${proavgstar.avgstar>4&&proavgstar.avgstar<5}">
                                                        <div class="product__details__rating">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-half-o"></i>

                                                        </div>
                                                    </c:if>
<%--                                                </div>--%>
<%--                            <select class="ps-rating" data-read-only="true">--%>
<%--                                <c:if test="${proavgstar.avgstar==1}">--%>
<%--                                    <option value="1">1</option>--%>
<%--                                    <option value="2">2</option>--%>
<%--                                    <option value="2">3</option>--%>
<%--                                    <option value="2">4</option>--%>
<%--                                    <option value="2">5</option>--%>
<%--                                </c:if>--%>
<%--                                <c:if test="${proavgstar.avgstar==2}">--%>
<%--                                    <option value="1">1</option>--%>
<%--                                    <option value="1">2</option>--%>
<%--                                    <option value="2">3</option>--%>
<%--                                    <option value="2">4</option>--%>
<%--                                    <option value="2">5</option>--%>
<%--                                </c:if>--%>
<%--                                <c:if test="${proavgstar.avgstar==3}">--%>
<%--                                    <option value="1">1</option>--%>
<%--                                    <option value="1">2</option>--%>
<%--                                    <option value="1">3</option>--%>
<%--                                    <option value="2">4</option>--%>
<%--                                    <option value="2">5</option>--%>
<%--                                </c:if>--%>
<%--                                <c:if test="${proavgstar.avgstar==4}">--%>
<%--                                    <option value="1">1</option>--%>
<%--                                    <option value="1">2</option>--%>
<%--                                    <option value="1">3</option>--%>
<%--                                    <option value="1">4</option>--%>
<%--                                    <option value="2">5</option>--%>
<%--                                </c:if>--%>
<%--<c:if test="${proavgstar.avgstar==5}">--%>
<%--                                <option value="1">1</option>--%>
<%--                                <option value="1">2</option>--%>
<%--                                <option value="1">3</option>--%>
<%--                                <option value="1">4</option>--%>
<%--                                <option value="1">5</option>--%>
<%--    </c:if>--%>
<%--                            </select>--%>
                            <span>(${totalratestar})</span>
                        </div>
                    </div>
                    <c:if test="${product.is_sale==true}">
                    <h4 class="ps-product__price" style="display: inline-block">${Util.formatCurrency(product.price_sale)}</h4>
                        <h5 style="display: inline-block"><del>   ${Util.formatCurrency(product.price)}</del></h5>
                    </c:if>
                    <c:if test="${product.is_sale==false}">
                        <h4 class="ps-product__price" >${Util.formatCurrency(product.price)}</h4>

                    </c:if>
                    <div class="ps-product__desc">
<%--                        <p>Sold By:<a href="shop-default.html"><strong> Go Pro</strong></a></p>--%>
<%--                        <ul class="ps-list--dot">--%>
<%--                            <li> Unrestrained and portable active stereo speaker</li>--%>
<%--                            <li> Free from the confines of wires and chords</li>--%>
<%--                            <li> 20 hours of portable capabilities</li>--%>
<%--                            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>--%>
<%--                            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li>--%>
<%--                        </ul>--%>
                        <p>${product.description}</p>
                    </div>
                    <div class="ps-product__variations">
<%--                        <figure>--%>
<%--                            <figcaption>Color</figcaption>--%>
<%--                            <div class="ps-variant ps-variant--color color--1"><span--%>
<%--                                    class="ps-variant__tooltip">Black</span></div>--%>
<%--                            <div class="ps-variant ps-variant--color color--2"><span--%>
<%--                                    class="ps-variant__tooltip"> Gray</span></div>--%>
<%--                        </figure>--%>
                    </div>
                    <div class="ps-product__shopping">
                        <figure>
                            <figcaption>Số lượng</figcaption>
                            <div class="form-group--number">
                                <button class="add-cart-up up"><i class="fa fa-plus"></i></button>
                                <button class="add-cart-down down"><i class="fa fa-minus"></i></button>
                                <input class="add-cart-input form-control" type="text" value="1">
                            </div>
                        </figure>
                        <a style="font-size: 18px;" class="btn btn-outline-primary add-cart-shop-detail" data-pro_id="${product.id}" data-current_page="shop-detail?product=${product.slug}" href="#">Thêm giỏ hàng</a><a class="btn btn-primary" style="font-size: 18px;" href="/checkout?fast-checkout=true&pro_id=${product.id}">Mua hàng</a>
                        <c:if test="${sessionScope.user_id !=null}">
                        <div class="ps-product__actions">
                            <a href="#" class="addFa" data-current_page="shop-detail" data-pro_id="${product.id}"><i class="icon-heart"></i></a>
                        </div>
                        </c:if>
                    </div>

                    <div class="ps-product__sharing"><a class="facebook" href="#"><i class="fa fa-facebook"></i></a><a
                            class="twitter" href="#"><i class="fa fa-twitter"></i></a><a class="google" href="#"><i
                            class="fa fa-google-plus"></i></a><a class="linkedin" href="#"><i
                            class="fa fa-linkedin"></i></a><a class="instagram" href="#"><i class="fa fa-instagram"></i></a>
                    </div>
                </div>
            </div>

        </div>

    </div>
</div>

<%--/////////////////////--%>

<%--<div class="ps-page--product ps-page--product-box">--%>
<%--    <div class="container">--%>
<%--        <div class="ps-product--detail ps-product--box">--%>
<%--            <div class="ps-product__header ps-product__box">--%>
<%--                <div class="ps-product__thumbnail" data-vertical="true">--%>
<%--                    <figure>--%>
<%--                        <div class="ps-wrapper">--%>
<%--                            <div class="ps-product__gallery" data-arrow="true">--%>
<%--                                <div class="item"><a href="user_page/img/products/detail/fullwidth/1.jpg"><img src="user_page/img/products/detail/fullwidth/1.jpg" alt=""></a></div>--%>
<%--                                <div class="item"><a href="user_page/img/products/detail/fullwidth/2.jpg"><img src="user_page/img/products/detail/fullwidth/2.jpg" alt=""></a></div>--%>
<%--                                <div class="item"><a href="user_page/img/products/detail/fullwidth/3.jpg"><img src="user_page/img/products/detail/fullwidth/3.jpg" alt=""></a></div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </figure>--%>
<%--                    <div class="ps-product__variants" data-item="4" data-md="4" data-sm="4" data-arrow="false">--%>
<%--                        <div class="item"><img src="user_page/img/products/detail/fullwidth/1.jpg" alt=""></div>--%>
<%--                        <div class="item"><img src="user_page/img/products/detail/fullwidth/2.jpg" alt=""></div>--%>
<%--                        <div class="item"><img src="user_page/img/products/detail/fullwidth/3.jpg" alt=""></div>--%>
<%--                        <div class="item"><img src="user_page/img/products/detail/fullwidth/4.jpg" alt=""></div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="ps-product__info">--%>
<%--                    <h1>Marshall Kilburn Portable Wireless Speaker</h1>--%>
<%--                    <div class="ps-product__meta">--%>
<%--                        <p>Brand:<a href="shop-default.html">Sony</a></p>--%>
<%--                        <div class="ps-product__rating">--%>
<%--                            <select class="ps-rating" data-read-only="true">--%>
<%--                                <option value="1">1</option>--%>
<%--                                <option value="1">2</option>--%>
<%--                                <option value="1">3</option>--%>
<%--                                <option value="1">4</option>--%>
<%--                                <option value="2">5</option>--%>
<%--                            </select><span>(1 review)</span>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <h4 class="ps-product__price">$36.78 – $56.99</h4>--%>
<%--                    <div class="ps-product__desc">--%>
<%--                        <p>Sold By:<a href="shop-default.html"><strong> Go Pro</strong></a></p>--%>
<%--                        <ul class="ps-list--dot">--%>
<%--                            <li> Unrestrained and portable active stereo speaker</li>--%>
<%--                            <li> Free from the confines of wires and chords</li>--%>
<%--                            <li> 20 hours of portable capabilities</li>--%>
<%--                            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>--%>
<%--                            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li>--%>
<%--                        </ul>--%>
<%--                    </div>--%>
<%--                    <div class="ps-product__variations">--%>
<%--                        <figure>--%>
<%--                            <figcaption>Color</figcaption>--%>
<%--                            <div class="ps-variant ps-variant--color color--1"><span class="ps-variant__tooltip">Black</span></div>--%>
<%--                            <div class="ps-variant ps-variant--color color--2"><span class="ps-variant__tooltip"> Gray</span></div>--%>
<%--                        </figure>--%>
<%--                    </div>--%>
<%--                    <div class="ps-product__shopping">--%>
<%--                        <figure>--%>
<%--                            <figcaption>Quantity</figcaption>--%>
<%--                            <div class="form-group--number">--%>
<%--                                <button class="up"><i class="fa fa-plus"></i></button>--%>
<%--                                <button class="down"><i class="fa fa-minus"></i></button>--%>
<%--                                <input class="form-control" type="text" placeholder="1">--%>
<%--                            </div>--%>
<%--                        </figure><a class="ps-btn ps-btn--black" href="#">Add to cart</a><a class="ps-btn" href="#">Buy Now</a>--%>
<%--                        <div class="ps-product__actions"><a href="#"><i class="icon-heart"></i></a><a href="#"><i class="icon-chart-bars"></i></a></div>--%>
<%--                    </div>--%>
<%--                    <div class="ps-product__specification"><a class="report" href="#">Report Abuse</a>--%>
<%--                        <p><strong>SKU:</strong> SF1133569600-1</p>--%>
<%--                        <p class="categories"><strong> Categories:</strong><a href="#">Consumer Electronics</a>,<a href="#"> Refrigerator</a>,<a href="#">Babies & Moms</a></p>--%>
<%--                        <p class="tags"><strong> Tags</strong><a href="#">sofa</a>,<a href="#">technologies</a>,<a href="#">wireless</a></p>--%>
<%--                    </div>--%>
<%--                    <div class="ps-product__sharing"><a class="facebook" href="#"><i class="fa fa-facebook"></i></a><a class="twitter" href="#"><i class="fa fa-twitter"></i></a><a class="google" href="#"><i class="fa fa-google-plus"></i></a><a class="linkedin" href="#"><i class="fa fa-linkedin"></i></a><a class="instagram" href="#"><i class="fa fa-instagram"></i></a></div>--%>
<%--                </div>--%>
<%--            </div>--%>

<%--        </div>--%>

<%--    </div>--%>
<%--</div>--%>

<%--//////////////////////////////////--%>
<section class="supplier" style="  background: #f1f1f1; padding:0 !important; margin-top: -30px">
    <div class="container" style="background: white">
        <div class="row">
            <div class="col-lg-12">
                <div class="supplier-summary">
                    <div class="row">
                        <div class="shop-info col-4 row text-center text-md-left" style="text-align: center">
                            <div class="supplier-avatar col-md-5 col-lg-4">
                                <img src="${supplier.logo}">
                            </div>

                            <div class="supplier-detail col-md-7 col-lg-8">
                                <div class="supplier-infor">
                                    <div class="supplier-name">${supplier.name}</div>

                                </div>
                                <button class="btn btn-outline-primary btn-supplier"><i class="fa fa-shopping-basket"></i>Nhà
                                    cung
                                    cấp
                                </button>
                            </div>
                        </div>
                        <div class="more-shop-info col-8 row">
                            <div class="supplier-product center col-md-4"><p style="font-size: 16px;">Sản phẩm: <span>${supplier.total_product}</span></p></div>
<%--                            <div class="supplier-product center  col-md-4"><p style="font-size: 16px;">Sản phẩm: <span>${supplier.total_product}</span></p></div>--%>
<%--                            <div class="supplier-product center col-md-4"><p style="font-size: 16px;">Sản phẩm: <span>${supplier.total_product}</span></p></div>--%>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<%--//////////////////////////////////--%>

<section class="product-details" style="  background: #f1f1f1; padding:0 !important; margin-top: 20px">
    <div class="container" style="background: white">
        <div class="row">
            <div class="col-lg-12">
                <div class="product__details__tab">
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
                               aria-selected="true">Mô tả</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab"
                               aria-selected="false">Đánh giá</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab"
                               aria-selected="false">Nhà cung cấp</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tabs-1" role="tabpanel">
                            <div class="product__details__tab__desc">
                                <%--                                <h6 style="font-size:16px">Mô tả sản phẩm</h6>--%>
                                <p>${product.content}</p>
                            </div>
                        </div>
                        <div class="tab-pane" id="tabs-2" role="tabpanel">
                            <div class="product__details__tab__desc">
                                <%--                                <h6 style="font-size:16px">Đánh giá sản phẩm</h6>--%>
                                <div class="row" style="margin: 3rem;
    border: solid 2px #568fb44d;
    background: #3078a60d;
    padding-top: 15px;">
                                    <div class="col-xl-5 col-lg-5 col-md-12 col-sm-12 col-12 ">
                                        <div class="ps-block--average-rating">
                                            <div class="ps-block__header">
                                                <h3>${totalratestar}</h3>
                                                <div class="ps-product__rating">
                                                    <%--                                                <div class="product-rating">--%>
                                                    <c:if test="${proavgstar.avgstar==5}">
                                                        <div class="product__details__rating">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>

                                                        </div>
                                                    </c:if>
                                                    <c:if test="${proavgstar.avgstar==4}">
                                                        <div class="product__details__rating">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i style="color: #edbb0e;" class="fa fa-star-o"></i>

                                                        </div>
                                                    </c:if>
                                                    <c:if test="${proavgstar.avgstar==3}">
                                                        <div class="product__details__rating">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i style="color: #edbb0e;" class="fa fa-star-o"></i>
                                                            <i style="color: #edbb0e;" class="fa fa-star-o"></i>

                                                        </div>
                                                    </c:if>
                                                    <c:if test="${proavgstar.avgstar==2}">
                                                        <div class="product__details__rating">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i style="color: #edbb0e;" class="fa fa-star-o"></i>
                                                            <i style="color: #edbb0e;" class="fa fa-star-o"></i>
                                                            <i style="color: #edbb0e;" class="fa fa-star-o"></i>

                                                        </div>
                                                    </c:if>
                                                    <c:if test="${proavgstar.avgstar==1}">
                                                        <div class="product__details__rating">
                                                            <i class="fa fa-star"></i>
                                                            <i style="color: #edbb0e;" class="fa fa-star-o"></i>
                                                            <i style="color: #edbb0e;" class="fa fa-star-o"></i>
                                                            <i style="color: #edbb0e;" class="fa fa-star-o"></i>
                                                            <i style="color: #edbb0e;" class="fa fa-star-o"></i>

                                                        </div>
                                                    </c:if>
                                                    <c:if test="${proavgstar.avgstar>1&&proavgstar.avgstar<2}">
                                                        <div class="product__details__rating">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-half-o"></i>
                                                            <i style="color: #edbb0e;" class="fa fa-star-o"></i>
                                                            <i style="color: #edbb0e;" class="fa fa-star-o"></i>
                                                            <i style="color: #edbb0e;" class="fa fa-star-o"></i>

                                                        </div>
                                                    </c:if>
                                                    <c:if test="${proavgstar.avgstar>2&&proavgstar.avgstar<3}">
                                                        <div class="product__details__rating">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-half-o"></i>
                                                            <i style="color: #edbb0e;" class="fa fa-star-o"></i>
                                                            <i style="color: #edbb0e;" class="fa fa-star-o"></i>

                                                        </div>
                                                    </c:if>
                                                    <c:if test="${proavgstar.avgstar>3&&proavgstar.avgstar<4}">
                                                        <div class="product__details__rating">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-half-o"></i>
                                                            <i style="color: #edbb0e;" class="fa fa-star-o"></i>

                                                        </div>
                                                    </c:if>
                                                    <c:if test="${proavgstar.avgstar>4&&proavgstar.avgstar<5}">
                                                        <div class="product__details__rating">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-half-o"></i>

                                                        </div>
                                                    </c:if>
                                                    <%--                                                </div>--%>
                                                    <%--                            <select class="ps-rating" data-read-only="true">--%>
                                                    <%--                                <c:if test="${proavgstar.avgstar==1}">--%>
                                                    <%--                                    <option value="1">1</option>--%>
                                                    <%--                                    <option value="2">2</option>--%>
                                                    <%--                                    <option value="2">3</option>--%>
                                                    <%--                                    <option value="2">4</option>--%>
                                                    <%--                                    <option value="2">5</option>--%>
                                                    <%--                                </c:if>--%>
                                                    <%--                                <c:if test="${proavgstar.avgstar==2}">--%>
                                                    <%--                                    <option value="1">1</option>--%>
                                                    <%--                                    <option value="1">2</option>--%>
                                                    <%--                                    <option value="2">3</option>--%>
                                                    <%--                                    <option value="2">4</option>--%>
                                                    <%--                                    <option value="2">5</option>--%>
                                                    <%--                                </c:if>--%>
                                                    <%--                                <c:if test="${proavgstar.avgstar==3}">--%>
                                                    <%--                                    <option value="1">1</option>--%>
                                                    <%--                                    <option value="1">2</option>--%>
                                                    <%--                                    <option value="1">3</option>--%>
                                                    <%--                                    <option value="2">4</option>--%>
                                                    <%--                                    <option value="2">5</option>--%>
                                                    <%--                                </c:if>--%>
                                                    <%--                                <c:if test="${proavgstar.avgstar==4}">--%>
                                                    <%--                                    <option value="1">1</option>--%>
                                                    <%--                                    <option value="1">2</option>--%>
                                                    <%--                                    <option value="1">3</option>--%>
                                                    <%--                                    <option value="1">4</option>--%>
                                                    <%--                                    <option value="2">5</option>--%>
                                                    <%--                                </c:if>--%>
                                                    <%--<c:if test="${proavgstar.avgstar==5}">--%>
                                                    <%--                                <option value="1">1</option>--%>
                                                    <%--                                <option value="1">2</option>--%>
                                                    <%--                                <option value="1">3</option>--%>
                                                    <%--                                <option value="1">4</option>--%>
                                                    <%--                                <option value="1">5</option>--%>
                                                    <%--    </c:if>--%>
                                                    <%--                            </select>--%>
                                                    <span>(${totalratestar})</span>
                                                </div>
<%--                                                <select class="ps-rating" data-read-only="true">--%>
<%--                                                    <option value="1">1</option>--%>
<%--                                                    <option value="1">2</option>--%>
<%--                                                    <option value="1">3</option>--%>
<%--                                                    <option value="1">4</option>--%>
<%--                                                    <option value="2">5</option>--%>
<%--                                                </select><span>1 Đánh giá</span>--%>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="col-xl-7 col-lg-7 col-md-12 col-sm-12 col-12 ">
                                        <div class="ps-block--average-rating">
                                            <div class="ps-block__star"><span>5 Sao</span>
                                                <div class="ps-progress" data-value="${Math.round(prostar5.getCountstar()*100/totalratestar)}"><span></span></div>
                                                <span>${Math.round(prostar5.getCountstar()*100/totalratestar)}%</span>
                                            </div>
                                            <div class="ps-block__star"><span>4 Sao</span>
                                                <div class="ps-progress" data-value="${Math.round(prostar4.getCountstar()*100/totalratestar)}"><span></span></div>
                                                <span>${Math.round(prostar4.getCountstar()*100/totalratestar)}%</span>
                                            </div>
                                            <div class="ps-block__star"><span>3 Sao</span>
                                                <div class="ps-progress" data-value="${Math.round(prostar3.getCountstar()*100/totalratestar)}"><span></span></div>
                                                <span>${Math.round(prostar3.getCountstar()*100/totalratestar)}%</span>
                                            </div>
                                            <div class="ps-block__star"><span>2 Sao</span>
                                                <div class="ps-progress" data-value="${Math.round(prostar2.getCountstar()*100/totalratestar)}"><span></span></div>
                                                <span>${Math.round(prostar2.getCountstar()*100/totalratestar)}%</span>
                                            </div>
                                            <div class="ps-block__star"><span>1 Sao</span>
                                                <div class="ps-progress" data-value="${Math.round(prostar1.getCountstar()*100/totalratestar)}"><span></span></div>
                                                <span>${Math.round(prostar1.getCountstar()*100/totalratestar)}%</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%--                                <div class="product-reviews">--%>
                                <%--                                    <div class="product-rating-overview">--%>
                                <%--                                        <div class="product-rating-overview__briefing">--%>
                                <%--                                            <div class="product-rating-overview__score-wrapper">--%>
                                <%--                                                <span class="product-rating-overview__rating-score">${proavgstar.avgstar}/5</span>--%>
                                <%--                                                <c:if test="${proavgstar.avgstar==5}">--%>
                                <%--                                                    <div class="starratingcontain">--%>
                                <%--                                                        <i class="fa fa-star"></i>--%>
                                <%--                                                        <i class="fa fa-star"></i>--%>
                                <%--                                                        <i class="fa fa-star"></i>--%>
                                <%--                                                        <i class="fa fa-star"></i>--%>
                                <%--                                                        <i class="fa fa-star"></i>--%>
                                <%--                                                    </div>--%>
                                <%--                                                </c:if>--%>
                                <%--                                                <c:if test="${proavgstar.avgstar==4}">--%>
                                <%--                                                    <div class="starratingcontain">--%>
                                <%--                                                        <i class="fa fa-star"></i>--%>
                                <%--                                                        <i class="fa fa-star"></i>--%>
                                <%--                                                        <i class="fa fa-star"></i>--%>
                                <%--                                                        <i class="fa fa-star"></i>--%>
                                <%--                                                        <i style="color: #edbb0e;" class="fa fa-star-o"></i>--%>
                                <%--                                                    </div>--%>
                                <%--                                                </c:if>--%>
                                <%--                                                <c:if test="${proavgstar.avgstar==3}">--%>
                                <%--                                                    <div class="starratingcontain">--%>
                                <%--                                                        <i class="fa fa-star"></i>--%>
                                <%--                                                        <i class="fa fa-star"></i>--%>
                                <%--                                                        <i class="fa fa-star"></i>--%>
                                <%--                                                        <i style="color: #edbb0e;" class="fa fa-star-o"></i>--%>
                                <%--                                                        <i style="color: #edbb0e;" class="fa fa-star-o"></i>--%>
                                <%--                                                    </div>--%>
                                <%--                                                </c:if>--%>
                                <%--                                                <c:if test="${proavgstar.avgstar==2}">--%>
                                <%--                                                    <div class="starratingcontain">--%>
                                <%--                                                        <i class="fa fa-star"></i>--%>
                                <%--                                                        <i class="fa fa-star"></i>--%>
                                <%--                                                        <i style="color: #edbb0e;" class="fa fa-star-o"></i>--%>
                                <%--                                                        <i style="color: #edbb0e;" class="fa fa-star-o"></i>--%>
                                <%--                                                        <i style="color: #edbb0e;" class="fa fa-star-o"></i>--%>
                                <%--                                                    </div>--%>
                                <%--                                                </c:if>--%>
                                <%--                                                <c:if test="${proavgstar.avgstar==1}">--%>
                                <%--                                                    <div class="starratingcontain">--%>
                                <%--                                                        <i class="fa fa-star"></i>--%>
                                <%--                                                        <i style="color: #edbb0e;" class="fa fa-star-o"></i>--%>
                                <%--                                                        <i style="color: #edbb0e;" class="fa fa-star-o"></i>--%>
                                <%--                                                        <i style="color: #edbb0e;" class="fa fa-star-o"></i>--%>
                                <%--                                                        <i style="color: #edbb0e;" class="fa fa-star-o"></i>--%>
                                <%--                                                    </div>--%>
                                <%--                                                </c:if>--%>
                                <%--                                                <c:if test="${proavgstar.avgstar>1&&proavgstar.avgstar<2}">--%>
                                <%--                                                    <div class="starratingcontain">--%>
                                <%--                                                        <i class="fa fa-star"></i>--%>
                                <%--                                                        <i class="fa fa-star-half-o"></i>--%>
                                <%--                                                        <i style="color: #edbb0e;" class="fa fa-star-o"></i>--%>
                                <%--                                                        <i style="color: #edbb0e;" class="fa fa-star-o"></i>--%>
                                <%--                                                        <i style="color: #edbb0e;" class="fa fa-star-o"></i>--%>
                                <%--                                                    </div>--%>
                                <%--                                                </c:if>--%>
                                <%--                                                <c:if test="${proavgstar.avgstar>2&&proavgstar.avgstar<3}">--%>
                                <%--                                                    <div class="starratingcontain">--%>
                                <%--                                                        <i class="fa fa-star"></i>--%>
                                <%--                                                        <i class="fa fa-star"></i>--%>
                                <%--                                                        <i class="fa fa-star-half-o"></i>--%>
                                <%--                                                        <i style="color: #edbb0e;" class="fa fa-star-o"></i>--%>
                                <%--                                                        <i style="color: #edbb0e;" class="fa fa-star-o"></i>--%>
                                <%--                                                    </div>--%>
                                <%--                                                </c:if>--%>
                                <%--                                                <c:if test="${proavgstar.avgstar>3&&proavgstar.avgstar<4}">--%>
                                <%--                                                    <div class="starratingcontain">--%>
                                <%--                                                        <i class="fa fa-star"></i>--%>
                                <%--                                                        <i class="fa fa-star"></i>--%>
                                <%--                                                        <i class="fa fa-star"></i>--%>
                                <%--                                                        <i class="fa fa-star-half-o"></i>--%>
                                <%--                                                        <i style="color: #edbb0e;" class="fa fa-star-o"></i>--%>
                                <%--                                                    </div>--%>
                                <%--                                                </c:if>--%>
                                <%--                                                <c:if test="${proavgstar.avgstar>4&&proavgstar.avgstar<5}">--%>
                                <%--                                                    <div class="starratingcontain">--%>
                                <%--                                                        <i class="fa fa-star"></i>--%>
                                <%--                                                        <i class="fa fa-star"></i>--%>
                                <%--                                                        <i class="fa fa-star"></i>--%>
                                <%--                                                        <i class="fa fa-star"></i>--%>
                                <%--                                                        <i class="fa fa-star-half-o"></i>--%>
                                <%--                                                    </div>--%>
                                <%--                                                </c:if>--%>

                                <%--                                                <span class="product-rating-overview__rating-score-out-of"></span><br>--%>

                                <%--                                            </div>--%>
                                <%--                                        </div>--%>
                                <%--                                        <div class="product-rating-overview__filters">--%>
                                <%--                                            <div class="product-rating-overview__filter product-rating-overview__filter--active product-rating-overview__filter--all">--%>
                                <%--                                                tất cả (${totalratestar})--%>
                                <%--                                            </div>--%>
                                <%--                                            <div class="product-rating-overview__filter">5 Sao (${prostar5.countstar})--%>
                                <%--                                            </div>--%>
                                <%--                                            <div class="product-rating-overview__filter">4 Sao (${prostar4.countstar})--%>
                                <%--                                            </div>--%>
                                <%--                                            <div class="product-rating-overview__filter">3 Sao (${prostar3.countstar})--%>
                                <%--                                            </div>--%>
                                <%--                                            <div class="product-rating-overview__filter">2 Sao (${prostar2.countstar})--%>
                                <%--                                            </div>--%>
                                <%--                                            <div class="product-rating-overview__filter">1 Sao (${prostar1.countstar})--%>
                                <%--                                            </div>--%>
                                <%--                                            <div class="product-rating-overview__filter product-rating-overview__filter--with-comment">--%>
                                <%--                                                Có Bình luận (${procountcomment.contcomment})--%>
                                <%--                                            </div>--%>
                                <%--                                        </div>--%>
                                <%--                                    </div>--%>
                                <%--                                </div>--%>
                                <!-- comment section begin -->
                                <c:forEach items="${usercomment}" var="cv">
                                    <div class="comment-reviews">
                                        <a class="shopee-product-rating__avatar"></a>
                                        <div class="shopee-avatar">
                                            <img style="border-radius: 50% ;display: block;height: 30px;width: 30px"
                                                 class="shopee-avatar__img" src="${cv.avatar}">
                                        </div>
                                        <b>${cv.name}</b><i class="fa fa-check-circle"
                                                            style="color: #3078a6;font-size: 20px;margin-left: 5px; margin-right: 5px;"></i><i
                                            style="color: #3078a6 ;">Đã mua hàng ở thế giới đồ chơi</i><br>
                                        <i class="size-time">${cv.date_created_comment}</i><br>
                                        <i>Đánh giá: </i><b class="sao"><c:if
                                            test="${cv.rating_type_id==1}">5/5</c:if><c:if
                                            test="${cv.rating_type_id==2}">4/5</c:if><c:if
                                            test="${cv.rating_type_id==3}">3/5</c:if><c:if
                                            test="${cv.rating_type_id==4}">2/5</c:if><c:if
                                            test="${cv.rating_type_id==5}">1/5</c:if></b>
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
                                        <i>Nhận xét : </i>${cv.comment}<br>
                                        <div class="containhuuich">
                                        </div>
                                        </a>
                                    </div>
                                </c:forEach>
                                <!-- end binh luan 1 -->
                                <!-- comment section end -->
                            </div>
                        </div>
                        <div class="tab-pane" id="tabs-3" role="tabpanel">
                            <div class="product__details__tab__desc" id="supplier-description">
                                <h6 style="font-size:16px">Nhà cung cấp</h6>
                                ${supplier.description}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<%--///////////////////////////////////////--%>
<!-- Product Details Section End -->

<%-- Modal Image begin --%>
<%--<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"--%>
<%--     aria-hidden="true">--%>
<%--    <div class="modal-dialog modal-lg">--%>
<%--        <div class="modal-content">--%>
<%--            <div class="row">--%>
<%--                <div class="col-lg-9">--%>
<%--                    <div id="main-image">--%>
<%--                        <img id="img-main" src="${product.img}">--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="col-lg-3">--%>
<%--                    <ul class="list-image">--%>
<%--                        <li><img src="${product.img}" onclick="changeImage('img-one')" id="img-one"></li>--%>
<%--                        <li><img src="${images[0].url}" onclick="changeImage('img-two')" id="img-two"></li>--%>
<%--                        <li><img src="${images[1].url}" onclick="changeImage('img-three')" id="img-three"></li>--%>
<%--                        <li><img src="${images[2].url}" onclick="changeImage('img-four')" id="img-four"></li>--%>
<%--                    </ul>--%>
<%--                </div>--%>
<%--            </div>--%>

<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<%-- Modal Image end--%>
<!-- Product Reviews Section Begin -->


<!-- Product Reviews Section End -->
<!-- Related Product Section Begin -->
<%--/////////////////////////////////////////////////--%>
<section class="related-product" style="
    background: #f1f1f1;
    margin-top: 20px;
">
    <div class="container" style="background: white">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title related__product__title">
                    <h2>Sản phẩm tương tự</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <c:forEach items="${relaproducts}" var="rl">
                <c:set var="price" value="${rl.price}"></c:set>
                <c:set var="pricesale" value="${rl.price_sale}"></c:set>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="${rl.img}">
                            <ul class="product__item__pic__hover">
                                <li class="fast-checkout cursor-pointer" data-pro_id="${rl.id}"><a><i
                                        class="fa fa-money"></i></a></li>
                                <c:if test="${sessionScope.user_id!=null}">
                                    <li class="addFa cursor-pointer" data-current_page="shop-detail"
                                        data-pro_id="${rl.id}"><a><i class="fa fa-heart"></i></a></li>
                                </c:if>
                                <li class="addCart cursor-pointer" data-current_page="shop-detail"
                                    data-pro_id="${rl.id}"><a><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h4><a href="shop-detail?id=${rl.id}">${rl.name}</a></h4>
                            <h5><%= Util.formatCurrency((double) pageContext.getAttribute("pricesale")) %>
                                <span> <%= Util.formatCurrency((double) pageContext.getAttribute("pricesale")) %> </span>
                            </h5>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>
<%--/////////////////////////////////////////////////--%>
<!-- Related Product Section End -->
<jsp:include page="footer.jsp"></jsp:include>
<!-- Js Plugins -->
<script src="user_page/js/jquery-3.3.1.min.js"></script>
<script src="user_page/js/bootstrap.min.js"></script>

<script src="user_page/js/jquery-ui.min.js"></script>
<script src="user_page/js/jquery.slicknav.js"></script>

<%--<script src="user_page/js/jquery.nice-select.min.js"></script>--%>
<script src="user_page/js/slick.min.js"></script>
<script src="user_page/js/lightgallery-all.min.js"></script>
<script src="user_page/js/mixitup.min.js"></script>
<script src="user_page/js/owl.carousel.min.js"></script>


<script src="user_page/js/jquery.barrating.min.js"></script>
<script src="user_page/js/jquery.nice-select.min.js"></script>
<script src="user_page/js/main.js"></script>
<script src="user_page/js/main_home.js"></script>
<script>
    $(document).ready(function () {
        $("#supplier-description").children().css("color", "black");
    });
</script>
</body>
</html>
