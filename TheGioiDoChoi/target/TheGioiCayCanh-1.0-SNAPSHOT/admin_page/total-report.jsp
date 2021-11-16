<%@ page import="vn.thegioicaycanh.model.util.Util" %>
<%@ page import="java.util.Date" %>
<%@ page import="vn.thegioicaycanh.model.Product.Product" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Trinh Quang Tien
  Date: 22/01/2021
  Time: 4:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<!DOCTYPE html>
<html lang="vi-VN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <title>${title}</title>
    <link href="assets/img/icon/icon-logo.png" rel="shortcut icon">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css">

    <!-- Fontawesome CSS -->
    <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
    <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">

    <!-- Datatables CSS -->
    <link rel="stylesheet" href="assets/plugins/datatables/datatables.min.css">

    <!-- Datepicker CSS -->
    <link rel="stylesheet" href="assets/css/bootstrap-datetimepicker.min.css">

    <!-- Animate CSS -->
    <link rel="stylesheet" href="assets/css/animate.min.css">
    <!-- Select CSS -->
    <link rel="stylesheet" href="assets/css/select2.min.css">
    <!-- Main CSS -->
    <link rel="stylesheet" href="assets/css/admin.css">

</head>
<body>
<div class="main-wrapper">
    <jsp:include page="menu.jsp"></jsp:include>
    <div class="page-wrapper">
        <div class="content container-fluid">

            <!-- Page Header -->
            <div class="page-header">
                <div class="row">
                    <div class="col">
                        <h3 class="page-title">${title}</h3>
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
                    <form action="total_report" method="post">
                        <div class="row filter-row">
                            <!-- Thay đổi theo danh sách đề mục -->
                            <div class="col-sm-6 col-md-3">
                                <div class="form-group">
                                    <label>Từ Ngày</label>
                                    <div class="cal-icon">
                                        <input class="form-control datetimepicker" type="text" name="from-date">
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-md-3">
                                <div class="form-group">
                                    <label>Đến Ngày</label>
                                    <div class="cal-icon">
                                        <input class="form-control datetimepicker" type="text" name="to-date">
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-md-3">
                                <div class="form-group">
                                    <button class="btn btn-primary btn-block" type="submit">Chọn</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <!-- /Search Filter -->
            <ul class="nav nav-tabs menu-tabs">
                <li class="nav-item <c:if test="${type_view==0}">active</c:if>">
                    <a class="nav-link">Tất cả</a>
                </li>
                <li class="nav-item <c:if test="${type_view==1}">active</c:if>">
                    <a class="nav-link" href="total_report?type_view=1">Đã hủy </a>
                </li>
                <li class="nav-item <c:if test="${type_view==2}">active</c:if>">
                    <a class="nav-link" href="total_report?type_view=2">Bị từ chối </a>
                </li>
                <li class="nav-item <c:if test="${type_view==3}">active</c:if>">
                    <a class="nav-link" href="total_report?type_view=3">Đang xử lí </a>
                </li>
                <li class="nav-item <c:if test="${type_view==4}">active</c:if>">
                    <a class="nav-link" href="total_report?type_view=4">Đang đóng gói </a>
                </li>
                <li class="nav-item <c:if test="${type_view==5}">active</c:if>">
                    <a class="nav-link" href="total_report?type_view=5">Đang vận chuyển </a>
                </li>
                <li class="nav-item <c:if test="${type_view==6}">active</c:if>">
                    <a class="nav-link" href="total_report?type_view=6">Thành công </a>
                </li>
            </ul>
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-hover table-center mb-0 datatable">
                                    <!-- Thay đổi code ở đây Thay đổi theo file word -->
                                    <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Ngày đặt hàng</th>
                                        <th>Khách hàng</th>
                                        <th>Tổng tiền</th>
                                        <th>Trạng thái</th>
                                        <th class="text-right">Hành Động</th>
                                    </tr>
                                    </thead>
                                    <!-- Thêm vào nội dung ở đây -->
                                    <tbody>
                                    <c:forEach var="o" items="${total_report}">
                                        <c:set var="total_pay" value="${o.total_pay}"></c:set>
                                        <c:set var="date_created" value="${o.date_created}"></c:set>
                                        <tr>
                                            <td>${o.id}</td>
                                            <td><%= Util.dateFormatNoTime((Date) pageContext.getAttribute("date_created"))%>
                                            </td>
                                            <td>${o.user_name}</td>
                                            <td><%= Util.formatCurrency((double) pageContext.getAttribute("total_pay"))%>
                                            </td>
                                            <td>
                                                <c:if test="${o.status==1}"><span
                                                        class="badge badge-danger">Đã hủy</span></c:if>
                                                <c:if test="${o.status==2}"><span
                                                        class="badge badge-warning">Bị từ chối</span></c:if>
                                                <c:if test="${o.status==3}"><span
                                                        class="badge badge-dark">Đang xử lí</span></c:if>
                                                <c:if test="${o.status==4}"><span class="badge badge-primary">Đang đóng gói</span></c:if>
                                                <c:if test="${o.status==5}"><span class="badge badge-info">Đang vận chuyển</span></c:if>
                                                <c:if test="${o.status==6}"><span
                                                        class="badge badge-success">Hoàn thành</span></c:if>
                                            </td>
                                            <td class="text-right">
                                                <a href="view_order?id=${o.id}" class="btn btn-sm bg-info-light">
                                                    <i class="far fa-eye mr-1"></i> Chi tiết</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    <%System.out.println("DA xuong toi day");%>
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

<!-- Datatables JS -->
<script src="assets/plugins/datatables/datatables.min.js"></script>

<!-- Select2 JS -->
<script src="assets/js/select2.min.js"></script>

<!-- Custom JS -->
<script src="assets/js/admin.js"></script>
</body>
</html>
