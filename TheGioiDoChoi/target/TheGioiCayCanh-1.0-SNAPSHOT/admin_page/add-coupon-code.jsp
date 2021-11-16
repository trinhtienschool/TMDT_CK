<%@ page import="vn.thegioicaycanh.model.util.Util" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: TRAN NHAT THY
  Date: 24/01/2021
  Time: 2:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
            <div class="row">
                <div class="col-xl-8 offset-xl-2">

                    <!-- Page Header -->
                    <div class="page-header">
                        <div class="row">
                            <div class="col">
                                <h3 class="page-title">${title}</h3>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="coupon-code.html">Mã giảm giá</a></li>
                                    <li class="breadcrumb-item active">${title}</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- /Page Header -->

                    <div class="card">
                        <div class="card-body">

                            <!-- Form -->
                            <form action="add-coupon-code" method="post" accept-charset="UTF-8">
                                <c:if test="${type=='add'}">
                                    <div class="form-group" style="display: none">
                                        <input class="form-control" type="text" value="add" name="type">
                                    </div>
                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Tên</label>
                                    <div class="col-md-10">
                                        <input type="text" class="form-control" name="name">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Loại mã</label>
                                    <div class="col-md-10">
                                        <select class="form-control" name="coupon_code_type_id">
                                            <option value="1">Giảm giá</option>
                                            <option value="2">Miễn phí vận chuyển</option>
                                            <option value="3">Giảm giá momo</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Mã code</label>
                                    <div class="col-md-10">
                                        <input type="text" class="form-control" name="code">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Phần trăm khuyến mãi</label>
                                    <div class="col-md-10">
                                        <input type="number" class="form-control" name="percent">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Ngày bắt đầu</label>
                                    <div class="col-md-10">
                                        <input type="date" class="form-control" name="date_start">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Ngày kết thúc</label>
                                    <div class="col-md-10">
                                        <input type="date" class="form-control" name="date_end">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Mô tả</label>
                                    <div class="col-md-10">
                                        <textarea rows="5" cols="5" class="form-control" placeholder="Mô tả ..." name="description"></textarea>
                                    </div>
                                </div>
                                <div class="mt-4">
                                    <button class="btn btn-primary" type="submit">Lưu</button>
                                    <a href="coupon_code" class="btn btn-link">Hủy</a>
                                </div>
                                </c:if>
                                <c:if test="${type=='edit'}">
                                    <c:set var="date_start" value="${couponcode.date_start}"></c:set>
                                    <c:set var="date_end" value="${couponcode.date_end}"></c:set>
                                    <div class="form-group" style="display: none">
                                        <input class="form-control" type="text" value="edit" name="type">
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-form-label col-md-2">ID</label>
                                        <div class="col-md-10">
                                            <input type="text" class="form-control" name="id" value="${couponcode.id}" readonly>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-form-label col-md-2">Tên</label>
                                        <div class="col-md-10">
                                            <input type="text" class="form-control" name="name" value="${couponcode.name}">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-form-label col-md-2">Loại mã</label>
                                        <div class="col-md-10">
                                            <select class="form-control" name="coupon_code_type_id">
                                                <option value="1" <c:if test="${couponcode.coupon_code_type_id==1}">selected</c:if>>Giảm giá</option>
                                                <option value="2" <c:if test="${couponcode.coupon_code_type_id==2}">selected</c:if>>Miễn phí vận chuyển</option>
                                                <option value="3" <c:if test="${couponcode.coupon_code_type_id==3}">selected</c:if>>Giảm giá momo</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-form-label col-md-2">Mã code</label>
                                        <div class="col-md-10">
                                            <input type="text" class="form-control" name="code" value="${couponcode.code}">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-form-label col-md-2">Phần trăm khuyến mãi</label>
                                        <div class="col-md-10">
                                            <input type="number" class="form-control" name="percent" value="${couponcode.percent}">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-form-label col-md-2">Ngày bắt đầu</label>
                                        <div class="col-md-10">
                                            <input type="date" class="form-control" name="date_start"
                                                   value="<%=Util.dateFormatNoTime((Date) pageContext.getAttribute("date_start"))%>">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-form-label col-md-2">Ngày kết thúc</label>
                                        <div class="col-md-10">
                                            <input type="date" class="form-control" name="date_end"
                                                   value="<%=Util.dateFormatNoTime((Date) pageContext.getAttribute("date_end"))%>">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-form-label col-md-2">Mô tả</label>
                                        <div class="col-md-10">
                                            <textarea rows="5" cols="5" class="form-control" placeholder="Mô tả ..." name="description">${couponcode.description}</textarea>
                                        </div>
                                    </div>
                                    <div class="mt-4">
                                        <button class="btn btn-primary" type="submit">Lưu</button>
                                        <a href="coupon_code" class="btn btn-link">Hủy</a>
                                    </div>
                                </c:if>
                            </form>
                            <!-- /Form -->

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

<!-- Slimscroll JS -->
<script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<!-- Custom JS -->
<script src="assets/js/admin.js"></script>

</body>

</html>
