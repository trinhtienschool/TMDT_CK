<%--
  Created by IntelliJ IDEA.
  User: Trinh Quang Tien
  Date: 22/01/2021
  Time: 3:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% System.out.println("Co dang vao menu.jsp");%>
<!-- Header -->
<div class="header">
    <div class="header-left">
        <a href="dashboard" class="logo logo-small">
            <img src="../${applicationScope.header.logo}" alt="Logo" width="30" height="30">
        </a>
    </div>
    <a href="javascript:void(0);" id="toggle_btn">
        <i class="fas fa-align-left"></i>
    </a>
    <a class="mobile_btn" id="mobile_btn" href="javascript:void(0);">
        <i class="fas fa-align-left"></i>
    </a>

    <ul class="nav user-menu">

        <!-- User Menu -->
        <li class="nav-item dropdown">
            <a href="javascript:void(0)" class="dropdown-toggle user-link  nav-link" data-toggle="dropdown">
						<span class="user-img">
							<img class="rounded-circle" src="
<c:if test="${fn:startsWith(sessionScope.user_avatar, 'http')}">${sessionScope.user_avatar}</c:if>
<c:if test="${fn:startsWith(sessionScope.user_avatar,'imgs')}">../${sessionScope.user_avatar}</c:if>" width="40"
                                 alt="Admin">
						</span>
            </a>
            <div class="dropdown-menu dropdown-menu-right">
                <a class="dropdown-item" href="../user">Thông tin cá nhân</a>
                <a class="dropdown-item" href="../handle-login?logout=true">Đăng xuất</a>
            </div>
        </li>
        <!-- /User Menu -->

    </ul>
</div>
<!-- /Header -->

<!-- Sidebar -->
<div class="sidebar" id="sidebar">
    <div class="sidebar-logo">
        <a href="dashboard">
            <img src="../${applicationScope.header.logo}" class="img-fluid" alt="">
        </a>
    </div>
    <div class="sidebar-inner slimscroll">
        <div id="sidebar-menu" class="sidebar-menu">
            <ul>
                <li>
                    <a href="dashboard"
                       <c:if test="${current_page=='dashboard'}">class="active"</c:if>>
                        <i class="fas fa-columns"></i> <span>Dashboard</span></a>
                </li>
                <li class="submenu">
                    <a href="#"><i class="fas fa-tasks"></i> <span>Quản lí</span> <span class="menu-arrow"></span></a>
                    <ul style="display: none;">
                        <li><a href="category"
                               <c:if test="${current_page=='category'}">class="active"</c:if>>Danh mục</a></li>
                        <li><a href="product"
                               <c:if test="${current_page=='product'}">class="active"</c:if>>Sản phẩm</a></li>
                        <li><a href="blog-admin"
                               <c:if test="${current_page=='blog'}">class="active"</c:if>>Blog</a></li>
                        <li><a href="coupon-code-type"
                               <c:if test="${current_page=='coupon-code-type'}">class="active"</c:if>>Loại mã giảm
                            giá</a></li>
                        <li><a href="coupon_code"
                               <c:if test="${current_page=='coupon-code'}">class="active"</c:if>>Mã giảm giá</a></li>
                        <li><a href="ratingstype"
                               <c:if test="${current_page=='rating-type'}">class="active"</c:if>>Loại đánh giá</a></li>
                        <li><a href="email"
                               <c:if test="${current_page=='email'}">class="active"</c:if>>Email</a></li>

                    </ul>
                </li>

                <li class="submenu">
                    <a href="#"><i class="fas fa-shopping-cart"></i><span>Bán hàng</span> <span
                            class="menu-arrow"></span></a>
                    <ul style="display: none;">
                        <li><a href="total_report"
                               <c:if test="${current_page=='total-report'}">class="active"</c:if>>Danh sách đặt hàng</a>
                        </li>
                        <li><a href="shipment"
                               <c:if test="${current_page=='shipment'}">class="active"</c:if>>Vận chuyển</a></li>
                        <li><a href="warranty"
                               <c:if test="${current_page=='warranty'}">class="active"</c:if>>Bảo hành</a></li>
                        <li><a href="reviewreport"
                               <c:if test="${current_page=='review-report'}">class="active"</c:if>>Đánh giá sản phẩm</a>
                        </li>


                    </ul>
                </li>

                <li class="submenu">
                    <a href="#"><i class="fas fa-users"></i><span>Người dùng</span> <span class="menu-arrow"></span></a>
                    <ul style="display: none;">
                        <li><a href="users"
                               <c:if test="${current_page=='user'}">class="active"</c:if>>Khách hàng</a></li>
                        <c:if test="${sessionScope.role_id==3}">
                        <li><a href="list-admin"
                               <c:if test="${current_page=='admin-list'}">class="active"</c:if>>Danh sách admin</a></li>
                        </c:if>
                            <li><a href="supplier"
                               <c:if test="${current_page=='supplier'}">class="active"</c:if>>Nhà cung cấp</a></li>

                    </ul>
                </li>
                <li <c:if test="${current_page=='setting'}">class="active"</c:if>>
                    <a href="setting"><i class="fas fa-cog"></i> <span>Thiết lập</span></a>
                </li>
            </ul>
        </div>
    </div>
</div>
<%System.out.println("Da ra menu");%>
<!-- /Sidebar -->

