<%@ page import="vn.thegioicaycanh.model.util.Util" %>
<%@ page import="java.util.Date" %>
<%@ page import="vn.thegioicaycanh.model.Product.Product" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
    <title>Sản phẩm</title>
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
<% System.out.println("Co dang vao product.jsp");%>
<div class="main-wrapper">
    <jsp:include page="menu.jsp"></jsp:include>
    <div class="page-wrapper">
        <div class="content container-fluid">

            <!-- Page Header -->
            <div class="page-header">
                <div class="row">
                    <div class="col">
                        <h3 class="page-title">Sản phẩm</h3>
                    </div>
                    <div class="col-auto text-right">
                        <a class="btn btn-white filter-btn" href="javascript:void(0);" id="filter_search">
                            <i class="fas fa-filter"></i>
                        </a>
                        <a href="add-product?type=enterAdd" class="btn btn-primary add-button ml-3">
                            <i class="fas fa-plus"></i>
                        </a>
                    </div>
                </div>
            </div>
            <!-- /Page Header -->

            <!-- Search Filter -->
            <div class="card filter-card" id="filter_inputs">
                <div class="card-body pb-0">
                    <form action="product" method="post" accept-charset="UTF-8">
                        <div class="row filter-row">
                            <div class="col-sm-6 col-md-3">
                                <div class="form-group">
                                    <label>Mã sản phẩm</label>
                                    <input class="form-control" type="text" name="product-id">
                                </div>
                            </div>
                            <div class="col-sm-6 col-md-3">
                                <div class="form-group">
                                    <label>Tên sản phẩm</label>
                                    <input class="form-control" type="text" name="product-name">
                                </div>
                            </div>
                            <!-- Thay đổi theo danh sách đề mục -->
                            <div class="col-sm-6 col-md-3">
                                <div class="form-group">
                                    <label>Category</label>
                                    <select class="form-control select" name="category">
                                        <option disabled selected>Chọn Danh Mục</option>
                                        <option value="cay-de-ban">Cây để bàn</option>
                                        <option value="cay-day-leo">Cây dây leo</option>
                                        <option value="cay-tet">Cây tết</option>
                                        <option value="cay-thuy-sinh">Cây thủy sinh</option>
                                        <option value="cay-trong-nha">Cây trong nhà</option>
                                        <option value="cay-ngoai-troi">Cây ngoài vườn</option>
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
                                        <th>ID</th>
                                        <th>Ảnh</th>
                                        <th>Tên sản phẩm</th>
                                        <th>Ngày nhập</th>
                                        <th>Giá bán</th>
                                        <th>Số lượng</th>
                                        <th>ID nhà cung cấp</th>
                                        <th class="text-right">Hành Động</th>
                                    </tr>
                                    </thead>

                                    <!-- Thêm vào nội dung ở đây -->
                                    <tbody>
                                    <c:forEach var="p" items="${product}">
                                        <c:set var="price" value="${p.price}"></c:set>
                                        <c:set var="date_created" value="${p.date_created}"></c:set>

                                        <tr>
                                            <td>${p.id}</td>
                                            <td><img class="rounded service-img mr-1"

                                                    <c:if test="${fn:startsWith(p.img, 'imgs')}"> src="../${p.img}"</c:if>
                                                    <c:if test="${fn:startsWith(p.img, 'http')}">src="${p.img}"</c:if>

                                                     alt="Hình ảnh danh mục"></td>
                                            <td>${p.name}</td>
                                            <td><%= Util.dateFormatNoTime((Date) pageContext.getAttribute("date_created"))%>
                                            </td>

                                            <td><%= Util.formatCurrency((double) pageContext.getAttribute("price"))%>
                                            </td>
                                            <td>${p.quantity}</td>

                                            <td>${p.supplier_id}</td>
                                            <td class="text-right">
                                                <a href="add-product?type=enterEdit&id=${p.id}"
                                                   class="btn btn-sm bg-success-light "> <i
                                                        class="far fa-edit mr-1"></i> Sửa</a>
<%--                                                <a href="edit-product.html" style="margin-top: 5px;color: red "--%>
<%--                                                   class="btn btn-outline-danger btn-sm"><i class="fa fa-trash-o"></i>--%>
<%--                                                    Xóa</a>--%>
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
