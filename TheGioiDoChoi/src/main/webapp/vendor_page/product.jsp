<%@ page import="vn.thegioidochoi.model.util.Util" %>
<%@ page import="java.util.Date" %>
<%@ page import="vn.thegioidochoi.model.Product.Product" %>
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
                            <div class="col-sm-12 col-md-3">
                                <div class="form-group">
                                    <label>Mã sản phẩm</label>
                                    <input class="form-control" type="text" name="product-id">
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-3">
                                <div class="form-group">
                                    <label>Tên sản phẩm</label>
                                    <input class="form-control" type="text" name="product-name">
                                </div>
                            </div>
                            <!-- Thay đổi theo danh sách đề mục -->

                            <div class="col-sm-12 col-md-3">
                                <div class="form-group">
                                    <label>Danh mục</label>
                                    <select class="form-control select2" style="width: 100%" name="category">
                                        <option value="%">Tất cả</option>
                                        <c:forEach var="cate" items="${applicationScope.category}">
                                            <c:if test="${cate.master_id == cate.id && cate.parent==0 }">

                                                <option value="${cate.id}">${cate.name}</option>
                                            </c:if>
                                            <c:if test="${cate.master_id == cate.id && cate.parent==1 }">
                                                <optgroup label="${cate.name}">
                                                    <c:forEach var="subcate" items="${cate.subcategories}">
                                                        <option value="${subcate.id}">${subcate.name}</option>
                                                    </c:forEach>
                                                </optgroup>
                                            </c:if>

                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-3">
                                <div class="form-group">
                                    <label>Từ Ngày</label>
                                    <div class="cal-icon">
                                        <input class="form-control datetimepicker" type="text" name="from-date">
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-3">
                                <div class="form-group">
                                    <label>Đến Ngày</label>
                                    <div class="cal-icon">
                                        <input class="form-control datetimepicker" type="text" name="to-date">
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-3">
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
                                        <th>Danh mục</th>
                                        <th>Giá bán</th>
                                        <th>Số lượng</th>

                                        <th>Ngày tạo</th>
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
                                            <td>
                                                <c:forEach var="cate" items="${applicationScope.category}">
                                                    <c:if test="${cate.master_id == cate.id && cate.parent==1 }">
                                                        <c:forEach var="subcate" items="${cate.subcategories}">
                                                            <c:if test="${subcate.id == p.category_id}">${subcate.name}</c:if>
                                                        </c:forEach>
                                                    </c:if>

                                                </c:forEach>
                                            </td>

                                            <td><%= Util.formatCurrency((double) pageContext.getAttribute("price"))%>
                                            </td>
                                            <td>${p.quantity}</td>


                                            <td><%= Util.dateFormatNoTime((Date) pageContext.getAttribute("date_created"))%>
                                            <td class="text-right">
                                                <a href="../shop-detail?product=${p.slug}"
                                                   class="btn btn-sm bg-info-light">
                                                    <i class="far fa-eye mr-1"></i> Xem
                                                </a>
                                                <a href="add-product?type=enterEdit&id=${p.id}"
                                                   class="btn btn-sm bg-success-light "> <i
                                                        class="far fa-edit mr-1"></i> Sửa</a>
                                                    <%--                                                <a href="edit-product.html" style="margin-top: 5px;color: red "--%>
                                                    <%--                                                   class="btn btn-outline-danger btn-sm"><i class="fa fa-trash-o"></i>--%>
                                                    <%--                                                    Xóa</a>--%>
                                                <button id="delete-product-button" data-product="${p.id}" type="button" class="btn btn-outline-danger btn-sm"><i
                                                        class="fa fa-trash-o"
                                                        ></i> Xóa
                                                </button>

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
<div class="modal fade" id="wrong_info_login" tabindex="-1" role="dialog" aria-hidden="true">
    <form method="post" action="add-product">
        <div class="modal-dialog forget-dialog" role="document">
            <div class="modal-content forget-content">
                <div class="modal-header forget-header">
                    <h5 class="modal-title forget-title">Thông báo</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="x">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body forget-body">
                    <!-- <h5 class="forget-h5">Vui lòng nhập Email bạn đã đăng kí để lấy lại mật khẩu</h5> -->
                    <div>
                        <p>Bạn có chắc chắn muốn xóa?</p>
                    </div>
                </div>
                <input type="hidden" name="type" value="delete">
                <input type="hidden" name="pro-id" id="pro-id">
                <div class="modal-footer">
                    <button id="delete-product-announcement" type="submit" class="btn btn-primary "
                           >Xóa
                    </button>
                </div>
            </div>
        </div>
    </form>
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
<script>
    $('.select2').select2({
        width: 'resolve' // need to override the changed default
    });
</script>
</body>
</html>
