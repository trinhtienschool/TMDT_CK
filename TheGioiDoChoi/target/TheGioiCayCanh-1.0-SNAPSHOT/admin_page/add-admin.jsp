<%--
  Created by IntelliJ IDEA.
  User: Trinh Quang Tien
  Date: 24/01/2021
  Time: 16:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="vn.thegioicaycanh.model.util.Util" %>
<%@ page import="java.util.Date" %>
<%@ page import="vn.thegioicaycanh.model.Product.Product" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                                    <li class="breadcrumb-item"><a href="admin-list.html">Danh sách admin</a></li>
                                    <li class="breadcrumb-item active">${title}</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- /Page Header -->

                    <div class="card">
                        <div class="card-body">

                            <!-- Form -->
                            <form action="add-admin" method="post" accept-charset="UTF-8" id="login-form">
                                <c:if test="${type=='add'}">
                                    <div class="form-group" style="display: none">
                                        <input class="form-control" type="text" value="add" name="type">
                                    </div>

                                    <div class="form-group row">
                                        <label class="col-form-label col-md-2">Tên</label>
                                        <div class="col-md-10">
                                            <input type="text" class="form-control" name="name" required>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-form-label col-md-2">Email</label>
                                        <div class="col-md-10">
                                            <input type="email" class="form-control" name="email">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-form-label col-md-2">Mật khẩu</label>
                                        <div class="col-md-10">
                                            <input id="pass" type="password" required class="form-control" name="pass">
                                            <label style="color: red" id="pw-notice">Mật khẩu phải dài từ 8 kí tự và chứa cả chữ in hoa và số</label>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-form-label col-md-2">Điện thoại</label>
                                        <div class="col-md-10">
                                            <input type="tel" class="form-control" name="phone" required>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label class="col-form-label col-md-2">Giới tính</label>
                                        <div class="col-md-10">
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="sex" value="1" checked> Nam
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="sex" value="0"> Nữ
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-form-label col-md-2">Ngày sinh</label>
                                        <div class="col-md-10">
                                            <input class="form-control" type="date" value="" name="birthday" required>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-form-label col-md-2">Địa chỉ</label>
                                        <div class="col-md-10">
                                            <input type="text" class="form-control" name="address" required>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-form-label col-md-2">Quyền</label><br>
                                        <div class="col-md-10">
                                            <select class="form-control select" name="role_id" required>
                                                <option disabled>Chọn quyền</option>
                                                <option value="1">Người dùng</option>
                                                <option value="2">Admin</option>
                                                <option value="3">Tối cao</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="status-toggle">
                                        <label>Kích hoạt</label>
                                        <input id="rating_2" class="check" name="active" value="true" type="checkbox"
                                               checked>
                                        <label for="rating_2" class="checktoggle">checkbox</label>
                                    </div>
                                    <div class="mt-4">
                                        <button class="btn btn-primary" type="submit">Lưu</button>
                                        <a href="list-admin" class="btn btn-link">Hủy</a>
                                    </div>
                                </c:if>
                                <c:if test="${type=='edit'}">
                                    <div class="form-group" style="display: none">
                                        <input class="form-control" type="text" value="edit" name="type" >
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-form-label col-md-2">ID</label>
                                        <div class="col-md-10">
                                            <input type="text" class="form-control" name="id" value="${user.id}"
                                                   readonly>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-form-label col-md-2">Tên</label>
                                        <div class="col-md-10">
                                            <input type="text" class="form-control" required name="name" value="${user.name}">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-form-label col-md-2">Email</label>
                                        <div class="col-md-10">
                                            <input type="email"  required class="form-control" name="email" value="${user.email}">
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label class="col-form-label col-md-2">Điện thoại</label>
                                        <div class="col-md-10">
                                            <input type="tel" class="form-control" name="phone" required
                                                   value="${user.phone}">
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label class="col-form-label col-md-2">Giới tính</label>
                                        <div class="col-md-10">
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="sex" value="1"
                                                    <c:if test="${user.sex=='Nam'}"> checked</c:if>
                                                    > Nam
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="sex" value="0"
                                                    <c:if test="${user.sex=='Nữ'}"> checked</c:if>
                                                    > Nữ
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <c:set var="birthday" value="${user.birthday}"></c:set>
                                    <div class="form-group row">
                                        <label class="col-form-label col-md-2">Ngày sinh</label>
                                        <div class="col-md-10">
                                            <input class="form-control" type="date"
                                                   value="<%=Util.dateFormatNoTime((Date)pageContext.getAttribute("birthday"))%>"
                                                   name="birthday" required>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-form-label col-md-2">Địa chỉ</label>
                                        <div class="col-md-10">
                                            <input type="text" class="form-control" name="address"
                                                   value="${user.address}" required>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-form-label col-md-2">Quyền</label><br>
                                        <div class="col-md-10">
                                            <select class="form-control select" name="role_id" required>
                                                <option disabled>Chọn quyền</option>
                                                <option value="1" <c:if test="${user.role_id==1}">selected</c:if>>Người
                                                    dùng
                                                </option>
                                                <option value="2" <c:if test="${user.role_id==2}">selected</c:if>>
                                                    Admin
                                                </option>
                                                <option value="3" <c:if test="${user.role_id==3}">selected</c:if>>Tối
                                                    cao
                                                </option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="status-toggle">
                                        <label class="col-form-label col-md-2">Kích hoạt</label>
                                        <div class="col-md-10">
                                            <input id="rating_2" class="check" name="active" value="true"
                                                   type="checkbox"
                                                   <c:if test="${user.active}">checked</c:if>>
                                            <label for="rating_2" class="checktoggle">checkbox</label>
                                        </div>
                                    </div>
                                    <div class="mt-4">
                                        <button class="btn btn-primary" type="submit">Lưu</button>
                                        <a href="list-admin" class="btn btn-link">Hủy</a>
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

<!-- Custom JS -->
<script src="assets/js/admin.js"></script>

</body>

</html>
