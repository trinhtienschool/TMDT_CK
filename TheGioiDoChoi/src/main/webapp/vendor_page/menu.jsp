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
                <a class="dropdown-item" href="../home">Trang chủ</a>
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
                    <a href="#"><i class="fas fa-tasks"></i> <span>Bán hàng</span> <span class="menu-arrow"></span></a>
                    <ul style="display: none;">

                        <li><a href="product"
                               <c:if test="${current_page=='product'}">class="active"</c:if>>Sản phẩm</a></li>
                        <li><a href="total_report"
                               <c:if test="${current_page=='total-report'}">class="active"</c:if>>Đơn hàng</a>
                        </li>
                        <li><a href="customers"
                               <c:if test="${current_page=='withdraw'}">class="active"</c:if>>Khách hàng</a></li>
                        <li><a href="withdraw"
                               <c:if test="${current_page=='withdraw'}">class="active"</c:if>>Rút tiền</a></li>
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

