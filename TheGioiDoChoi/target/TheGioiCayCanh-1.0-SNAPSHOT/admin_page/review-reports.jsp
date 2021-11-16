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
    <title>Đánh giá</title>
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
<c:set var="m" value="ratings"></c:set>
<%System.out.println("tat ca rating"+pageContext.getAttribute("m"));%>
<% System.out.println("Co dang vao product.jsp");%>
<div class="main-wrapper">
    <jsp:include page="menu.jsp"></jsp:include>
    <div class="page-wrapper">
        <div class="content container-fluid">

            <!-- Page Header -->
            <div class="page-header">
                <div class="row">
                    <div class="col">
                        <h3 class="page-title">Đánh giá sản phẩm</h3>
                    </div>
<%--                    <div class="col-auto text-right">--%>
<%--                        <a class="btn btn-white filter-btn" href="javascript:void(0);" id="filter_search">--%>
<%--                            <i class="fas fa-filter"></i>--%>
<%--                        </a>--%>
<%--                    </div>--%>
                </div>
            </div>
            <!-- /Page Header -->

            <!-- Search Filter -->
            <div class="card filter-card" id="filter_inputs">
                <div class="card-body pb-0">
                    <form action="admin-page/product" method="post">
                        <div class="row filter-row">
                            <div class="col-sm-6 col-md-3">
                                <div class="form-group">
                                    <label>Dịch vụ</label>
                                    <input class="form-control" type="text" name="product-name">
                                </div>
                            </div>
                            <!-- Thay đổi theo danh sách đề mục -->
                            <div class="col-sm-6 col-md-3">
                                <div class="form-group">
                                    <label>TypeRate</label>
                                    <select class="form-control select" name="typerate">
                                        <option disabled>Chọn loại/option>
                                        <option>Rất tốt</option>
                                        <option>Tốt</option>
                                        <option>Được</option>
                                        <option>Tệ</option>
                                        <option>Rất tệ</option>
                                    </select>
                                </div>
                            </div>
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
                                        <th>id</th>
                                        <th>Ngày</th>

                                        <th>Mã người dùng</th>
                                        <th>Mã sản phẩm</th>
<%--                                        <th>Mã đánh giá</th>--%>
                                        <th>Bình luận</th>
                                    </tr>
                                    </thead>

                                    <!-- Thêm vào nội dung ở đây -->
                                    <tbody>
                                    <c:forEach var="p" items="${ratings}">
                                        <c:set var="date_created" value="${p.date_created}"></c:set>
                                        <tr>
                                            <td>${p.id}</td>
                                            <td>${p.date_created}</td>
<%--                                            <td><%= Util.dateFormatNoTime((Date) pageContext.getAttribute("date_created"))%></td>--%>
<%--                                            <td><img class="rounded service-img mr-1" src="${p.getAvatarUserById(p.user_id)}" alt="Hình ảnh khách hàng"></td>--%>
<%--                                            <td>${p.getAvatarUserById(p.user_id)}</td>--%>
                                            <td style="margin-right: 50px">${p.user_id}</td>
<%--                                            <td>${p.p.rating_type_id}</td>--%>
                                            <td>${p.pro_id}</td>
                                            <td>${p.comment}</td>
<%--                                            <td class="text-right">--%>
<%--                                                <a href="edit-product.html" style="margin-top: 5px;color: red " class="btn btn-outline-danger btn-sm"><i class="fa fa-trash-o"></i> Xóa</a>--%>
<%--                                            </td>--%>
                                        </tr>
                                    </c:forEach>
<%--                                    <%System.out.println("DA xuong toi day");%>--%>
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
