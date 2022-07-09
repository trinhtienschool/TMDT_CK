<%--
  User: TRAN NHAT THY
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>${title}</title>
    <link href="assets/img/icon/icon-logo.png" rel="shortcut icon">
    <link rel="shortcut icon" href="../imgs/header/toy-shortcut.png">
    <link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
    <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/animate.min.css">
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
                        <div class="col-9">
                            <h3 class="page-title">Thiết lập người bán</h3>
                        </div>
                        <div class="col-3">
                            <a href="#">XEM CỬA HÀNG <i class="fa fa-arrow-right" aria-hidden="true"></i></a>

                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12">
                        <div class="card">
                            <div class="card-body p-0">
                                <form action="setting" method="post" enctype="multipart/form-data">
                                    <div class="tab-content pt-0">
                                        <!-- General Settings -->
                                        <div id="general" class="tab-pane active">
                                            <div class="card mb-0">
                                                <div class="card-header">
                                                    <h4 class="card-title">Thiết lập chung</h4>
                                                </div>
                                                <div class="card-body">
                                                    <div class="form-group">
                                                        <label>Tên cửa hàng</label>
                                                        <input type="text" class="form-control" name="name"
                                                               value="${supplier.name}">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Công ty</label>
                                                        <input type="text" class="form-control" name="company"
                                                               value="${supplier.company_name}">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Website</label>
                                                        <input type="text" class="form-control" name="website"
                                                                value="${supplier.website}">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Điện thoại</label>
                                                        <input type="number" class="form-control" name="phone"
                                                                value="0${supplier.phone}">
                                                    </div>
<%--                                                    <div class="form-group">--%>
<%--                                                        <label>Địa chỉ</label>--%>
<%--                                                        <div class="row">--%>
<%--                                                            <div class="col-lg-3 col-md-6 col-sm-12">--%>
<%--                                                                <input type="text" class="form-control" placeholder="Tỉnh/Thành phố" name="city"--%>
<%--                                                                            value="${sessionScope.city}">--%>
<%--                                                            </div>--%>
<%--                                                            <div class="col-lg-3 col-md-6 col-sm-12">--%>
<%--                                                                <input type="text" class="form-control" placeholder="Quận/Huyện" name="district"--%>
<%--                                                                            value="${sessionScope.district}">--%>
<%--                                                            </div>--%>
<%--                                                            <div class="col-lg-3 col-md-6 col-sm-12">--%>
<%--                                                                <input type="text" class="form-control" placeholder="Phường/Xã" name="ward"--%>
<%--                                                                            value="${sessionScope.ward}">--%>
<%--                                                            </div>--%>
<%--                                                            <div class="col-lg-3 col-md-6 col-sm-12">--%>
<%--                                                                <input type="text" class="form-control" placeholder="Chi tiết" name="detail"--%>
<%--                                                                            value="${sessionScope.detail}">--%>
<%--                                                            </div>--%>
<%--                                                        </div>--%>
<%--                                                    </div>--%>
                                                    <div class="form-group">
                                                        <label>Ảnh đại diện</label>
                                                        <div class="uploader">
                                                            <input type="file" class="form-control" name="logo"/>
                                                        </div>

                                                        <img src="../${supplier.logo}" class="site-logo" alt=""/>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Mô tả cửa hàng</label>
                                                        <textarea name="content" id="content" style="width: 100%; height: 150px" required>
                                                            ${supplier.description}
                                                        </textarea>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="card-body pt-0">
                                            <button type="submit" class="btn btn-primary">Lưu</button>
                                            <button class="btn btn-outline-primary">Hủy</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <script src="assets/js/jquery-3.5.0.min.js"></script>
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="assets/js/admin.js"></script>
</body>
</html>
