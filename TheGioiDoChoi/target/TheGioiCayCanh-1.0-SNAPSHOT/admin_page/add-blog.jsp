<%--
  Created by IntelliJ IDEA.
  User: Trinh Quang Tien
  Date: 22/01/2021
  Time: 13:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="vn.thegioicaycanh.model.util.Util" %>
<%@ page import="java.util.Date" %>
<%@ page import="vn.thegioicaycanh.model.Product.Product" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
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
    <!-- Select CSS -->
    <link rel="stylesheet" href="assets/css/select2.min.css">
    <!-- Main CSS -->
    <link rel="stylesheet" href="assets/css/admin.css">
    <script src="assets/js/tinymce/tinymce.min.js"></script>
    <%--    <script src="assets/js/tinymce.js"></script>--%>
    <script type="text/javascript" src="lib/ckeditor/ckeditor.js"></script>
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
                        <h3 class="page-title">${title}</h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="product.html">Bài viết</a></li>
                            <li class="breadcrumb-item active">${title}</li>
                        </ul>
                    </div>

                </div>
            </div>
            <!-- /Page Header -->
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <form action="add-blog" method="post" enctype="multipart/form-data"
                                  accept-charset="UTF-8">
                                <c:if test="${type=='add'}">
                                    <div class="form-group" style="display: none">
                                        <input class="form-control" type="text" value="add" name="type">
                                    </div>
                                    <div class="form-group">
                                        <label>Tên bài viết</label>
                                        <input class="form-control" type="text" value="" name="name" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Ảnh</label>
                                        <input class="form-control" type="file" name="img" required>
                                    </div>

                                    <div class="form-group">
                                        <label>Tóm tắt</label>
                                        <textarea style="height: 100px;" class="form-control" type="text"
                                                  name="description" required></textarea>
                                    </div>
                                    <div>
                                        <label>Mô tả dài</label>
                                        <textarea name="content" id="content" cols="30" rows="10" required>

										</textarea>
                                    </div>
                                    <div class="status-toggle">
                                        <label>Hiển thị</label>
                                        <input id="rating_2" class="check" type="checkbox" name="active" value="true"
                                               checked>
                                        <label for="rating_2" class="checktoggle">checkbox</label>
                                    </div>
                                    <div class="mt-4">
                                        <button class="btn btn-primary" type="submit">Lưu thay đổi</button>
                                        <a href="blog-admin" class="btn btn-link">Hủy</a>
                                    </div>
                                </c:if>
                                <%--                        edit--%>
                                <c:if test="${type=='edit'}">

                                    <c:set var="date_created" value="${blog.date_created}"></c:set>
                                    <div class="form-group" style="display: none">
                                        <input class="form-control" type="text" value="edit" name="type">
                                    </div>
                                    <div class="form-group">
                                        <label>ID</label>
                                        <input class="form-control" type="text" name="id" value="${blog.id}"
                                               readonly>
                                    </div>
                                    <div class="form-group">
                                        <label>Tên bài viết</label>
                                        <input class="form-control" type="text" value="${blog.name}" name="name" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Ảnh</label>
                                        <input class="form-control" type="file" name="img">
                                    </div>
                                    <div class="form-group">
                                        <div class="avatar">
                                            <img class="avatar-img rounded" alt="avatar"
                                            <c:if test="${fn:startsWith(blog.avatar, 'imgs')}"> src="../${blog.avatar}"</c:if>
                                             <c:if test="${fn:startsWith(blog.avatar, 'http')}">src="${blog.avatar}"</c:if>
                                            >
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label>Tóm tắt</label>
                                        <textarea style="height: 100px;" class="form-control" type="text"
                                                  name="description" required>${blog.description}</textarea>
                                    </div>
                                    <div>
                                        <label>Mô tả dài</label>
                                        <textarea name="content" id="content" cols="30" rows="10" required>
                                            ${blog.content}
										</textarea>
                                    </div>
                                    <div class="status-toggle">
                                        <label>Hiển thị</label>
                                        <input id="rating_2" class="check" type="checkbox" name="active" value="true"
                                               <c:if test="${blog.active}">checked</c:if>>
                                        <label for="rating_2" class="checktoggle">checkbox</label>
                                    </div>
                                    <div class="mt-4">
                                        <button class="btn btn-primary" type="submit">Lưu thay đổi</button>
                                        <a href="blog-admin" class="btn btn-link">Hủy</a>
                                    </div>
                                </c:if>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- jQuery -->
        <script>
            CKEDITOR.replace('content');
        </script>
        <script src="assets/js/jquery-3.5.0.min.js"></script>

        <!-- Bootstrap Core JS -->
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
        <!-- Select2 JS -->
        <script src="assets/js/select2.min.js"></script>

        <!-- Custom JS -->
        <script src="assets/js/admin.js"></script>
    </div>
</body>
</html>
