<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Date" %>
<%@ page import="vn.thegioicaycanh.model.util.Util" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<!DOCTYPE html>
<html lang="vi-VN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <title>Email</title>
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
<c:set var="m" value="emails"></c:set>
<%System.out.println(pageContext.getAttribute("m"));%>
<div class="main-wrapper">
    <jsp:include page="menu.jsp"></jsp:include>
        <div class="page-wrapper">
            <div class="content container-fluid">
                <!-- Page Header -->
                <div class="page-header">
                    <div class="row">
                        <div class="col">
                            <h3 class="page-title">Email</h3>
                        </div>
                        <!-- <div class="col-auto text-right">
                            <a href="add-ratingstype.html" class="btn btn-primary add-button">
                                <i class="fas fa-plus"></i>
                            </a>
                        </div> -->
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table custom-table mb-0 datatable">
                                            <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Email</th>
                                                <th>Ngày đăng ký</th>
<%--                                                <th>Tình trạng</th>--%>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="e" items="${emails}">
                                                <c:set var="date" value="${e.date}"></c:set>
                                                <tr>
                                                    <td>${e.id}</td>
                                                    <td>${e.email}</td>
                                                    <td><%= Util.dateFormatNoTime((Date) pageContext.getAttribute("date"))%></td>
    <%--                                                <td>--%>
    <%--                                                    <div class="status-toggle">--%>
    <%--                                                        <input id="rating_1" class="check" type="checkbox" checked>--%>
    <%--                                                        <label for="rating_1" class="checktoggle">checkbox</label>--%>
    <%--                                                    </div>--%>
    <%--                                                </td>--%>
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

