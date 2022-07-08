<%@ page import="vn.thegioidochoi.model.util.Util" %>
<%@ page import="java.util.Date" %>
<%@ page import="vn.thegioidochoi.model.Product.Product" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%--
  Created by IntelliJ IDEA.
  User: Trinh Quang Tien
  Date: 22/01/2021
  Time: 4:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<!DOCTYPE html>
<html lang="vi-VN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <title>Sản phẩm</title>
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
    <!-- Select CSS -->
    <link rel="stylesheet" href="assets/css/select2.min.css">
    <!-- Main CSS -->
    <link rel="stylesheet" href="assets/css/admin.css">

</head>
<body>
<% System.out.println("Co dang vao product.jsp");%>
<div class="main-wrapper">
    <jsp:include page="menu.jsp"></jsp:include>
    <div class="page-wrapper">
        <div class="content container-fluid">

            <!-- Page Header -->
            <div class="page-header">
                <div class="row">
                    <div class="col">
                        <h3 class="page-title">Rút tiền</h3>
                    </div>

                </div>
            </div>
            <!-- /Page Header -->

            <!-- Search Filter -->
            <div class="card filter-card" id="withdraw">
                <div class="card-body pb-0">
                    <form action="withdraw" method="post" accept-charset="UTF-8">
                        <div class="row filter-row">
                            <div class="col-sm-6 col-md-3">
                                <div class="form-group">
                                    <label>Số dư hiện tại</label>
                                    <input id="current-balance" readonly class="form-control" type="text"
                                           name="current-balance" value="${Util.formatCurrency(current_balance)}">
                                </div>
                            </div>
                            <div class="col-sm-6 col-md-3">
                                <div class="form-group">
                                    <label>Số tiền muốn rút</label>
                                    <input id="withdraw-amount" class="form-control" name="withdraw-amount" type="text"
                                           required>
                                </div>
                            </div>
                            <div class="col-sm-6 col-md-3">
                                <div class="form-group">
                                    <label>Email paypal</label>
                                    <input class="form-control" name="paypal-email" type="email" required>
                                </div>
                            </div>
                            <!-- Thay đổi theo danh sách đề mục -->

                            <div class="col-sm-6 col-md-3">
                                <div class="form-group">
                                    <button class="btn btn-primary btn-block" type="submit">Rút</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <!-- /Search Filter -->
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-hover table-center mb-0 datatable">
                                    <!-- Thay đổi code ở đây Thay đổi theo file word -->
                                    <thead>
                                    <tr>
                                        <th>Ngày yêu cầu</th>
                                        <th>Số tiền trước khi rút</th>
                                        <th>Số tiền yêu cầu rút</th>
                                        <th>Số tiền sau khi rút</th>
                                        <th>Paypal email</th>
                                        <th>Trạng thái</th>
                                    </tr>
                                    </thead>

                                    <!-- Thêm vào nội dung ở đây -->
                                    <tbody>
                                    <c:forEach var="w" items="${withdraws}">
                                        <tr>
                                            <td>${Util.dateFormat(w.date_created)}</td>
                                            <td>${Util.formatCurrency(w.current_balance)}</td>
                                            <td>${Util.formatCurrency(w.withdraw_amount)}</td>
                                            <td>${Util.formatCurrency(w.remain_balance)}</td>
                                            <td>${w.paypal_email}</td>

                                            <td>
                                                <c:if test="${w.status==-1}"><span class="badge bg-danger inv-badge">Bị từ chối</span></c:if>
                                                <c:if test="${w.status==0}"><span class="badge bg-primary inv-badge">Đang chờ</span></c:if>
                                                <c:if test="${w.status==1}"><span class="badge bg-success inv-badge">Đã thanh toán</span></c:if>
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

<!-- Datepicker Core JS -->
<script src="assets/js/moment.min.js"></script>
<script src="assets/js/bootstrap-datetimepicker.min.js"></script>

<!-- Datatables JS -->
<script src="assets/plugins/datatables/datatables.min.js"></script>

<!-- Select2 JS -->
<script src="assets/js/select2.min.js"></script>
<script src="assets/js/currency.js"></script>
<!-- Custom JS -->
<script src="assets/js/admin.js"></script>

</body>
</html>
