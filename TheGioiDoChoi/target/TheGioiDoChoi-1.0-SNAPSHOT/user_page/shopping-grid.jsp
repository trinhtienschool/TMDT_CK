<%@ page import="vn.thegioidochoi.model.util.Util" %>
<%@ page import="vn.thegioidochoi.model.util.Util" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="vn.thegioidochoi.model.supplier.Supplier" %>
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
<%--    <link rel="stylesheet" href="user_page/css/elegant-icons.css" type="text/css">--%>
    <link rel="stylesheet" href="user_page/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/owl.carousel.min.css" type="text/css">
<%--    <link rel="stylesheet" href="user_page/css/slicknav.min.css" type="text/css">--%>
    <link rel="stylesheet" href="user_page/css/style.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/owl.theme.default.min.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/style_home.css" type="text/css">
</head>
<body
>
<c:if test="${position != null}">
    <c:out value="Co vo"></c:out>
    onload="load(${position})"
</c:if>
<c:set value="${url}" scope="page" var="url_test"></c:set>
<%--<%--%>
<%--    System.out.println("UUUUUUUUUULLLLLLLLLL");--%>
<%--    System.out.println(pageContext.getAttribute("url_test"));--%>
<%--    String url = (String) pageContext.getAttribute("url_test");--%>
<%--    System.out.println(Util.cutTheSameUrlPart(url,"cate"));--%>
<%--    %>--%>
<%
    if(pageContext.getAttribute("ages") !=null) {
        System.out.println("Co Vo Day neeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
        String[] ages = (String[]) pageContext.getAttribute("ages");
        for (String age : ages) {
            System.out.println("Ageeeeeeeee: " + age);
        }
    }
%>
<%--<c:out value="${Arrays.asList(paramValues.get('age')).contains('6-11')}"></c:out>--%>
<%--<div class="invisible_type_page">${type_page}</div>--%>
<%--<div class="invisible_url">${url}</div>--%>
<jsp:include page="Menu.jsp"></jsp:include>

<%--<jsp:include page="search_bar.jsp"></jsp:include>--%>

<!-- Product Section Begin -->
<section class="product spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-5">
                <div class="sidebar">
                    <div class="single-block">
                        <h3 class="sidebar-title">Danh mục</h3>

                        <c:forEach var="cate" items="${applicationScope.category}">
                        <div class="left-sidebar-parent">
                            <a class="left-sidebar-title row m-1 mt-3 " data-toggle="collapse" href="#${cate.slug}"
                               role="button" aria-expanded="false" aria-controls="do-choi-van-dong">
                                <span class="col-xl-10 col-lg-9  col-sm-11 col-12">${cate.name}</span>

                                <i class="fa fa-angle-down col-xl-2 col-lg-3   col-sm-1 col-12"></i>
                            </a>
                            <c:if test="${Util.isContainSubCate(cate,cate_slug)}">
                            <div class="collapse show" id="${cate.slug}">
                                </c:if>
                                    <c:if test="${!Util.isContainSubCate(cate,cate_slug)}">
                                    <div class="collapse" id="${cate.slug}">
                                        </c:if>
                                <c:forEach var="sub_cate" items="${cate.subcategories}">
                                    <c:if test="${sub_cate.slug==cate_slug}">
<%--                                        <%--%>
<%--                                        Util.cutTheSameUrlPart(url,"cate")--%>
<%--                                            System.out.println("UUUUUUUUUUUUULLLLLLLLLLLLl");--%>
<%--                                            System.out.println(pageContext.getAttribute("url"));%>--%>
                                <a href="${type_page}?cate=${sub_cate.slug}&${Util.cutTheSameUrlPart(url,"cate")}" class="set_choose left-sidebar-item m-3" style="color: white !important;">${sub_cate.name}</a>
                                    </c:if>
                                    <c:if test="${sub_cate.slug!=cate_slug}">
                                        <a href="${type_page}?cate=${sub_cate.slug}&${Util.cutTheSameUrlPart(url,"cate")}" class="left-sidebar-item m-3">${sub_cate.name}</a>
                                    </c:if>
                                </c:forEach>

                            </div>
                        </div>
                        </c:forEach>

                    </div>
                    <div class="sidebar__item">
                        <h4>Giá</h4>
                        <div class="price-range-wrap">
                            <div class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
                                 data-min="${price_min}" data-max="${price_max}" data-maxi="${max_price}" data-mini="${min_price}"
                                 data-type_page ="${type_page}" data-url="${Util.cutTheSameUrlPart(url,"price")}">
                                <div class="ui-slider-range ui-corner-all ui-widget-header"></div>
                                <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
                                <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
                            </div>
                            <div class="range-slider">
                                <div class="price-input">
                                    <input type="text" id="minamount">
                                    <input type="text" id="maxamount">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="single-block">
                        <h3 class="sidebar-title">Độ tuổi</h3>
                        <div class="form-check m-1 mt-3">

                            <input  <c:if test="${ages[0]}">checked</c:if> class="form-check-input" onclick="clickCheckbox('age',this,'${type_page}','${Util.cutUrlAgeGender(url,"age=tren-12-tuoi")}')" class="age-checkbox" type="checkbox" value="" id="tren-12-tuoi">
                            <label class="form-check-label" for="tren-12-tuoi">
                                Trên 12 tuổi
                            </label>
                        </div>
                        <div class="form-check m-1 mt-3">
                            <input <c:if test="${ages[1]}">checked</c:if> class="form-check-input" onclick="clickCheckbox('age',this,'${type_page}','${Util.cutUrlAgeGender(url,"age=tu-6-11-tuoi")}')" class="age-checkbox" type="checkbox" value="" id="tu-6-11-tuoi">
                            <label class="form-check-label" for="tu-6-11-tuoi">
                                Từ 6 - 11 tuổi
                            </label>
                        </div>
                        <div class="form-check m-1 mt-3">
                            <input <c:if test="${ages[2]}">checked</c:if> class="form-check-input" onclick="clickCheckbox('age',this,'${type_page}','${Util.cutUrlAgeGender(url,"age=tu-1-6-tuoi")}')" class="age-checkbox" type="checkbox" value="" id="tu-1-6-tuoi">
                            <label class="form-check-label" for="tu-1-6-tuoi">
                                Từ 1 - 6 tuổi
                            </label>
                        </div>
                    </div>
                    <div class="single-block">
                        <h3 class="sidebar-title">Giới tính</h3>
                        <div class="form-check m-1 mt-3">
                            <input class="form-check-input" <c:if test="${genders[0]}">checked</c:if> onclick="clickCheckbox('gender',this,'${type_page}','${Util.cutUrlAgeGender(url,"gender=gt-nam")}')" class="gender-checkbox" type="checkbox" value="" id="gt-nam">
                            <label class="form-check-label" for="gt-nam">
                                Nam
                            </label>
                        </div>
                        <div class="form-check m-1 mt-3">
                            <input class="form-check-input" <c:if test="${genders[1]}">checked</c:if> onclick="clickCheckbox('gender',this,'${type_page}','${Util.cutUrlAgeGender(url,"gender=gt-nu")}')" class="gender-checkbox" type="checkbox" value="" id="gt-nu">
                            <label class="form-check-label" for="gt-nu">
                                Nữ
                            </label>
                        </div>
                        <div class="form-check m-1 mt-3">
                            <input class="form-check-input" <c:if test="${genders[2]}">checked</c:if> onclick="clickCheckbox('gender',this,'${type_page}','${Util.cutUrlAgeGender(url,"gender=gt-unisex")}')" class="gender-checkbox" type="checkbox" value="" id="gt-unisex">
                            <label class="form-check-label" for="gt-unisex">
                                Unisex
                            </label>
                        </div>
                    </div>
                        <div class="single-block">
                            <h3 class="sidebar-title" >Thương hiệu</h3>
                            <c:forEach var="supplier" items="${suppliers}">
                                <c:set var="cut_sup_slug" value="sup-slug=${supplier.slug}" scope="page"></c:set>
                            <div class="form-check m-1 mt-3">
<%--                                <c:if test="${genders[0]}">checked</c:if> onclick="clickCheckbox('gender',this,'${type_page}','${Util.cutUrlAgeGender(url,"gender=gt-nam")}')"--%>
<%--        ${Util.cutUrlAgeGender(url,"sup-slug="+supplier.slug)}                            --%>
                                <input class="form-check-input gender-checkbox"

                                       type="checkbox"
                                       value=""
                                       id="${supplier.slug}"
                                       <c:if test="${supplier.checked}">checked</c:if>
                                       onclick="clickCheckbox('sup-slug',this,'${type_page}','${Util.cutUrlAgeGender(url,cut_sup_slug)}')"
                                       onclick="clickCheckbox('sup-slug',this,$(this).data('page'),cutUrl($(this).data('url'),'sup-slug='+brands[i].slug))"


                                >
                                <label class="form-check-label" for="${supplier.slug}">
                                    ${supplier.name} (${supplier.total_product})
                                </label>
                            </div>
                            </c:forEach>
                            <a class="my-1 show mt-3 d-block ml-1"  id="more-brand" data-url="${url}" data-page="${type_page}" data-brand="[${supplier_json}]">Hiển thị thêm</a>
                        </div>
                    <div id="met" class="sidebar__item">
                        <div class="latest-product__text">
                            <h3 class="sidebar-title" style="margin-bottom: 20px">Mới nhất</h3>
                            <div class="latest-product__slider owl-carousel">

                                <c:forEach var="i" begin="1" end="2">
                                <div class="latest-prdouct__slider__item">
                                    <c:forEach var="j" begin="${i*3-2}" end="${i*3}" >
                                        <c:set var="np" value="${applicationScope.nps.get(j)}"></c:set>
                                    <a href="#" class="latest-product__item">
                                        <div class="latest-product__item__pic img-1">
                                            <img src="${np.img}" alt="">
                                        </div>
                                        <div class="latest-product__item__text">
                                            <h6 style="font-size: 16px;font-weight: 400">${np.name}</h6>
                                            <c:if test="${np.percent_sale>0}">
                                            <h5 >${Util.formatCurrency(np.price_sale)}</h5>
                                            <h5 style="color:#b2b2b2;text-decoration:line-through; font-weight: 400">${Util.formatCurrency(np.price)}</h5>

                                            </c:if>
                                            <c:if test="${np.percent_sale==0}">
                                                <h5>${Util.formatCurrency(np.price)}</h5>

                                            </c:if>
                                        </div>
                                    </a>
                                    </c:forEach>

                                </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>



                </div>
            </div>
            <div class="col-lg-9 col-md-7">
                <div class="filter__item">
                    <div class="row">
                        <div class="col-md-6 ">
                            <div class="filter__sort">
                                <span>Sắp xếp</span>
                                <select id="select_sort">
                                    <c:if test="${sort_id==0}">
                                        <option value="" disabled selected>Chọn</option>

                                        <option value="${type_page}?sort_id=1&${Util.cutTheSameUrlPart(url,"sort_id")}">Mới Nhất</option>
                                        <option value="${type_page}?sort_id=2&${Util.cutTheSameUrlPart(url,"sort_id")}">Giá thấp đến cao</option>
                                        <option value="${type_page}?sort_id=3&${Util.cutTheSameUrlPart(url,"sort_id")}">Giá cao đến thấp</option>
                                        <option value="${type_page}?sort_id=4&${Util.cutTheSameUrlPart(url,"sort_id")}">Số lượng đã bán</option>
                                    </c:if>
                                    <c:if test="${sort_id==1}">
                                        <option value="" disabled selected>Chọn sắp xếp</option>
                                        <option value="${type_page}?sort_id=1&${Util.cutTheSameUrlPart(url,"sort_id")}" selected>Mới Nhất</option>
                                        <option value="${type_page}?sort_id=2&${Util.cutTheSameUrlPart(url,"sort_id")}">Giá thấp đến cao</option>
                                        <option value="${type_page}?sort_id=3&${Util.cutTheSameUrlPart(url,"sort_id")}">Giá cao đến thấp</option>
                                        <option value="${type_page}?sort_id=4&${Util.cutTheSameUrlPart(url,"sort_id")}">Số lượng đã bán</option>
                                    </c:if>
                                    <c:if test="${sort_id==2}">
                                        <option value="" disabled selected>Chọn sắp xếp</option>
                                        <option value="${type_page}?sort_id=1&${Util.cutTheSameUrlPart(url,"sort_id")}">Mới Nhất</option>
                                        <option value="${type_page}?sort_id=2&${Util.cutTheSameUrlPart(url,"sort_id")}" selected>Giá thấp đến cao</option>
                                        <option value="${type_page}?sort_id=3&${Util.cutTheSameUrlPart(url,"sort_id")}">Giá cao đến thấp</option>
                                        <option value="${type_page}?sort_id=4&${Util.cutTheSameUrlPart(url,"sort_id")}">Số lượng đã bán</option>
                                    </c:if>
                                    <c:if test="${sort_id==3}">
                                        <option value="" disabled selected>Chọn sắp xếp</option>
                                        <option value="${type_page}?sort_id=1&${Util.cutTheSameUrlPart(url,"sort_id")}">Mới Nhất</option>
                                        <option value="${type_page}?sort_id=2&${Util.cutTheSameUrlPart(url,"sort_id")}">Giá thấp đến cao</option>
                                        <option value="${type_page}?sort_id=3&${Util.cutTheSameUrlPart(url,"sort_id")}" selected>Giá cao đến thấp</option>
                                        <option value="${type_page}?sort_id=4&${Util.cutTheSameUrlPart(url,"sort_id")}">Số lượng đã bán</option>
                                    </c:if>
                                    <c:if test="${sort_id==4}">
                                        <option value="" disabled selected>Chọn sắp xếp</option>
                                        <option value="${type_page}?sort_id=1&${Util.cutTheSameUrlPart(url,"sort_id")}">Mới Nhất</option>
                                        <option value="${type_page}?sort_id=2&${Util.cutTheSameUrlPart(url,"sort_id")}">Giá thấp đến cao</option>
                                        <option value="${type_page}?sort_id=3&${Util.cutTheSameUrlPart(url,"sort_id")}" >Giá cao đến thấp</option>
                                        <option value="${type_page}?sort_id=4&${Util.cutTheSameUrlPart(url,"sort_id")}" selected>Số lượng đã bán</option>
                                    </c:if>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="filter__found">
                                <h6 style="color: white"><span>${sumOfItems}</span> sản phẩm đã tìm thấy</h6>
                            </div>
                        </div>
<%--                        <div class="col-lg-4 col-md-3">--%>
<%--                            <div class="filter__option">--%>
<%--                                <c:if test="${type_view==1}">--%>
<%--                                    <a href="${type_page}?type_view=1&${url}"><span class="icon_grid-2x2 set_choose"></span></a>--%>
<%--                                    <a href="${type_page}?type_view=2&${url}"><span class="icon_ul "></span></a>--%>
<%--                                </c:if>--%>
<%--                                <c:if test="${type_view==2}">--%>
<%--                                    <a href="${type_page}?type_view=1&${url}"><span class="icon_grid-2x2 "></span></a>--%>
<%--                                    <a href="${type_page}?type_view=2&${url}"><span class="icon_ul set_choose"></span></a>--%>
<%--                                </c:if>--%>
<%--                            </div>--%>
<%--                        </div>--%>
                    </div>
                </div>
                <div class="row">
                    <c:forEach var="sgd" items="${data}">
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
<%--                    <c:forEach var="sgd" items="${data}">--%>
<%--                        <c:set var="p" value="${sgd.price}"></c:set>--%>
<%--                        <c:set var="p_s" value="${sgd.price_sale}"></c:set>--%>
<%--                    <div class="col-lg-4 col-md-6 col-sm-6">--%>
<%--                        <div class="product__item">--%>
<%--                            <div class="product__item__pic set-bg" data-setbg="${sgd.img}">--%>
<%--                                <ul class="product__item__pic__hover">--%>
<%--                                    <li class="fast-checkout cursor-pointer" data-pro_id="${sgd.id}"><a ><i class="fa fa-money"></i></a></li>--%>
<%--                                    <c:if test="${sessionScope.user_id!=null}">--%>
<%--                                    <li class="addFa cursor-pointer" data-current_page="shopping" data-pro_id="${sgd.id}"><a><i class="fa fa-heart"></i></a></li>--%>
<%--                                    </c:if>--%>
<%--                                    <li class="addCart cursor-pointer" data-current_page="shopping" data-pro_id="${sgd.id}"><a ><i class="fa fa-shopping-cart"></i></a></li>--%>
<%--                                </ul>--%>
<%--                            </div>--%>
<%--                            <div class="product__item__text">--%>
<%--                                <h6><a href="shop-detail?id=${sgd.id}">${sgd.name}</a></h6>--%>
<%--                                <c:if test="${sgd.is_sale==true}">--%>
<%--                                    <span style="text-decoration: line-through"><%= Util.formatCurrency((double)pageContext.getAttribute("p")) %></span>--%>
<%--                                </c:if>--%>
<%--                                <h5><%= Util.formatCurrency((double)pageContext.getAttribute("p_s")) %></h5>--%>

<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    </c:forEach>--%>
                </div>
                <div class="product__pagination">
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
    </div>
    </div>
</section>
<!-- Product Section End -->


<jsp:include page="footer.jsp"></jsp:include>

<!-- Js Plugins -->
<script src="user_page/js/jquery-3.3.1.min.js"></script>
<script src="user_page/js/popper.min.js"></script>
<script src="user_page/js/bootstrap.min.js"></script>
<script src="user_page/js/jquery.nice-select.min.js"></script>
<script src="user_page/js/jquery-ui.min.js"></script>
<%--<script src="user_page/js/jquery.slicknav.js"></script>--%>
<%--<script src="user_page/js/mixitup.min.js"></script>--%>
<script src="user_page/js/owl.carousel.min.js"></script>
<script src="user_page/js/main.js"></script>
<script src="user_page/js/main_home.js"></script>
</body>