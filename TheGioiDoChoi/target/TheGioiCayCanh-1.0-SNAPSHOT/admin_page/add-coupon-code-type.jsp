<%--
  Created by IntelliJ IDEA.
  User: Trinh Quang Tien
  Date: 24/01/2021
  Time: 1:20
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
    <title>${title}</title>
    <link href="assets/img/icon/icon-logo.png" rel="shortcut icon">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css">

    <!-- Fontawesome CSS -->
    <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
    <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">

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
                        <h3 class="page-title">${title}</h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="coupon-code-type.html">Loại mã giảm giá</a></li>
                            <li class="breadcrumb-item active">${title}</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- /Page Header -->
            <div class="card">
                <div class="card-body">

                    <!-- Form -->
                    <form action="add-coupon-code-type" accept-charset="UTF-8" enctype="multipart/form-data" method="post">
                        <c:if test="${type=='add'}">
                            <div class="form-group" style="display: none">
                                <input class="form-control" type="text" value="add" name="type" >
                            </div>
                            <div class="form-group">
                                <label>Tên</label>
                                <input class="form-control" type="text" value="" name="name" required>
                            </div>
                            <div class="form-group">
                                <label>Chọn ảnh</label>
                                <input class="form-control" type="file" name="img" required>
                            </div>
                            <div class="mt-4">
                                <button class="btn btn-primary" type="submit">Lưu thay đổi</button>
                                <a href="coupon-code-type" class="btn btn-link">Hủy</a>
                            </div>
                        </c:if>
                        <c:if test="${type=='edit'}">
                            <div class="form-group" style="display: none">
                                <input class="form-control" type="text" value="edit" name="type">
                            </div>
                            <div class="form-group">
                                <label>ID</label>
                                <input class="form-control" type="text" value="${cct.id}" name="id" readonly>
                            </div>
                            <div class="form-group">
                                <label>Tên</label>
                                <input class="form-control" type="text" value="${cct.name}" name="name" required>
                            </div>
                            <div class="form-group">
                                <label>Chọn ảnh</label>
                                <input class="form-control" type="file" name="img">
                            </div>
                            <div class="form-group">
                                <div class="avatar">
                                    <img class="avatar-img rounded" alt="" src="../${cct.avatar}">
                                </div>
                            </div>
                            <div class="mt-4">
                                <button class="btn btn-primary" type="submit">Lưu thay đổi</button>
                                <a href="coupon-code-type" class="btn btn-link">Hủy</a>
                            </div>
                        </c:if>
                    </form>
                    <!-- /Form -->

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

<!-- Custom JS -->
<script src="assets/js/admin.js"></script>

</body>

</html>
