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

    <!-- Datatables CSS -->
    <link rel="stylesheet" href="assets/plugins/datatables/datatables.min.css">

    <!-- Datepicker CSS -->
    <link rel="stylesheet" href="assets/css/bootstrap-datetimepicker.min.css">

    <!-- Animate CSS -->
    <link rel="stylesheet" href="assets/css/animate.min.css">

    <!-- Main CSS -->
    <link rel="stylesheet" href="assets/css/admin.css">
    <script src="assets/js/tinymce/tinymce.min.js"></script>
    <script src="assets/js/tinymce.js"></script>

</head>

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
                            <li class="breadcrumb-item"><a href="total-report.html">Đanh sách đơn đặt hàng</a></li>
                            <li class="breadcrumb-item active">${title}</li>
                        </ul>
                    </div>

                </div>
            </div>
            <!-- /Page Header -->

            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header" data-toggle="collapse" data-target="#gener-info" role="button"
                             aria-expanded="false" aria-controls="gener-info">
                            <h4 class="card-title">Thông tin chung</h4>
                        </div>
                        <div class="collapse card-body" id="gener-info">
                            <form action="view_order" method="post">

                                <div class="form-group row" style="display: none">
                                    <input class="form-control" type="text" value="${view_order.id}" name="id">
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3">Mã đơn hàng</label>
                                    <div class="col-md-9">
                                        ${view_order.id}
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3">Ngày tạo</label>
                                    <div class="col-md-9">
                                        ${view_order.date_created}
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3">Mã người mua</label>
                                    <div class="col-md-9">
                                        ${view_order.user_id}
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3">Người mua</label>
                                    <div class="col-md-9">
                                        ${view_order.user_name}
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3">Tổng tiền</label>
                                    <div class="col-md-9">
                                        <%=Util.formatCurrency((double)request.getAttribute("t_p"))%>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3">Tiền vận chuyển</label>
                                    <div class="col-md-9">
                                                <%=Util.formatCurrency((double)request.getAttribute("ship"))%>

                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3">Thành tiền</label>
                                    <div class="col-md-9">
                                                    <%=Util.formatCurrency((double)request.getAttribute("total"))%>

                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3">Phương thức thanh toán</label>
                                    <div class="col-md-9">
                                        <c:if test="${view_order.payment==true}">Tiền mặt</c:if>
                                        <c:if test="${view_order.payment==false}">Thanh toán qua Momo</c:if>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3">Trạng thái đơn hàng</label>
                                    <select class="form-control select col-md-9" name="status">
                                        <option disabled>Tình trạng đơn hàng</option>
                                        <option value="1" <c:if test="${view_order.status==1}">selected</c:if>>
                                            Đã hủy
                                        </option>
                                        <option value="2" <c:if test="${view_order.status==2}">selected</c:if>>
                                            Bị từ chối
                                        </option>
                                        <option value="3" <c:if test="${view_order.status==3}">selected</c:if>>
                                            Đang xử lí
                                        </option>
                                        <option value="4" <c:if test="${view_order.status==4}">selected</c:if>>
                                            Đang đóng gói
                                        </option>
                                        <option value="5" <c:if test="${view_order.status==5}">selected</c:if>>
                                            Đang vận chuyển
                                        </option>
                                        <option value="6" <c:if test="${view_order.status==6}">selected</c:if>>
                                            Thành công
                                        </option>
                                    </select>
                                </div>
                                <div class="col-md-3">
                                    <button class="btn btn-primary" type="submit">Lưu thay đổi</button>
                                </div>

                            </form>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header" data-toggle="collapse" data-target="#customer-info" role="button"
                             aria-expanded="false" aria-controls="customer-info">
                            <h4 class="card-title">Địa chỉ giao hàng</h4>
                        </div>
                        <div class="collapse card-body" id="customer-info">
                            <form action="#">
                                <div class="form-group row">
                                    <label class="col-md-3">Tên người nhận</label>
                                    <div class="col-md-9">
                                        ${view_order.user_name}
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3">Số điện thoại</label>
                                    <div class="col-md-9">
                                        0${view_order.phone}
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3">Địa chỉ</label>
                                    <div class="col-md-9">
                                        ${view_order.address}
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3">Ghi chú</label>
                                    <div class="col-md-9">
                                        ${view_order.note}
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="card" data-toggle="collapse" data-target="#product-info" role="button"
                         aria-expanded="false" aria-controls="product-info">
                        <div class="card-header">
                            <h4 class="card-title">Sản phẩm mua</h4>
                        </div>
                        <div class="collapse card-body" id="product-info">
                            <div class="table-responsive">
                                <table class="table table-hover table-center mb-0 datatable">
                                    <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Sản phẩm</th>
                                        <th>Số Lượng</th>
                                        <th>Giá</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="lipro" items="${list_pro}">
                                        <c:set var="p" value="${lipro.price}"></c:set>
                                        <tr>
                                            <td>${lipro.pro_id}</td>
                                            <td>${lipro.pro_name}</td>
                                            <td>${lipro.quantity}</td>
                                            <td><%=Util.formatCurrency((double)pageContext.getAttribute("p"))%></td>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- <script src="assets/js/jquery-3.5.0.min.js"></script> -->

<!-- Bootstrap Core JS -->
<script src="assets/js/popper.min.js"></script>
<script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>

<!-- Datepicker Core JS -->
<script src="assets/js/moment.min.js"></script>
<script src="assets/js/bootstrap-datetimepicker.min.js"></script>

<!-- Slimscroll JS -->
<script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<!-- Datatables JS -->
<script src="assets/plugins/datatables/datatables.min.js"></script>

<!-- Custom JS -->
<script src="assets/js/admin.js"></script>

</body>

</html>
	