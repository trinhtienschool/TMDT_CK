<%@ page import="vn.thegioidochoi.model.util.Util" %>
<%@ page import="java.util.Date" %>
<%@ page import="vn.thegioidochoi.model.Product.Product" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>Khách hàng</title>
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
<%--<c:set var="m" value="users"></c:set>--%>
<%--<%System.out.println(pageContext.getAttribute("m"));%>--%>
<% System.out.println("Co dang vao product.jsp");%>
<div class="main-wrapper">
    <jsp:include page="menu.jsp"></jsp:include>
    <div class="page-wrapper">
        <div class="content container-fluid">

            <!-- Page Header -->
            <div class="page-header">
                <div class="row">
                    <div class="col">
                        <h3 class="page-title">Khách hàng</h3>
                    </div>

                </div>
            </div>
            <!-- /Page Header -->

            <!-- Search Filter -->

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
                                        <th>id</th>
                                        <th>Cửa hàng</th>
                                        <th>Số tiền</th>
                                        <th>Ngày tạo</th>
                                        <th class="text-right">Hành Động</th>
                                    </tr>
                                    </thead>

                                    <!-- Thêm vào nội dung ở đây -->
                                    <tbody>
                                    <c:forEach var="w" items="${withdraws}">

                                        <tr>
                                            <td>${w.id}</td>
                                            <td>${w.supplier_name}</td>
                                            <td>${w.withdraw_amount}</td>
                                            <td>${w.date_created}</td>
<%--                                            <td><%= Util.dateFormatNoTime((Date) pageContext.getAttribute("date_created"))%></td>--%>
                                            <td class="text-right">
                                                <form action="withdraw" method="post">
                                                    <input name="id" type="hidden" value="${w.id}">
                                                    <input name="action" type="hidden" value="action">

                                                <select onchange="this.form.submit()" class="form-control select2" style="width: 100%" name="status">
                                                    <option value="0"<c:if test="${w.status==0}">selected</c:if>>Đang chờ xử lý</option>
                                                    <option value="1"<c:if test="${w.status==1}">selected</c:if>>Đã xử lý</option>
                                                    <option value="-1"<c:if test="${w.status==-1}">selected</c:if>>Hủy bỏ yêu cầu</option>


                                                </select>
                                                </form>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    <%System.out.println("DA xuong toi day");%>
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

<!-- Custom JS -->
<script src="assets/js/admin.js"></script>
</body>
</html>
