<%--
  Created by IntelliJ IDEA.
  User: Trinh Quang Tien
  Date: 26/12/2020
  Time: 21:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!-- Hero Section Begin -->
<section class="hero hero-normal">
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="hero__categories">
                    <div class="hero__categories__all">
                        <i class="fa fa-bars"></i>
                        <span>Danh Mục</span>
                    </div>
                    <ul>
                        <c:forEach var="cate" items="${applicationScope.category}">
                            <c:if test="${cate.id==cate_id}">
                                <li><a class="set_choose" href="shopping?cate_id=${cate.id}">${cate.name}</a></li>
                            </c:if>
                            <c:if test="${cate.id != cate_id}">
                                <li><a href="shopping?cate_id=${cate.id}">${cate.name}</a></li>
                            </c:if>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <div class="col-lg-9">
                <div class="hero__search">
                    <div class="hero__search__form">
                        <form action="shopping">
                            <input type="text" name="keyword" placeholder="Tên cây cảnh" <c:if test="${keyword !=null}">value="${keyword}"</c:if> >
                            <button type="submit" class="site-btn">TÌM KIẾM</button>
                        </form>
                    </div>
                    <div class="hero__search__phone">
                        <div class="hero__search__phone__icon">
                            <i class="fa fa-phone"></i>
                        </div>
                        <div class="hero__search__phone__text">
                            <h5>${applicationScope.address.get(0).phone}</h5>
                            <span>Hỗ trợ 24/7</span>
                        </div>
                    </div>
                </div>
            </div>
            <%System.out.println("Da ra search_bar.jsp");%>
        </div>
    </div>
</section>
<!-- Hero Section End -->
<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" data-setbg="imgs/home/bg1.png">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>${applicationScope.header.name}</h2>
                    <div class="breadcrumb__option">
                        <span>${title}</span>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->
