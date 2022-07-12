<%--
  Created by IntelliJ IDEA.
  User: Trinh Quang Tien
  Date: 15/01/2021
  Time: 8:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

    <!-- Datepicker CSS -->
    <link rel="stylesheet" href="assets/css/bootstrap-datetimepicker.min.css">

    <!-- Datatables CSS -->
    <link rel="stylesheet" href="assets/plugins/datatables/datatables.min.css">

    <!-- Animate CSS -->
    <link rel="stylesheet" href="assets/css/animate.min.css">

    <!-- Select CSS -->
    <link rel="stylesheet" href="assets/css/select2.min.css">

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
                        <h3 class="page-title">Danh mục</h3>
                    </div>
                    <div class="col-auto text-right">
                        <a href="add-category?type=enterAdd" class="btn btn-primary add-button ml-3">
                            <i class="fas fa-plus"></i>
                        </a>
                    </div>
                </div>
            </div>
            <!-- /Page Header -->

            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-hover table-center mb-0 datatable">
                                    <thead>
                                    <tr role="row">
                                        <th>ID</th>
                                        <th>Danh mục</th>
                                        <th>Danh mục cha</th>
                                        <th >Hành Động</th>
                                    </tr>
                                    </thead>
                                    <tbody>


                                    <c:forEach var="cate" items="${applicationScope.category}">

                                        <c:if test="${cate.master_id == cate.id && cate.parent==0 }">
                                    <tr>
                                        <td>
                                            ${cate.id}
                                        <td>
                                        <td>
                                            ${cate.name}
                                        <td>
                                        <td>
                                                ""
                                        <td>
                                        <td >
                                            <a href="add-category?type=enterEdit&id=${c.id}"
                                               class="btn btn-sm bg-success-light mr-2">
                                                <i class="far fa-edit mr-1"></i> Sửa</a>
                                                <a href="delete-category?type=sub&id=${c.id}" type="button" class="btn btn-outline-danger btn-sm"><i class="fa fa-trash-o"></i> Xóa</a>

                                        </td>
                                    <tr>
                                        </c:if>

                                        <c:if test="${cate.master_id == cate.id && cate.parent==1 }">

                                                <c:forEach var="subcate" items="${cate.subcategories}">
                                                    <tr>
                                                    <td>
                                                            ${subcate.id}
                                                    <td>
                                                    <td>
                                                        ${subcate.name}
                                                    <td>
                                                    <td>
                                                        ${cate.name}
                                                    <td>
                                                    <td >
                                                        <a href="add-category?type=enterEdit&id=${c.id}"
                                                           class="btn btn-sm bg-success-light mr-2">
                                                            <i class="far fa-edit mr-1"></i> Sửa</a>
                                                    <a href="delete-category?type=parent&id=${c.id}" type="button" class="btn btn-outline-danger btn-sm"><i class="fa fa-trash-o"></i> Xóa</a>

                                                    </td>
                                                    </tr>
                                                </c:forEach>

                                        </c:if>

                                    </c:forEach>



<%--                                    <c:forEach var="c" items="${categories}">--%>
<%--                                        <tr>--%>
<%--                                            <td>${c.id}</td>--%>
<%--                                            <td>${c.name}</td>--%>
<%--                                            <td class="text-right">--%>
<%--                                                <a href="add-category?type=enterEdit&id=${c.id}"--%>
<%--                                                   class="btn btn-sm bg-success-light mr-2">--%>
<%--                                                    <i class="far fa-edit mr-1"></i> Sửa</a>--%>
<%--                                                <c:if test="${c.id!=c.master_id}">--%>
<%--                                                    <a href="delete-category?type=sub&id=${c.id}" type="button" class="btn btn-outline-danger btn-sm"><i class="fa fa-trash-o"></i> Xóa</a>--%>
<%--                                                </c:if>--%>
<%--                                                <c:if test="${c.id==c.master_id}">--%>
<%--                                                <a href="delete-category?type=parent&id=${c.id}" type="button" class="btn btn-outline-danger btn-sm"><i class="fa fa-trash-o"></i> Xóa</a>--%>
<%--                                                </c:if>--%>
<%--                                            </td>--%>
<%--                                        </tr>--%>
<%--                                    </c:forEach>--%>
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