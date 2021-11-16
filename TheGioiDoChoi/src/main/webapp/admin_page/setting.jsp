<%@ page import="vn.thegioicaycanh.model.header_footer.Header" %><%--
  Created by IntelliJ IDEA.
  User: Trinh Quang Tien
  Date: 25/01/2021
  Time: 0:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi-VN">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <title>Thiết lập</title>
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
            <!-- Page Header -->
            <div class="page-header">
                <div class="row">
                    <div class="col-12">
                        <h3 class="page-title">Thiết lập chung</h3>
                    </div>
                </div>
            </div>
            <!-- /Page Header -->

            <ul class="nav nav-tabs menu-tabs">
                <ul class="nav nav-tabs menu-tabs">
                    <li class="nav-item active">
                        <a class="nav-link">Thiết lập chung</a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="setting-address">Địa chỉ</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="term-and-condition">Điều khoản điều kiện</a>
                    </li>

                </ul>

            </ul>

            <div class="row">
                <div class="col-xl-8 col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <!-- Form -->
                            <form action="setting" method="post" enctype="multipart/form-data">
                                <div class="mt-3">
                                    <div class="form-group">
                                        <label>Tên website</label>

                                        <input type="text" class="form-control" name="name"
                                               value="${applicationScope.header.name}">
                                    </div>
                                    <div class="form-group">
                                        <label>Website Logo</label>
                                        <div class="uploader">
                                            <input type="file" class="form-control" name="logo"/>
                                        </div>

                                        <img src="../${applicationScope.header.logo}" class="site-logo" alt=""/>
                                    </div>
                                    <div class="form-group">
                                        <label>Shortcut icon</label>
                                        <div class="uploader">
                                            <input type="file" class="form-control" name="shortcut"/>
                                        </div>

                                        <img src="../${applicationScope.header.shortcut}" class="fav-icon" alt=""/>
                                    </div>

                                    <div class="form-group">
                                        <label>Facebook</label>
                                        <input type="text" class="form-control" name="fb"
                                               value="${applicationScope.social_media.fb}">
                                    </div>
                                    <div class="form-group">
                                        <label>Twitter</label>
                                        <input type="text" class="form-control" name="tw"
                                               value="${applicationScope.social_media.tw}">
                                    </div>
                                    <div class="form-group">
                                        <label>Instagram</label>
                                        <input type="text" class="form-control" name="in"
                                               value="${applicationScope.social_media.in}">
                                    </div>
                                    <div class="form-group">
                                        <label>Instagram</label>
                                        <input type="text" class="form-control" name="pi"
                                               value="${applicationScope.social_media.pi}">
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-primary">
                                            Lưu thay đổi
                                        </button>
                                    </div>
                                </div>
                            </form>
                            <!-- /Form -->

                        </div>
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

<!-- Slimscroll JS -->
<script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<!-- Custom JS -->
<script src="assets/js/admin.js"></script>

</body>

</html>