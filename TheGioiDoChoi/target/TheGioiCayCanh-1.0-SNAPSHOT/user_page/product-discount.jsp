<%@ page import="vn.thegioicaycanh.model.util.Util" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="vi-VN">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
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

<body
        <c:if test="${position != null}">
            <c:out value="Co vo"></c:out>
            onload="load(${position})"
        </c:if>
>

<jsp:include page="Menu.jsp"></jsp:include>

<jsp:include page="search_bar.jsp"></jsp:include>

<!-- Edit code here -->
<div>
    <!-- Stick element -->
    <div class="sticky-top">
        <div class="container">
            <div class="row">
                <select id="selectest" class="mdb-select md-form col-md-2 mx-3" onchange="window.location=this.value">
                    <option value="" disabled>Chọn loại</option>
                    <option value="" disabled selected>Sản phẩm khuyến mãi</option>
                    <option value="coupon_code">Mã khuyến mãi</option>
                </select>
                <select id="select_category" class="mdb-select md-form col-md-2 mx-3">
                    <c:if test="${cate_id==0}">
                        <option value="" disabled selected>Danh mục</option>
                        <option value="${type_page}?cate_id=1&${url}">Cây để bàn </option>
                        <option value="${type_page}?cate_id=2&${url}">Cây dây leo</option>
                        <option value="${type_page}?cate_id=3&${url}">Cây tết</option>
                        <option value="${type_page}?cate_id=4&${url}">Cây thủy sinh</option>
                        <option value="${type_page}?cate_id=5&${url}">Cây trong nhà</option>
                        <option value="${type_page}?cate_id=6&${url}">Cây ngoài trời</option>
                    </c:if>
                    <c:if test="${cate_id==1}">
                        <option value="" disabled selected>Danh mục</option>
                        <option value="${type_page}?cate_id=1&${url}" selected>Cây để bàn </option>
                        <option value="${type_page}?cate_id=2&${url}">Cây dây leo</option>
                        <option value="${type_page}?cate_id=3&${url}">Cây tết</option>
                        <option value="${type_page}?cate_id=4&${url}">Cây thủy sinh</option>
                        <option value="${type_page}?cate_id=5&${url}">Cây trong nhà</option>
                        <option value="${type_page}?cate_id=6&${url}">Cây ngoài trời</option>
                    </c:if>
                    <c:if test="${cate_id==2}">
                        <option value="" disabled selected>Danh mục</option>
                        <option value="${type_page}?cate_id=1&${url}">Cây để bàn </option>
                        <option value="${type_page}?cate_id=2&${url}" selected>Cây dây leo</option>
                        <option value="${type_page}?cate_id=3&${url}">Cây tết</option>
                        <option value="${type_page}?cate_id=4&${url}">Cây thủy sinh</option>
                        <option value="${type_page}?cate_id=5&${url}">Cây trong nhà</option>
                        <option value="${type_page}?cate_id=6&${url}">Cây ngoài trời</option>
                    </c:if>
                    <c:if test="${cate_id==3}">
                        <option value="" disabled selected>Danh mục</option>
                        <option value="${type_page}?cate_id=1&${url}">Cây để bàn </option>
                        <option value="${type_page}?cate_id=2&${url}">Cây dây leo</option>
                        <option value="${type_page}?cate_id=3&${url}" selected>Cây tết</option>
                        <option value="${type_page}?cate_id=4&${url}">Cây thủy sinh</option>
                        <option value="${type_page}?cate_id=5&${url}">Cây trong nhà</option>
                        <option value="${type_page}?cate_id=6&${url}">Cây ngoài trời</option>
                    </c:if>
                    <c:if test="${cate_id==4}">
                        <option value="" disabled selected>Danh mục</option>
                        <option value="${type_page}?cate_id=1&${url}">Cây để bàn </option>
                        <option value="${type_page}?cate_id=2&${url}">Cây dây leo</option>
                        <option value="${type_page}?cate_id=3&${url}">Cây tết</option>
                        <option value="${type_page}?cate_id=4&${url}" selected>Cây thủy sinh</option>
                        <option value="${type_page}?cate_id=5&${url}">Cây trong nhà</option>
                        <option value="${type_page}?cate_id=6&${url}">Cây ngoài trời</option>
                    </c:if>
                    <c:if test="${cate_id==5}">
                        <option value="" disabled selected>Danh mục</option>
                        <option value="${type_page}?cate_id=1&${url}">Cây để bàn </option>
                        <option value="${type_page}?cate_id=2&${url}">Cây dây leo</option>
                        <option value="${type_page}?cate_id=3&${url}">Cây tết</option>
                        <option value="${type_page}?cate_id=4&${url}">Cây thủy sinh</option>
                        <option value="${type_page}?cate_id=5&${url}" selected>Cây trong nhà</option>
                        <option value="${type_page}?cate_id=6&${url}">Cây ngoài trời</option>
                    </c:if>
                    <c:if test="${cate_id==6}">
                        <option value="" disabled selected>Danh mục</option>
                        <option value="${type_page}?cate_id=1&${url}">Cây để bàn </option>
                        <option value="${type_page}?cate_id=2&${url}">Cây dây leo</option>
                        <option value="${type_page}?cate_id=3&${url}">Cây tết</option>
                        <option value="${type_page}?cate_id=4&${url}">Cây thủy sinh</option>
                        <option value="${type_page}?cate_id=5&${url}">Cây trong nhà</option>
                        <option value="${type_page}?cate_id=6&${url}" selected>Cây ngoài trời</option>
                    </c:if>
                </select>
                <select id="select_sort" class="mdb-select md-form col-md-2 mx-3">
                    <c:if test="${sort_id==0}">
                        <option value="" disabled selected>Sắp xếp</option>
                        <option value="${type_page}?sort_id=1&${url}">Giá thấp đến cao</option>
                        <option value="${type_page}?sort_id=2&${url}">Giá cao đến thấp</option>
                    </c:if>
                    <c:if test="${sort_id==1}">
                        <option value="" disabled selected>Sắp xếp</option>
                        <option value="${type_page}?sort_id=1&${url}" selected>Giá thấp đến cao</option>
                        <option value="${type_page}?sort_id=2&${url}">Giá cao đến thấp</option>
                    </c:if>
                    <c:if test="${sort_id==2}">
                        <option value="" disabled selected>Sắp xếp</option>
                        <option value="${type_page}?sort_id=1&${url}">Giá thấp đến cao</option>
                        <option value="${type_page}?sort_id=2&${url}" selected>Giá cao đến thấp</option>
                    </c:if>
                </select>
                <select id="select_date" class="mdb-select md-form col-md-2 mx-3">
                    <c:if test="${date_id==0}">
                        <option value="" disabled selected>Ngày hết hạn</option>
                        <option value="${type_page}?date_id=1&${url}">Hôm nay</option>
                        <option value="${type_page}?date_id=2&${url}"> 1 ngày</option>
                        <option value="${type_page}?date_id=3&${url}">> 1 Tuần</option>
                        <option value="${type_page}?date_id=4&${url}">> nửa tháng</option>
                        <option value="${type_page}?date_id=5&${url}"> 1 tháng</option>
                    </c:if>
                    <c:if test="${date_id==1}">
                        <option value="" disabled selected>Ngày hết hạn</option>
                        <option value="${type_page}?date_id=1&${url}" selected>Hôm nay</option>
                        <option value="${type_page}?date_id=2&${url}">> 1 ngày</option>
                        <option value="${type_page}?date_id=3&${url}">> 1 Tuần</option>
                        <option value="${type_page}?date_id=4&${url}">> nửa tháng</option>
                        <option value="${type_page}?date_id=5&${url}"> 1 tháng</option>
                    </c:if>
                    <c:if test="${date_id==2}">
                        <option value="" disabled selected>Ngày hết hạn</option>
                        <option value="${type_page}?date_id=1&${url}">Hôm nay</option>
                        <option value="${type_page}?date_id=2&${url}" selected>> 1 ngày</option>
                        <option value="${type_page}?date_id=3&${url}">> 1 Tuần</option>
                        <option value="${type_page}?date_id=4&${url}">> nửa tháng</option>
                        <option value="${type_page}?date_id=5&${url}"> 1 tháng</option>
                    </c:if>
                    <c:if test="${date_id==3}">
                        <option value="" disabled selected>Ngày hết hạn</option>
                        <option value="${type_page}?date_id=1&${url}">Hôm nay</option>
                        <option value="${type_page}?date_id=2&${url}">> 1 ngày</option>
                        <option value="${type_page}?date_id=3&${url}" selected>> 1 Tuần</option>
                        <option value="${type_page}?date_id=4&${url}">> nửa tháng</option>
                        <option value="${type_page}?date_id=5&${url}"> 1 tháng</option>
                    </c:if>
                    <c:if test="${date_id==4}">
                        <option value="" disabled selected>Ngày hết hạn</option>
                        <option value="${type_page}?date_id=1&${url}">Hôm nay</option>
                        <option value="${type_page}?date_id=2&${url}">> 1 ngày</option>
                        <option value="${type_page}?date_id=3&${url}">> 1 Tuần</option>
                        <option value="${type_page}?date_id=4&${url}" selected>> nửa tháng</option>
                        <option value="${type_page}?date_id=5&${url}"> 1 tháng</option>
                    </c:if>
                    <c:if test="${date_id==5}">
                        <option value="" disabled selected>Ngày hết hạn</option>
                        <option value="${type_page}?date_id=1&${url}">Hôm nay</option>
                        <option value="${type_page}?date_id=2&${url}">> 1 ngày</option>
                        <option value="${type_page}?date_id=3&${url}">> 1 Tuần</option>
                        <option value="${type_page}?date_id=4&${url}">> nửa tháng</option>
                        <option value="${type_page}?date_id=5&${url}" selected> 1 tháng</option>
                    </c:if>
                </select>
            </div>
        </div>
    </div>
    <!-- Stick element -->
    <section class="featured spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <img src="user_page/img/sale/flash.gif" alt="flash sale" />
                        <img src="user_page/img/sale/giamSoc.png" alt="gia soc" />
                    </div>
                </div>
            </div>
            <!-- Sửa featured__filter thành code_sale_filter -->
            <div class="code_sale_filter">
                <div class="row">
                    <c:forEach items="${data}" var="sp">
                        <c:set var="p" value="${sp.price}"></c:set>
                        <c:set var="ps" value="${sp.price_sale}"></c:set>
                    <div class="col-lg-3 col-md-4 col-sm-6 sale-p">
                        <div class="product__discount__item">
                            <div class="product__discount__item__pic set-bg"
                                 data-setbg="${sp.img}">
                                <div class="product__discount__percent">-${sp.percent_sale}%</div>
                                <ul class="product__item__pic__hover">
                                    <li class="fast-checkout cursor-pointer" data-pro_id="${sp.id}"><a ><i class="fa fa-money"></i></a></li>
                                    <c:if test="${sessionScope.user_id!=null}">
                                        <li class="addFa cursor-pointer" data-current_page="shopping-sale" data-pro_id="${sp.id}"><a><i class="fa fa-heart"></i></a></li>
                                    </c:if>
                                    <li class="addCart cursor-pointer" data-current_page="shopping-sale" data-pro_id="${sp.id}"><a ><i class="fa fa-shopping-cart"></i></a></li>
                                </ul>
                            </div>
                            <div class="product__discount__item__text">
                                <h5><a href="shop-detail?id=${sp.id}">${sp.name}</a></h5>
                                <div class="product__item__price"><%= Util.formatCurrency((double)pageContext.getAttribute("ps")) %> <span><%= Util.formatCurrency((double)pageContext.getAttribute("p")) %></span></div>
                            </div>
                            <div class="progress-style progress none-margin">
                                <div class="progress-bar bg-success progress-past" role="progressbar" style="width:61%" aria-valuenow="${sp.dayRest}" aria-valuemin="0" aria-valuemax="100"></div>
                                <p class="progress-text">Còn ${sp.dayRest} ngày</p>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                </div>
                <div class="product__pagination" style="margin: auto; margin-top:50px">
                    <c:if test="${pages>1}">
                        <a href="${back}"><i class="fa fa-angle-left"></i></a>
                    </c:if>
                    <c:forEach var="i" begin="${start}" end="${end}">
                        <c:if test="${pages==i}"><a href="${type_page}?pages=${i}${url}" class="set_choose">${i}</a></c:if>
                        <c:if test="${pages!=i}"><a href="${type_page}?pages=${i}${url}">${i}</a></c:if>
                    </c:forEach>
                    <c:if test="${isStill==true}"><a class="noneHover" href="">...</a></c:if>
                    <c:if test="${pages!=end}">
                        <a href="${next}">
                            <i class="fa fa-angle-right"></i>
                        </a>
                    </c:if>
                </div>
            </div>
        </div>
    </section>
</div>
<!-- End edit -->

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