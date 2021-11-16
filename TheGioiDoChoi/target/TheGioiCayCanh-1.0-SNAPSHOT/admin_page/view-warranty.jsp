<%--
  Created by IntelliJ IDEA.
  User: Trinh Quang Tien
  Date: 24/01/2021
  Time: 10:15
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
    <title>Sửa bảo hành</title>
    <link href="assets/img/icon/icon-logo.png" rel="shortcut icon">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css">

    <!-- Fontawesome CSS -->
    <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
    <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">

    <!-- Select CSS -->
    <link rel="stylesheet" href="assets/css/select2.min.css">
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
                        <h3 class="page-title">Sửa bảo hành</h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="return-request.html">Bảo hành</a></li>
                            <li class="breadcrumb-item active">Sửa bảo hành</li>
                        </ul>
                    </div>

                </div>
            </div>
            <!-- /Page Header -->



            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="table-responsive">
                                <!-- <table class="table table-hover table-center mb-0 datatable"> -->
                                <!-- Thay đổi code ở đây Thay đổi theo file word -->
                                <!-- Form -->
                                <form action="edit-warranty" method="post">

                                    <c:set var="date_created" value="${warranty.date_created}"></c:set>
                                    <div class="form-group" style="display:none;">

                                        <input class="form-control" type="text" value="${type}" readonly name="type">
                                    </div>
                                    <div class="form-group">
                                        <label>ID hoàn trả</label>
                                        <input class="form-control" type="text" value="${warranty.id}" readonly name="id">
                                    </div>
                                    <div class="form-group">
                                        <label>ID order</label>
                                        <input class="form-control" type="text" value="${warranty.order_id}" disabled>
                                    </div>
                                    <div class="form-group">
                                        <label>ID khách hàng</label>
                                        <input class="form-control" type="text" value="${warranty.user_id}" disabled>
                                    </div>
                                    <div class="form-group">
                                        <label>Tên khách hàng</label>
                                        <input class="form-control" type="text" value="${warranty.user_name}" disabled>
                                    </div>
                                    <div class="form-group">
                                        <label>Email liên hệ</label>
                                        <input class="form-control" type="text" value="${warranty.email}" disabled>
                                    </div>
                                    <div class="form-group">
                                        <label>ID sản phẩm</label>
                                        <input class="form-control" type="text" value="${warranty.pro_id}" disabled>
                                    </div>
                                    <div class="form-group">
                                        <label>Tên sản phẩm</label>
                                        <input class="form-control" type="text" value="${warranty.product_name}"disabled>
                                    </div>
                                    <div class="form-group">
                                        <label>Trạng thái hoàn trả</label><br>
                                        <select class="form-control select" name="status" required>
                                            <option disabled>Chọn Danh Mục</option>
                                            <option value="1" <c:if test="${warranty.status==1}">selected</c:if>>Chờ xử lí</option>
                                            <option value="2" <c:if test="${warranty.status==2}">selected</c:if>>Đã xử lí</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Ngày nhận tin</label>
                                        <input class="form-control" type="date" value="<%=Util.dateFormatNoTime((Date) pageContext.getAttribute("date_created"))%>" disabled>
                                    </div>
                                    <div class="form-group">
                                        <div class="avatar">
                                            <img class="avatar-img rounded" alt="" src="../${warranty.img}">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>Mô tả</label>
                                        <textarea disabled style="height: 100px;" class="form-control" type="text">${warranty.message}</textarea>
                                    </div>
                                    <div class="mt-4">
                                        <button class="btn btn-primary" type="submit">Lưu thay đổi</button>
                                        <a href="warranty" class="btn btn-link">Hủy</a>
                                    </div>
                                </form>
                                <!-- /Form -->
                                <!-- Thêm vào nội dung ở đây -->
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

<!-- Select2 JS -->
<script src="assets/js/select2.min.js"></script>

<!-- Custom JS -->
<script src="assets/js/admin.js"></script>

</body>

</html>

