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

    <!-- Favicons -->
    <link rel="shortcut icon" href="assets/img/favicon.png">

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
                                    <li class="breadcrumb-item"><a href="admin-profile.html">Thông tin cá nhân</a></li>
                                    <li class="breadcrumb-item active">${title}</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- /Page Header -->

                    <div class="card">
                        <div class="card-body">
                            <!-- Form -->
                            <form action="edit-admin" method="post" enctype="multipart/form-data"
                                  accept-charset="UTF-8">
                                <c:if test="${type=='edit'}">
                                    <div class="form-group" style="display: none">
                                        <input class="form-control" type="text" value="edit" name="type">
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-form-label col-md-2">Họ tên</label>
                                        <div class="col-md-10">
                                            <input type="text" class="form-control" name="name" value="${user.name}">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-form-label col-md-2">Ảnh</label>
                                        <div class="col-md-10">
                                            <input class="form-control" type="file" name="img"
                                                   value="${user.avatar}">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-form-label col-md-2">Nơi làm việc</label>
                                        <div class="col-md-10">
                                            <input type="text" class="form-control" value="Thế Giới Cây Cảnh" disabled>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-form-label col-md-2">Ngày sinh</label>
                                        <div class="col-md-10">
                                            <input type="text" class="form-control" name="birthdate" value="${user.birthday}">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-form-label col-md-2">Địa chỉ Email</label>
                                        <div class="col-md-10">
                                            <input type="email" class="form-control" name="email"
                                                   value="${user.email}">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-form-label col-md-2">Điện thoại</label>
                                        <div class="col-md-10">
                                            <input type="text"
                                                   value="+84 ${user.phone}" name="phone"
                                                   class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <h5 class="form-title"><span>Địa chỉ</span></h5>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-form-label col-md-2">Số nhà</label>
                                        <div class="col-md-10">
                                            <input type="text" class="form-control" name="detail"
                                                   value="${sessionScope.detail}">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-form-label col-md-2">Phường/ Xã</label>
                                        <div class="col-md-10">
                                            <input type="text" class="form-control" name="ward"
                                                   value="${sessionScope.ward}">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-form-label col-md-2">Quận/ Huyện</label>
                                        <div class="col-md-10">
                                            <input type="text" class="form-control" name="district"
                                                   value="${sessionScope.district}">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-form-label col-md-2">Tỉnh/ Thành phố</label>
                                        <div class="col-md-10">
                                            <input type="text" class="form-control" name="city"
                                                   value="${sessionScope.city}">
                                        </div>
                                    </div>
                                    <div class="mt-4">
                                        <button class="btn btn-primary" type="submit">Lưu</button>
                                        <a href="admin-profile.html" class="btn btn-link">Hủy</a>
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