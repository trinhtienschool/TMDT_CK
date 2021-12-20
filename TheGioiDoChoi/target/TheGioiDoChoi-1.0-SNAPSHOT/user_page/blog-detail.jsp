<%--
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

<body>
    <jsp:include page="Menu.jsp"></jsp:include>
    <jsp:include page="search_bar.jsp"></jsp:include>
    <!-- Blog Details Section Begin -->
    <section class="blog-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-5">
                    <div class="blog__sidebar">
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
<%--                        <div class="sidebar__item">--%>
<%--                            <div class="latest-product__text">--%>
<%--                                <h4>Có thể bạn thích</h4>--%>
<%--                                <div class="latest-product__slider owl-carousel">--%>
<%--                                    <c:forEach var="i" begin="0" end="2" step="1">--%>
<%--                                        <div class="latest-prdouct__slider__item">--%>
<%--                                            <c:forEach var="j" begin="${i*4}" end="${i*4+3}" step="1">--%>
<%--                                                <c:set var="nb" value="${randomBlog.get(j)}"></c:set>--%>

<%--                                                <a href="#" class="latest-product__item">--%>
<%--                                                    <div class="latest-product__item__pic fix_size blog__sidebar__recent__item__pic">--%>
<%--                                                        <img src="${nb.avatar}" alt="">--%>
<%--                                                    </div>--%>
<%--                                                    <div class="blog__sidebar__recent__item__text">--%>
<%--                                                        <h6>${nb.name}</h6>--%>
<%--                                                        <span>${nb.date_created}</span>--%>
<%--                                                    </div>--%>
<%--                                                </a>--%>
<%--                                            </c:forEach>--%>
<%--                                        </div>--%>
<%--                                    </c:forEach>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
                    </div>
                </div>
                <div class="col-lg-8 col-md-7 order-md-1 order-1">
                    <div class="title-blog">${blog.name}</div>
                    <div class="blog__details__text">
                        <img src="${blog.avatar}" style="width: 100%;" alt="blog-avatar" />
                        ${blog.content}
                    </div>
                    <div class="blog__details__content">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="blog__details__author">
                                    <div class="blog__details__author__pic">
                                        <img src="${author.avatar}" alt="author-avatar" />
                                    </div>
                                    <div class="blog__details__author__text">
                                        <h6>${author.name}</h6>
                                        <span>Admin</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Details Section End -->
    <!-- Related Blog Section Begin -->
    <section class="related-blog spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title related-blog-title">
                        <h2>Có Thể Bạn Thích</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <c:forEach var="rb" items="${randomBlog}">
                    <div class="col-lg-4 col-md-4 col-sm-6">
                        <div class="blog__item">
                            <div class="blog__item__pic">
                                <a href="blog-detail?id=${rb.id}"><img src="${rb.avatar}" alt="blog-name"></a>
                            </div>
                            <div class="blog__item__text">
                                <ul>
                                    <li><i class="fa fa-calendar-o"></i>${rb.date_created}</li>
                                    <li><i class="fa fa-eye"></i> ${rb.numOfRead}</li>
                                </ul>
                                <h5><a href="blog-detail?id=${rb.id}">${rb.name}
                                </a></h5>
                                <p>${rb.description}</p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>
    <!-- Related Blog Section End -->
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
