<%--
  Created by IntelliJ IDEA.
  User: Trinh Quang Tien
  Date: 24/01/2021
  Time: 9:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="vn.thegioicaycanh.model.util.Util" %>
<%@ page import="java.util.Date" %>
<%@ page import="vn.thegioicaycanh.model.Product.Product" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi-VN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <title>Bảo hành</title>
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
                        <h3 class="page-title">Bảo hành</h3>
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
                    <form action="warranty" method="post" accept-charset="UTF-8">
                        <div class="row filter-row">

                            <!-- thay đổi ở đây ************************ -->
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

            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-hover table-center mb-0 datatable">
                                    <!-- Thay đổi code ở đây Thay đổi theo file word -->
                                    <thead>
                                    <tr>
                                        <th>ID hoàn trả</th>
                                        <th>Title</th>
                                        <th>ID order</th>
                                        <th>Tên khách hàng</th>
                                        <th>Tên sản phẩm</th>
                                        <th>Trạng thái hoàn trả</th>
                                        <th>Ngày</th>
                                        <th class="text-right">Hành Động</th>
                                    </tr>
                                    </thead>

                                    <!-- Thêm vào nội dung ở đây -->
                                    <tbody>
                                    <c:forEach var="w" items="${warranties}">
                                        <c:set var="date_created" value="${w.date_created}"></c:set>
                                    <tr>
                                        <td>${w.id}</td>
                                        <td>${w.title}</td>
                                        <td>${w.order_id}</td>
                                        <td>${w.user_name}</td>
                                        <td>${w.product_name}</td>
                                        <td>
                                            <label class="badge badge-info">
                                                <c:if test="${w.status==1}">Chờ xử lí</c:if>
                                                <c:if test="${w.status==2}">Đã xử lí</c:if>
                                            </label>
                                        </td>
                                        <td><%= Util.dateFormatNoTime((Date) pageContext.getAttribute("date_created"))%>
                                        <td class="text-right">
                                        <a href="edit-warranty?type=enterEdit&id=${w.id}"
                                           class="btn btn-sm bg-success-light "> <i
                                                class="far fa-edit mr-1"></i> Sửa</a>
                                        </td>
                                    </tr>
                                    </c:forEach>
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
<script src="assets/plugins/datatables/datatables.min.js"></script>

<!-- Select2 JS -->
<script src="assets/js/select2.min.js"></script>
<!-- Custom JS -->
<script src="assets/js/admin.js"></script>

</body>

</html>
