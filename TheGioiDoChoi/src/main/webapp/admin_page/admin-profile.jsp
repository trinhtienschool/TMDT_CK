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

    <!-- Page Wrapper -->
    <div class="page-wrapper">
        <div class="content container-fluid">

            <!-- Page Header -->
            <div class="page-header">
                <div class="row">
                    <div class="col">
                        <h3 class="page-title">Thông tin</h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                            <li class="breadcrumb-item active">Thông tin</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- /Page Header -->

            <div class="row">
                <div class="col-md-12">
                    <div class="profile-header">
                        <div class="row align-items-center">
                            <div class="col-auto profile-image">
                                <a href="#">
                                    <img class="rounded-circle" alt="User Image" src="${sessionScope.user_avatar}">
                                </a>
                            </div>
                            <div class="col ml-md-n2 profile-user-info">
                                <h4 class="user-name mb-0">${sessionScope.user_name}</h4>
                                <h6 class="text-muted">Thế Giới Cây Cảnh</h6>
                                <div class="user-Location"><i class="fa fa-map-marker"></i> ${sessionScope.district}
                                </div>
                            </div>
                            <div class="col-auto profile-btn">
                                <a href="edit-admin?type=enterEdit&id=${sessionScope.user_id}" class="btn btn-primary">
                                    Sửa
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="profile-menu">
                        <ul class="nav nav-tabs nav-tabs-solid">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#per_details_tab">Hồ sơ</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#password_tab">Mật khẩu</a>
                            </li>
                        </ul>
                    </div>
                    <div class="tab-content profile-tab-cont">

                        <!-- Personal Details Tab -->
                        <div class="tab-pane fade show active" id="per_details_tab">

                            <!-- Personal Details -->
                            <div class="row">
                                <div class="col-lg-9">
                                    <div class="card">
                                        <div class="card-body">
                                            <h5 class="card-title d-flex justify-content-between">
                                                <span>Chi tiết</span>
                                                <a class="edit-link" data-toggle="modal"
                                                   href="#edit_personal_details"><i class="fa fa-edit mr-1"></i>Sửa</a>
                                            </h5>
                                            <div class="row">
                                                <p class="col-sm-3 text-muted text-sm-right mb-0 mb-sm-3">Tên</p>
                                                <p class="col-sm-9">${sessionScope.user_name}</p>
                                            </div>
                                            <div class="row">
                                                <p class="col-sm-3 text-muted text-sm-right mb-0 mb-sm-3">Ngày sinh</p>
                                                <p class="col-sm-9">${sessionScope.user_birth}</p>
                                            </div>
                                            <div class="row">
                                                <p class="col-sm-3 text-muted text-sm-right mb-0 mb-sm-3">Địa chỉ
                                                    Email</p>
                                                <p class="col-sm-9">${sessionScope.user_mail}</p>
                                            </div>
                                            <div class="row">
                                                <p class="col-sm-3 text-muted text-sm-right mb-0 mb-sm-3">Điện thoại</p>
                                                <p class="col-sm-9">${sessionScope.user_phone}</p>
                                            </div>
                                            <div class="row">
                                                <p class="col-sm-3 text-muted text-sm-right mb-0">Địa chỉ</p>
                                                <p class="col-sm-9 mb-0">${sessionScope.detail},<br>
                                                    ${sessionScope.ward},<br>
                                                    ${sessionScope.district},<br>
                                                    ${sessionScope.city}.</p>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <div class="col-lg-3">

                                    <!-- Account Status -->
                                    <div class="card">
                                        <div class="card-body">
                                            <h5 class="card-title d-flex justify-content-between">
                                                <span>Trạng thái</span>
                                            </h5>
                                            <button class="btn btn-success" type="button"><i
                                                    class="fe fe-check-verified"></i> Hoạt động
                                            </button>
                                        </div>
                                    </div>
                                    <!-- /Account Status -->
                                </div>
                            </div>
                        </div>
                        <!-- /Personal Details Tab -->

                        <!-- Change Password Tab -->
                        <div id="password_tab" class="tab-pane fade">

                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">Đổi mật khẩu</h5>
                                    <div class="row">
                                        <div class="col-md-10 col-lg-6">
                                            <form id="formPass">
                                                <div class="form-group">
                                                    <label>Mật khẩu mới</label>
                                                    <input type="password" id="passwd" name="passwd"
                                                           class="validate[required,minSize[4],maxSize[32]] form-control input-sm">
                                                    <label id="mk-notice" class="invisible notice" style="color: red">Mật khẩu phải dài từ 8 - 25
                                                        kí tự và phải chứa cả số và chữ in hoa</label>
                                                </div>
                                                <div class="form-group">
                                                    <label>Xác nhận mật khẩu</label>
                                                    <input type="password" id="pass-again" name="pass-again"
                                                           class="validate[required,minSize[4],maxSize[32]] form-control input-sm">
                                                    <label id="mka-notice" class="invisible notice" style="color: red">Mật khẩu phải trùng khớp với
                                                        mật khẩu mới đã nhập</label>
                                                </div>
                                                <button class="btn btn-primary" type="submit">Lưu</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /Change Password Tab -->

                </div>
            </div>
        </div>

    </div>
</div>
<!-- /Page Wrapper -->

</div>

<!-- jQuery -->
<script src="assets/js/jquery-3.5.0.min.js"></script>

<!-- Bootstrap Core JS -->
<script src="assets/js/popper.min.js"></script>
<script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>

<!-- Datatables JS -->
<script src="assets/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="assets/plugins/datatables/datatables.min.js"></script>

<!-- Select2 JS -->
<script src="assets/js/select2.min.js"></script>

<!-- Custom JS -->
<script src="assets/js/admin.js"></script>

</body>

</html>