<%@ page import="java.util.Date" %>
<%@ page import="vn.thegioicaycanh.model.util.Util" %>
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
                    <!-- Page Header -->
                    <div class="page-header">
                        <div class="row">
                            <div class="col">
                                <h3 class="page-title">${title}</h3>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="categories.html">Người dùng</a></li>
                                    <li class="breadcrumb-item active">${title}</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- /Page Header -->
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Thông tin người dùng</h4>
                                </div>
                                <div class="card-body">
                                    <form action="edit_user" method="post"
                                          accept-charset="UTF-8">
                                        <c:set var="bd" value="${user.getBirthday()}"></c:set>
                                        <c:set var="createddate" value="${user.date_created}"></c:set>
                                        <div class="form-group" style="display: none">
                                            <input class="form-control" type="text" value="edit" name="type">
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-form-label col-md-2">Email</label>
                                            <div class="col-md-10">
                                                <input type="email" class="form-control" name="email" value="${user.email}"  required>
                                            </div>
                                        </div>
                                        <div class="form-group row" style="display: none" >
                                            <label class="col-form-label col-md-2">Password</label>
                                            <div class="col-md-10" >
                                                <input type="password" class="form-control" name="password" value="${user.password}"  required>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-form-label col-md-2">Mã người dùng</label>
                                            <div class="col-md-10">
                                                <input type="text" class="form-control" name="usercode" value="${user.id}" readonly>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-form-label col-md-2">Tên</label>
                                            <div class="col-md-10">
                                                <input type="text" class="form-control" name="name" value="${user.name}" >
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-form-label col-md-2">Giới tính</label>
                                            <div class="col-md-10">
                                                <div class="radio">
                                                    <label>
                                                        <input type="radio" name="sex" value="Nam"  <c:if test="${user.isMan()}">checked</c:if>> Nam
                                                    </label>
                                                </div>
                                                <div class="radio">
                                                    <label>
                                                        <input type="radio" name="sex" value="Nữ"  <c:if test="${!user.isMan()}">checked</c:if>> Nữ
                                                    </label>
                                                </div>
<%--                                                <div class="radio">--%>
<%--                                                    <label>--%>
<%--                                                        <input type="radio" name="radio"> Khác--%>
<%--                                                    </label>--%>
<%--                                                </div>--%>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-form-label col-md-2">Ngày sinh</label>
                                            <div class=" col-md-10">
                                                <input class="form-control " type="date" name="birthday"
                                                value="<%=Util.dateFormatNoTime((Date) pageContext.getAttribute("bd"))%>">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-form-label col-md-2">Địa chỉ</label>
                                            <div class="col-md-10">
                                                <input type="text" class="form-control" name="address" value="${user.address}">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-form-label col-md-2">Ngày tạo</label>
                                            <div class=" col-md-10">
                                                <input class="form-control" type="date" name="createddate"
                                                 value="<%=Util.dateFormatNoTime((Date) pageContext.getAttribute("createddate"))%>">
                                            </div>

                                        </div>
                                        <div class="mt-4">
                                            <button class="btn btn-primary" type="submit">Cập Nhật</button>
                                            <a href="users" class="btn btn-link">Hủy</a>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Danh sách giỏ hàng</h4>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-hover table-center mb-0 datatable">
                                            <thead>
                                            <tr>
                                                <th>Id</th>
                                                <th>Tên sản phẩm</th>
                                                <th>Ngày thêm</th>
                                                <th>Số lượng</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${productadd}" var="pa">
                                            <tr>
                                                <td>${pa.id}</td>
                                                <td>${pa.name_product}</td>
                                                <td>${pa.date_created}</td>
                                                <td>${pa.number_product}</td>
                                            </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Danh sách yêu thích</h4>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-hover table-center mb-0 datatable">
                                            <thead>
                                            <tr>
                                                <th>Id</th>
                                                <th>Tên sản phẩm</th>
<%--                                                <th>Ngày thêm</th>--%>

                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${favproduct}" var="pr">
                                            <tr>
                                                <td>${pr.id}</td>
                                                <td>${pr.name}</td>
<%--                                                <td>${pr.date_created}</td>--%>

                                            </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Danh sách đặt hàng</h4>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-hover table-center mb-0 datatable">
                                            <thead>
                                            <tr>
                                                <th>Id</th>
                                                <th>Tên sản phẩm</th>
                                                <th>Trạng thái</th>
                                                <th>Tổng tiền</th>
<%--                                                <th>Phương thức thanh toán</th>--%>
                                                <th>Ngày tạo</th>
                                                <th class="text-right">Xem chi tiết</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${ordproduct}" var="op">
                                            <tr>
                                                <td>${op.id}</td>
                                                <td>${op.name_product}</td>
                                                <td>
                                                    <c:if test="${op.status==1}"><span
                                                            class="badge badge-danger">Đã hủy</span></c:if>
                                                    <c:if test="${op.status==2}"><span
                                                            class="badge badge-warning">Bị từ chối</span></c:if>
                                                    <c:if test="${op.status==3}"><span
                                                            class="badge badge-dark">Đang xử lí</span></c:if>
                                                    <c:if test="${op.status==4}"><span class="badge badge-primary">Đang đóng gói</span></c:if>
                                                    <c:if test="${op.status==5}"><span class="badge badge-info">Đang vận chuyển</span></c:if>
                                                    <c:if test="${op.status==6}"><span
                                                            class="badge badge-success">Hoàn thành</span></c:if>
                                                </td>

                                                <td>${op.name_product}</td>
<%--                                                <td>Tiền mặt</td>--%>
                                                <td>${op.date_created}</td>
                                                <td class="text-right">
                                                    <a href="view_order?id=${op.id}" class="btn btn-sm bg-success-light mr-2">	<i class="far fa-edit mr-1"></i> Chi tiết</a>
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

<!-- Custom JS -->
<script src="assets/js/admin.js"></script>

</body>

</html>