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
                                    <li class="breadcrumb-item"><a href="categories.html">Danh mục</a></li>
                                    <li class="breadcrumb-item active">${title}</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- /Page Header -->

                    <div class="card">
                        <div class="card-body">

                            <!-- Form -->
                            <form action="add-category" method="post"
                                  accept-charset="UTF-8">
                                <c:if test="${type=='add'}">
                                    <div class="form-group" style="display: none">
                                        <input class="form-control" type="text" value="add" name="type">
                                    </div>
                                   <div class="form-group row">
                                        <label class="col-form-label col-md-2">Tên danh mục</label>
                                        <div class="col-md-10" name>
                                            <input type="text" class="form-control" name="name">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-form-label col-md-2">Slug</label>
                                        <div class="col-md-10" name>
                                            <input type="text" class="form-control" name="slug">
                                        </div>
                                    </div>
                                    <div class="status-toggle form-group row">
                                        <label class="col-form-label col-md-2">Là danh mục cha</label>
                                        <div class="col-md-10">
                                                <input id="parent" class="check" type="checkbox" name="active" value="true"
                                                       checked>
                                            <label for="parent" class="checktoggle">checkbox</label>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-form-label col-md-2">Danh mục cha</label>
                                        <div class="col-md-10">
                                            <select id="parent_cate" class="form-control select" name="list_cate" disabled>
                                                <c:forEach items="${parentlist}" var="pc">
                                                    <option value="${pc.id}">${pc.name}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="mt-4">
                                        <button class="btn btn-primary" type="submit">Lưu</button>
                                        <a href="category" class="btn btn-link">Hủy</a>
                                    </div>
                                </c:if>
                                <c:if test="${type=='edit'}">
                                    <div class="form-group" style="display: none">
                                        <input class="form-control" type="text" value="edit" name="type">
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-form-label col-md-2">ID</label>
                                        <div class="col-md-10">
                                            <input type="text" class="form-control" name="id" value="${category.id}" readonly>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-form-label col-md-2">Tên danh mục</label>
                                        <div class="col-md-10" name>
                                            <input type="text" class="form-control" name="name" value="${category.name}">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-form-label col-md-2">Slug</label>
                                        <div class="col-md-10" name>
                                            <input type="text" class="form-control" name="slug" value="${category.slug}">
                                        </div>
                                    </div>
                                    <div class="status-toggle form-group row">
                                        <label class="col-form-label col-md-2">Là danh mục cha</label>
                                        <div class="col-md-10">
                                            <c:if test="${category.id==category.master_id}">
                                            <input id="parent2" class="check" type="checkbox" name="active" value="true"
                                                   checked>
                                            </c:if>
                                            <c:if test="${category.id!=category.master_id}">
                                                <input id="parent2" class="check" type="checkbox" name="active" value="false">
                                            </c:if>
                                            <label for="parent2" class="checktoggle">checkbox</label>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-form-label col-md-2">Danh mục cha</label>
                                        <div class="col-md-10">
                                            <select class="form-control select" name="list_cate" <c:if test="${category.id == category.master_id}">disabled</c:if>>
                                                <c:forEach items="${parentlist}" var="pc">
                                                    <option value="${pc.id}" <c:if test="${pc.id==category.id}">selected</c:if>>${pc.name}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        </div>
                                    <div class="mt-4">
                                        <button class="btn btn-primary" type="submit">Lưu</button>
                                        <a href="category" class="btn btn-link">Hủy</a>
                                    </div>
                                </c:if>
                            </form>
                            <!-- /Form -->
                            <!-- Form -->

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

<script>
    var create_cate = function () {
        if ($("#parent").is(":checked")) {
            $("#parent_cate").prop('disabled', true);
            console.log("Da danh dau")
        }
        else {
            $("#parent_cate").prop('disabled', false);
            console.log("Chua danh dau")
        }
    };

    $(create_cate);
    $("#parent").change(create_cate);
</script>
</body>

</html>