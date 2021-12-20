<%--
  Created by IntelliJ IDEA.
  User: MyPC
  Date: 11/24/2021
  Time: 8:59 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="vi-VN">
<head>
    <meta charset="utf-8">
    <title>Danh sách đặt hàng</title>
    <link href="assets/img/icon/icon-logo.png" rel="shortcut icon">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css">

    <!-- Fontawesome CSS -->
    <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
    <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">

    <!-- Datepicker CSS -->
    <link rel="stylesheet" href="assets/css/bootstrap-datetimepicker.min.css">

    <!-- Datatables CSS -->
    <link rel="stylesheet" href="assets/plugins/datatables/datatables.min.css">

    <!-- Animate CSS -->
    <link rel="stylesheet" href="assets/css/animate.min.css">

    <!-- Select CSS -->
    <link rel="stylesheet" href="assets/css/select2.min.css">

    <!-- Main CSS -->
    <link rel="stylesheet" href="assets/css/admin.css">

</head>

<body>
<div class="main-wrapper">

    <!-- Header -->
    <div class="header">
        <div class="header-left">
            <a href="dashboard.html" class="logo logo-small">
                <img src="assets/img/logo-icon.png" alt="Logo" width="30" height="30">
            </a>
        </div>
        <a href="javascript:void(0);" id="toggle_btn">
            <i class="fas fa-align-left"></i>
        </a>
        <a class="mobile_btn" id="mobile_btn" href="javascript:void(0);">
            <i class="fas fa-align-left"></i>
        </a>

        <ul class="nav user-menu">
            <!-- Notifications -->
            <li class="nav-item dropdown noti-dropdown">
                <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
                    <i class="far fa-bell"></i>  <span class="badge badge-pill"></span>
                </a>
                <div class="dropdown-menu dropdown-menu-right notifications">
                    <div class="topnav-dropdown-header">
                        <span class="notification-title">Thông Báo</span>
                        <a href="javascript:void(0)" class="clear-noti"> xóa tất cả </a>
                    </div>
                    <div class="noti-content">
                        <ul class="notification-list">
                            <li class="notification-message">
                                <a href="admin-notification.html">
                                    <div class="media">
                                            <span class="avatar avatar-sm">
                                                <img class="avatar-img rounded-circle" alt="" src="assets/img/customer/ong.jpg">
                                            </span>
                                        <div class="media-body">
                                            <p class="noti-details">
                                                <span class="noti-title">Ung Thành Vũ đã gửi phản hồi</span>
                                            </p>
                                            <p class="noti-time">
                                                <span class="notification-time">15 Tháng Chín 2020 10:20</span>
                                            </p>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li class="notification-message">
                                <a href="notification-detail.html">
                                    <div class="media">
                                            <span class="avatar avatar-sm">
                                                <img class="avatar-img rounded-circle" alt="" src="assets/img/customer/user21.jpg">
                                            </span>
                                        <div class="media-body">
                                            <p class="noti-details">
                                                <span class="noti-title">Nguyễn Hoàng Sơn đã gửi phản hồi</span>
                                            </p>
                                            <p class="noti-time">
                                                <span class="notification-time">13 Tháng Chín 2020 15:56</span>
                                            </p>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li class="notification-message">
                                <a href="admin-notification.html">
                                    <div class="media">
                                            <span class="avatar avatar-sm">
                                                <img class="avatar-img rounded-circle" alt="" src="assets/img/customer/user22.jpg">
                                            </span>
                                        <div class="media-body">
                                            <p class="noti-details">
                                                <span class="noti-title">Biên Bá Hiền đã gửi phản hồi</span>
                                            </p>
                                            <p class="noti-time">
                                                <span class="notification-time">12 Tháng Chín 2020 06:05 </span>
                                            </p>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li class="notification-message">
                                <a href="admin-notification.html">
                                    <div class="media">
                                            <span class="avatar avatar-sm">
                                                <img class="avatar-img rounded-circle" alt="User Image" src="assets/img/customer/user23.jpg">
                                            </span>
                                        <div class="media-body">
                                            <p class="noti-details">
                                                <span class="noti-title">Ngô Thế Huân đã gửi phản hồi</span>
                                            </p>
                                            <p class="noti-time">
                                                <span class="notification-time">11 Tháng Chín 2020 12:04 </span>
                                            </p>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li class="notification-message">
                                <a href="admin-notification.html">
                                    <div class="media">
                                            <span class="avatar avatar-sm">
                                                <img class="avatar-img rounded-circle" alt="User Image" src="assets/img/customer/user24.jpg">
                                            </span>
                                        <div class="media-body">
                                            <p class="noti-details">
                                                <span class="noti-title">Dương Dĩnh đã gửi phản hồi</span>
                                            </p>
                                            <p class="noti-time">
                                                <span class="notification-time">10 Tháng Chín 2020 08:42</span>
                                            </p>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li class="notification-message">
                                <a href="admin-notification.html">
                                    <div class="media">
                                            <span class="avatar avatar-sm">
                                                <img class="avatar-img rounded-circle" alt="User Image" src="assets/img/customer/user25.jpg">
                                            </span>
                                        <div class="media-body">
                                            <p class="noti-details">
                                                <span class="noti-title">Lưu Thi Thi đã gửi phản hồi</span>
                                            </p>
                                            <p class="noti-time">
                                                <span class="notification-time">9 Tháng Chín 2020 11:01 </span>
                                            </p>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li class="notification-message">
                                <a href="admin-notification.html">
                                    <div class="media">
                                            <span class="avatar avatar-sm">
                                                <img class="avatar-img rounded-circle" alt="User Image" src="assets/img/customer/user26.jpg">
                                            </span>
                                        <div class="media-body">
                                            <p class="noti-details">
                                                <span class="noti-title">Trương Tân Thành đã gửi phản hồi</span>
                                            </p>
                                            <p class="noti-time">
                                                <span class="notification-time">8 Tháng Chín 2020 06:23 </span>
                                            </p>
                                        </div>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="topnav-dropdown-footer">
                        <a href="admin-notification.html">Tất cả Thông báo</a>
                    </div>
                </div>
            </li>
            <!-- /Notifications -->
            <!-- User Menu -->
            <li class="nav-item dropdown">
                <a href="javascript:void(0)" class="dropdown-toggle user-link  nav-link" data-toggle="dropdown">
						<span class="user-img">
							<img class="rounded-circle" src="assets/img/user.jpg" width="40" alt="Admin">
						</span>
                </a>
                <div class="dropdown-menu dropdown-menu-right">
                    <a class="dropdown-item" href="admin-profile.html">Thông tin cá nhân</a>
                    <a class="dropdown-item" href="login.html">Đăng xuất</a>
                </div>
            </li>
            <!-- /User Menu -->

        </ul>
    </div>
    <!-- /Header -->

    <!-- Sidebar -->
    <div class="sidebar" id="sidebar">
        <div class="sidebar-logo">
            <a href="dashboard.html">
                <img src="assets/img/logo-icon.png" class="img-fluid" alt="">
            </a>
        </div>
        <div class="sidebar-inner slimscroll">
            <div id="sidebar-menu" class="sidebar-menu">
                <ul>
                    <li>
                        <a href="dashboard.html"><i class="fas fa-columns"></i> <span>Dashboard</span></a>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fas fa-tasks"></i> <span>Quản lí</span> <span class="menu-arrow"></span></a>
                        <ul style="display: none;">
                            <li><a href="categories.html">Danh mục</a></li>
                            <li><a href="product.html" >Sản phẩm</a></li>
                            <li><a href="blog.html">Blog</a></li>
                            <li><a href="coupon-code-type.html">Loại mã giảm giá</a></li>
                            <li><a href="coupon-code.html">Mã giảm giá</a></li>
                            <li><a href="ratingstype.html">Loại đánh giá</a></li>
                            <li><a href="email.html">Email</a></li>

                        </ul>
                    </li>

                    <li class="submenu">
                        <a href="#"><i class="fas fa-shopping-cart"></i><span>Bán hàng</span> <span class="menu-arrow"></span></a>
                        <ul style="display: none;">
                            <li><a href="total-report.html" class="active">Danh sách đặt hàng</a></li>
                            <li><a href="shipments.html">Vận chuyển</a></li>
                            <li><a href="return-request.html">Bảo hành</a></li>
                            <li><a href="review-reports.html">Đánh giá sản phẩm</a></li>


                        </ul>
                    </li>

                    <li class="submenu">
                        <a href="#"><i class="fas fa-users"></i><span>Người dùng</span> <span class="menu-arrow"></span></a>
                        <ul style="display: none;">
                            <li><a href="users.html">Khách hàng</a></li>
                            <li><a href="admin-list.html">Danh sách admin</a></li>
                            <li><a href="service-list.html">Nhà cung cấp</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="admin-profile.html"><i class="fas fa-user-plus"></i> <span>Thông tin cá nhân</span></a>
                    </li>
                    <li>
                        <a href="settings.html"><i class="fas fa-cog"></i> <span>Thiết lập</span></a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!-- /Sidebar -->

    <div class="page-wrapper">
        <div class="content container-fluid">

            <!-- Page Header -->
            <div class="page-header">
                <div class="row">
                    <div class="col">
                        <h3 class="page-title">Danh sách đặt hàng</h3>
                    </div>
                    <div class="col-auto text-right">
                        <a class="btn btn-white filter-btn" href="javascript:void(0);" id="filter_search">
                            <i class="fas fa-filter"></i>
                        </a>
                    </div>
                </div>
            </div>
            <!-- /Page Header -->

            <!-- Search Filter -->
            <div class="card filter-card" id="filter_inputs">
                <div class="card-body pb-0">
                    <form>
                        <div class="row filter-row">
                            <div class="col-sm-6 col-md-3">
                                <div class="form-group">
                                    <label class="col-form-label">Từ ngày</label>
                                    <div class="cal-icon">
                                        <input class="form-control datetimepicker" type="text">
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-md-3">
                                <div class="form-group">
                                    <label class="col-form-label">Đến ngày</label>
                                    <div class="cal-icon">
                                        <input class="form-control datetimepicker" type="text">
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-md-3">
                                <div class="form-group">
                                    <button class="btn btn-primary btn-block" type="submit">Submit</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <!-- /Search Filter -->

            <ul class="nav nav-tabs menu-tabs">
                <li class="nav-item active">
                    <a class="nav-link" href="total-report.html">Tất cả<span class="badge badge-primary">550</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="pending-report.html">Chờ xử lí <span class="badge badge-primary">125</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="inprogress-report.html">Đang xử lí <span class="badge badge-primary">86</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="complete-report.html">Hoàn thành <span class="badge badge-primary">89</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="reject-report.html">Bị từ chối <span class="badge badge-primary">101</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="cancel-report.html">Đã hủy <span class="badge badge-primary">121</span></a>
                </li>
            </ul>
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-hover table-center mb-0 datatable">
                                    <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Ngày đặt hàng</th>
                                        <th>Khách hàng</th>
                                        <th>Sản phẩm</th>
                                        <th>Thành tiền</th>
                                        <th>Trạng thái</th>
                                        <th>Chi tiết</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>order-01</td>
                                        <td>16/9/2020</td>
                                        <td>
													<span class="table-avatar">
														<a href="#" class="avatar avatar-sm mr-2">
															<img class="avatar-img rounded-circle" alt="" src="assets/img/customer/user1.jpg">
														</a>
														<a href="javascript:void(0);">Lữ Thanh Hải</a>
													</span>
                                        </td>
                                        <td>
													<span class="table-avatar">
														<a href="#" class="avatar avatar-sm mr-2">
															<img class="avatar-img rounded-circle" alt="" src="assets/img/product/cam-nhung.jpg">
														</a>
														<a href="javascript:void(0);">Cây cẩm nhung</a>
													</span>
                                        </td>
                                        <td>125.000 VNĐ</td>
                                        <td>
                                            <label class="badge badge-dark">Đang chờ xử lí</label>
                                        </td>
                                        <td>
                                            <a href="view-order.html" class="btn btn-sm bg-info-light">
                                                <i class="far fa-eye mr-1"></i> Chi tiết
                                            </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>order-02</td>
                                        <td>15/9/2020</td>
                                        <td>
													<span class="table-avatar">
														<a href="#" class="avatar avatar-sm mr-2">
															<img class="avatar-img rounded-circle" alt="" src="assets/img/customer/user2.jpg">
														</a>
														<a href="javascript:void(0);">Lữ Hà Nam</a>
													</span>
                                        </td>
                                        <td>
													<span class="table-avatar">
														<a href="#" class="avatar avatar-sm mr-2">
															<img class="avatar-img rounded-circle" alt="" src="assets/img/product/cay-dua-canh-nen-do.jpg">
														</a>
														<a href="javascript:void(0);">Cây dứa nến</a>
													</span>
                                        </td>
                                        <td>125.000 VNĐ</td>
                                        <td>
                                            <label class="badge badge-primary">Hoàn thành</label>
                                        </td>
                                        <td>
                                            <a href="service-details.html" class="btn btn-sm bg-info-light">
                                                <i class="far fa-eye mr-1"></i> Chi tiết
                                            </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>order-04</td>
                                        <td>15/9/2020</td>
                                        <td>
													<span class="table-avatar">
														<a href="#" class="avatar avatar-sm mr-2">
															<img class="avatar-img rounded-circle" alt="" src="assets/img/customer/user15.jpg">
														</a>
														<a href="javascript:void(0);">Hà Thanh Nam</a>
													</span>
                                        </td>
                                        <td>
													<span class="table-avatar">
														<a href="#" class="avatar avatar-sm mr-2">
															<img class="avatar-img rounded-circle" alt="" src="assets/img/product/cay-kim-tien.jpg">
														</a>
														<a href="javascript:void(0);">Cây kim tiền</a>
													</span>
                                        </td>
                                        <td>145.000 VNĐ</td>
                                        <td>
                                            <label class="badge badge-info">Đang xử lí</label>
                                        </td>
                                        <td>
                                            <a href="service-details.html" class="btn btn-sm bg-info-light">
                                                <i class="far fa-eye mr-1"></i> Chi tiết
                                            </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>order-12</td>
                                        <td>16/9/2020</td>
                                        <td>
													<span class="table-avatar">
														<a href="#" class="avatar avatar-sm mr-2">
															<img class="avatar-img rounded-circle" alt="" src="assets/img/customer/user4.jpg">
														</a>
														<a href="javascript:void(0);">Đoàn Quang Hải</a>
													</span>
                                        </td>
                                        <td>
													<span class="table-avatar">
														<a href="#" class="avatar avatar-sm mr-2">
															<img class="avatar-img rounded-circle" alt="" src="assets/img/product/cay-luoi-ho-thai.jpg">
														</a>
														<a href="javascript:void(0);">Cây lưỡi hổ thái</a>
													</span>
                                        </td>
                                        <td>99.000 VNĐ</td>
                                        <td>
                                            <label class="badge badge-warning">Từ chối bởi người dùng</label>
                                        </td>
                                        <td>
                                            <a href="service-details.html" class="btn btn-sm bg-info-light">
                                                <i class="far fa-eye mr-1"></i> Chi tiết
                                            </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>order-06</td>
                                        <td>16/9/2020</td>
                                        <td>
													<span class="table-avatar">
														<a href="#" class="avatar avatar-sm mr-2">
															<img class="avatar-img rounded-circle" alt="" src="assets/img/customer/user6.jpg">
														</a>
														<a href="javascript:void(0);">Hà Thị Kim Chi</a>
													</span>
                                        </td>
                                        <td>
													<span class="table-avatar">
														<a href="#" class="avatar avatar-sm mr-2">
															<img class="avatar-img rounded-circle" alt="" src="assets/img/product/sen-da-kim-cuong.jpg">
														</a>
														<a href="javascript:void(0);">Sen đá kim cương</a>
													</span>
                                        </td>
                                        <td>125.000 VNĐ</td>
                                        <td>
                                            <label class="badge badge-dark">Đang chờ xử lí</label>
                                        </td>
                                        <td>
                                            <a href="service-details.html" class="btn btn-sm bg-info-light">
                                                <i class="far fa-eye mr-1"></i> Chi tiết
                                            </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>order-07</td>
                                        <td>16/9/2020</td>
                                        <td>
													<span class="table-avatar">
														<a href="#" class="avatar avatar-sm mr-2">
															<img class="avatar-img rounded-circle" alt="" src="assets/img/customer/user12.png">
														</a>
														<a href="javascript:void(0);">Thái Linh Mỹ</a>
													</span>
                                        </td>
                                        <td>
													<span class="table-avatar">
														<a href="#" class="avatar avatar-sm mr-2">
															<img class="avatar-img rounded-circle" alt="" src="assets/img/product/sen-da-mini.jpg">
														</a>
														<a href="javascript:void(0);">Sen đá mini</a>
													</span>
                                        </td>
                                        <td>65.000 VNĐ</td>
                                        <td>
                                            <label class="badge badge-danger">Bị hủy bởi người dùng</label>
                                        </td>
                                        <td>
                                            <a href="service-details.html" class="btn btn-sm bg-info-light">
                                                <i class="far fa-eye mr-1"></i> Chi tiết
                                            </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>order-08</td>
                                        <td>16/9/2020</td>
                                        <td>
													<span class="table-avatar">
														<a href="#" class="avatar avatar-sm mr-2">
															<img class="avatar-img rounded-circle" alt="" src="assets/img/customer/user14.jpg">
														</a>
														<a href="javascript:void(0);">Lê Quốc Kiều</a>
													</span>
                                        </td>
                                        <td>
													<span class="table-avatar">
														<a href="#" class="avatar avatar-sm mr-2">
															<img class="avatar-img rounded-circle" alt="" src="assets/img/product/xuong-rong-tai-tho.jpg">
														</a>
														<a href="javascript:void(0);">Cây xương rồng tai thỏ</a>
													</span>
                                        </td>
                                        <td>76.000 VNĐ</td>
                                        <td>
                                            <label class="badge badge-dark">Đang chờ xử lí</label>
                                        </td>
                                        <td>
                                            <a href="service-details.html" class="btn btn-sm bg-info-light">
                                                <i class="far fa-eye mr-1"></i> Chi tiết
                                            </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>order-09</td>
                                        <td>13/9/2020</td>
                                        <td>
													<span class="table-avatar">
														<a href="#" class="avatar avatar-sm mr-2">
															<img class="avatar-img rounded-circle" alt="" src="assets/img/customer/user19.jpg">
														</a>
														<a href="javascript:void(0);">Lý Thanh Na</a>
													</span>
                                        </td>
                                        <td>
													<span class="table-avatar">
														<a href="#" class="avatar avatar-sm mr-2">
															<img class="avatar-img rounded-circle" alt="" src="assets/img/product/xuong-rong-nui.jpg">
														</a>
														<a href="javascript:void(0);">Cây xương rồng núi</a>
													</span>
                                        </td>
                                        <td>46.000 VNĐ</td>
                                        <td>
                                            <label class="badge badge-primary">Hoàn thành</label>
                                        </td>
                                        <td>
                                            <a href="service-details.html" class="btn btn-sm bg-info-light">
                                                <i class="far fa-eye mr-1"></i> Chi tiết
                                            </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>order-11</td>
                                        <td>16/9/2020</td>
                                        <td>
													<span class="table-avatar">
														<a href="#" class="avatar avatar-sm mr-2">
															<img class="avatar-img rounded-circle" alt="" src="assets/img/customer/user12.png">
														</a>
														<a href="javascript:void(0);">Quan Thanh Liêm</a>
													</span>
                                        </td>
                                        <td>
													<span class="table-avatar">
														<a href="#" class="avatar avatar-sm mr-2">
															<img class="avatar-img rounded-circle" alt="" src="assets/img/product/xuong-rong-trung-chim.jpg">
														</a>
														<a href="javascript:void(0);">Xương rồng trứng chim</a>
													</span>
                                        </td>
                                        <td>85.000 VNĐ</td>
                                        <td>
                                            <label class="badge badge-info">Đang xử lí</label>
                                        </td>
                                        <td>
                                            <a href="service-details.html" class="btn btn-sm bg-info-light">
                                                <i class="far fa-eye mr-1"></i> Chi tiết
                                            </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>order-10</td>
                                        <td>16/9/2020</td>
                                        <td>
													<span class="table-avatar">
														<a href="#" class="avatar avatar-sm mr-2">
															<img class="avatar-img rounded-circle" alt="" src="assets/img/customer/user17.jpg">
														</a>
														<a href="javascript:void(0);">Trần Huỳnh Phúc</a>
													</span>
                                        </td>
                                        <td>
													<span class="table-avatar">
														<a href="#" class="avatar avatar-sm mr-2">
															<img class="avatar-img rounded-circle" alt="" src="assets/img/product/cam-nhung.jpg">
														</a>
														<a href="javascript:void(0);">Cây cẩm nhung</a>
													</span>
                                        </td>
                                        <td>125.000 VNĐ</td>
                                        <td>
                                            <label class="badge badge-info">Đang xử lí</label>
                                        </td>
                                        <td>
                                            <a href="service-details.html" class="btn btn-sm bg-info-light">
                                                <i class="far fa-eye mr-1"></i> Chi tiết
                                            </a>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- jQuery -->
<script src="assets/js/jquery-3.5.0.min.js"></script>

<!-- Bootstrap Core JS -->
<script src="assets/js/popper.min.js"></script>
<script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>

<!-- Datepicker Core JS -->
<script src="assets/js/moment.min.js"></script>
<script src="assets/js/bootstrap-datetimepicker.min.js"></script>

<!-- Slimscroll JS -->
<script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<!-- Datatables JS -->
<script src="assets/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="assets/plugins/datatables/datatables.min.js"></script>

<!-- Select2 JS -->
<script src="assets/js/select2.min.js"></script>

<!-- Custom JS -->
<script src="assets/js/admin.js"></script>

</body>

</html>