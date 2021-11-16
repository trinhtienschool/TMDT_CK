
<%@ page import="vn.thegioicaycanh.model.util.Util" %>
<%@ page import="vn.thegioicaycanh.model.home_page.Home_page" %>
<%@ page import="vn.thegioicaycanh.model.util.Util" %>
<%@ page import="vn.thegioicaycanh.model.header_footer.Category" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.thegioicaycanh.model.blog.Blog_Con_DB" %>
<%--
  Created by IntelliJ IDEA.
  User: Trinh Quang Tien
  Date: 25/12/2020
  Time: 21:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%--<%@ page import="vn.thegioicaycanh.model.util.Util" %>--%>
<!DOCTYPE html>
<html lang="vi-VN">
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>${title}</title>

    <%--    <c:set var="header" scope="application" value="${applicationScope.header}"></c:set>--%>
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
<body>
<jsp:include page="Menu.jsp"></jsp:include>

<jsp:include page="search_bar.jsp"></jsp:include>


<!-- Blog Section Begin -->
<section class="blog spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-5">
                <div class="sidebar__item">
                    <div class="latest-product__text">
                        <h4>Bài viết mới nhất</h4>
                        <div class="latest-product__slider owl-carousel">
                            <c:forEach var="i" begin="0" end="2" step="1">
                                <div class="latest-prdouct__slider__item">
                                    <c:forEach var="j" begin="${i*4}" end="${i*4+3}" step="1">
                                        <c:set var="nb" value="${newBlog.get(j)}"></c:set>

                                        <a href="blog-detail?id=${nb.id}" class="latest-product__item">
                                            <div class="latest-product__item__pic fix_size blog__sidebar__recent__item__pic">
                                                <img src="${nb.avatar}" alt="blog-avatar">
                                            </div>
                                            <div class="blog__sidebar__recent__item__text">
                                                <h6>${nb.name}</h6>
                                                <span>${nb.date_created}</span>
                                            </div>
                                        </a>
                                    </c:forEach>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <div class="sidebar__item">
                    <div class="latest-product__text">
                        <h4>Đọc nhiều nhất</h4>
                        <div class="latest-product__slider owl-carousel">
                            <c:forEach var="i" begin="0" end="2" step="1">
                                <div class="latest-prdouct__slider__item">
                                    <c:forEach var="j" begin="${i*4}" end="${i*4+3}" step="1">
                                        <c:set var="nb" value="${mostReadBlogs.get(j)}"></c:set>

                                        <a href="blog-detail?id=${nb.id}" class="latest-product__item">
                                            <div class="latest-product__item__pic fix_size blog__sidebar__recent__item__pic">
                                                <img src="${nb.avatar}" alt="blog-avatar">
                                            </div>
                                            <div class="blog__sidebar__recent__item__text">
                                                <h6>${nb.name}</h6>
                                                <span>${nb.date_created}</span>
                                            </div>
                                        </a>
                                    </c:forEach>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-8 col-md-7">
                <div class="row">
                    <c:forEach var="b" items="${data}">
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="blog__item">
                            <div class="blog__item__pic">
                                <a href="blog-detail?id=${b.id}"><img src="${b.avatar}" alt=""></a>
                            </div>
                            <div class="blog__item__text">
                                <ul>
                                    <li><i class="fa fa-calendar-o"></i> ${b.date_created}</li>
<%--                                    <li><i class="fa fa-comment-o"></i> ${b.id}</li>--%>
                                </ul>
                                <h5><a href="blog-detail?id=${b.id}">${b.name}</a></h5>
                                    <%--                    <p>Trong nhà của bạn không thể thiếu cây xanh phải không. Cây xanh mang đến không gian sống trong lành, thư thái và thoải mái. Cây xanh còn giúp…</p>--%>
                                <a href="blog-detail?id=${b.id}" class="blog__btn">ĐỌC THÊM <span class="arrow_right"></span></a>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                    <div class="col-lg-12">
                        <div class="product__pagination blog__pagination" >
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
    </div>
</section>
<!-- Blog Section End -->

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
