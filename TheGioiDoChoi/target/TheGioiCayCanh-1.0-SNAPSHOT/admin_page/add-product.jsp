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
<%System.out.println("co vao add product.jsp");%>
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
                            <li class="breadcrumb-item"><a href="product.html">Sản phẩm</a></li>
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
                            <form action="add-product" method="post" enctype="multipart/form-data">
                                <c:if test="${type=='add'}">
                                    <div class="form-group" style="display: none">
                                        <input class="form-control" type="text" value="add" name="type" >
                                    </div>
                                    <div class="form-group">
                                        <label>Tên sản phẩm</label>
                                        <input class="form-control" type="text" value="" name="name" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Ảnh</label>
                                        <input class="form-control" type="file" name="img" required>
                                    </div>

                                    <div class="form-group">
                                        <label>Danh mục</label>
                                        <select class="form-control select" name="category_id" required>
                                            <option value="1">Cây để bàn</option>
                                            <option value="2">Cây dây leo</option>
                                            <option value="3">Cây tết</option>
                                            <option value="4">Cây thủy sinh</option>
                                            <option value="5">Cây trong nhà</option>
                                            <option value="6">Cây ngoài vườn</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Giá</label>
                                        <input class="form-control" type="number" value="" name="price" placeholder="ví dụ: 20000" required>
                                    </div>

                                    <div class="form-group">
                                        <label>Nhà cung cấp</label>
                                        <input class="form-control" type="number" value="" name="supplier_id" required>
                                    </div>

                                    <div class="form-group">
                                        <label>Số lượng</label>
                                        <input class="form-control" type="number" value="" name="quantity" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Loại</label><br>
                                        <select class="form-control select" name="type_weight" required>
                                            <option disabled>Chọn Danh Mục</option>
                                            <option value="1">Lớn</option>
                                            <option value="2">Trung Bình</option>
                                            <option value="3">Nhỏ</option>
                                            <option value="4">Rất nhỏ</option>
                                        </select>
                                    </div>
                                    <div class="status-toggle">
                                        <label>Hiển thị</label>
                                        <input id="rating_2" class="check" type="checkbox" name="active" value="true"
                                               checked>
                                        <label for="rating_2" class="checktoggle">checkbox</label>
                                    </div>
                                    <div class="status-toggle">
                                        <label>Có khuyến mãi không</label>
                                        <input id="rating_1" class="check" type="checkbox" name="is_sale" value="true">
                                        <label for="rating_1" class="checktoggle">checkbox</label>
                                    </div>
                                    <div class="form-group">
                                        <label>Phần trăm khuyến mãi</label>
                                        <input class="form-control" type="number" value="" placeholder="ví dụ: 20"
                                               name="percent_sale">
                                    </div>
                                    <div class="form-group">
                                        <label>Giá khuyến mãi</label>
                                        <input class="form-control" type="number" value="" name="price_sale">
                                    </div>
                                    <div class="form-group">
                                        <label>Khuyến mãi từ</label>
                                        <input class="form-control" type="date" value="" name="date_start_sale">
                                    </div>
                                    <div class="form-group">
                                        <label>Đến</label>
                                        <input class="form-control" type="date" value="" name="date_end_sale">
                                    </div>
                                    <div class="form-group">
                                        <label>Mô tả ngắn</label>
                                        <textarea style="height: 100px;" class="form-control" type="text"
                                                  name="description" required></textarea>
                                    </div>
                                    <div>
                                        <label>Mô tả dài</label>
                                        <textarea name="content" id="content" cols="30" rows="10" required></textarea>
                                    </div>

                                    <div class="mt-4">
                                        <button class="btn btn-primary" type="submit">Lưu thay đổi</button>
                                        <a href="product" class="btn btn-link">Hủy</a>
                                    </div>
                                </c:if>
                                <%--                        edit--%>
                                <c:if test="${type=='edit'}">
                                    <c:set var="price" value="${product.price}"></c:set>
                                    <c:set var="price_sale" value="${product.price_sale}"></c:set>
                                    <c:set var="date_start_sale" value="${product.date_start_sale}"></c:set>
                                    <c:set var="date_end_sale" value="${product.date_end_sale}"></c:set>
                                    <c:set var="date_created" value="${product.date_created}"></c:set>

                                    <div class="form-group" style="display: none">
                                        <input class="form-control" type="text" value="edit" name="type">
                                    </div>
                                    <div class="form-group">
                                        <label>ID</label>
                                        <input class="form-control" type="text" name="id" value="${product.id}"
                                               readonly>
                                    </div>
                                    <div class="form-group">
                                        <label>Tên sản phẩm</label>
                                        <input class="form-control" type="text" name="name" value="${product.name}" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Ảnh</label>
                                        <input class="form-control" type="file" value="" name="img">
                                    </div>
                                    <div class="form-group">
                                        <div class="avatar">
                                            <img class="avatar-img rounded" alt="avatar"
                                                    <c:if test="${fn:startsWith(product.img, 'imgs')}"> src="../${product.img}"</c:if>
                                                 <c:if test="${fn:startsWith(product.img, 'http')}">src="${product.img}"</c:if>
                                            >
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label>Danh mục</label>
                                        <select class="form-control select" name="category_id" required>
                                            <option value="1" <c:if test="${product.category_id==1}">selected</c:if>>Cây
                                                để bàn
                                            </option>
                                            <option value="2" <c:if test="${product.category_id==2}">selected</c:if>>Cây
                                                dây leo
                                            </option>
                                            <option value="3" <c:if test="${product.category_id==3}">selected</c:if>>Cây
                                                tết
                                            </option>
                                            <option value="4" <c:if test="${product.category_id==4}">selected</c:if>>Cây
                                                thủy sinh
                                            </option>
                                            <option value="5" <c:if test="${product.category_id==5}">selected</c:if>>Cây
                                                trong nhà
                                            </option>
                                            <option value="6" <c:if test="${product.category_id==6}">selected</c:if>>Cây
                                                ngoài vườn
                                            </option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Giá</label>
                                        <input class="form-control" type="number" value="${product.price}" required
                                               name="price">
                                    </div>

                                    <div class="form-group">
                                        <label>Nhà cung cấp</label>
                                        <input class="form-control" type="number" value="${product.supplier_id}" required
                                               name="supplier_id">
                                    </div>


                                    <div class="form-group">
                                        <label>Số lượng</label>
                                        <input class="form-control" type="number" name="quantity" required
                                               value="${product.quantity}">
                                    </div>
                                    <div class="form-group">
                                        <label>Loại</label><br>
                                        <select class="form-control select" name="type_weight" required>
                                            <option disabled>Chọn Danh Mục</option>
                                            <option value="4" <c:if test="${product.type_weight==4}">selected</c:if>>
                                                Lớn
                                            </option>
                                            <option value="3" <c:if test="${product.type_weight==3}">selected</c:if>>
                                                Trung Bình
                                            </option>
                                            <option value="2" <c:if test="${product.type_weight==2}">selected</c:if>>
                                                Nhỏ
                                            </option>
                                            <option value="1" <c:if test="${product.type_weight==1}">selected</c:if>>Rất
                                                nhỏ
                                            </option>
                                        </select>
                                    </div>
                                    <div class="status-toggle">
                                        <label>Hiển thị</label>
                                        <input id="rating_2" class="check" name="active" value="true" type="checkbox"
                                               <c:if test="${product.active}">checked</c:if>>
                                        <label for="rating_2" class="checktoggle">checkbox</label>
                                    </div>
                                    <div class="status-toggle">
                                        <label>Có khuyến mãi không</label>
                                        <input id="rating_1" class="check" type="checkbox" name="is_sale" value="true"
                                               <c:if test="${product.is_sale}">checked</c:if>>
                                        <label for="rating_1" class="checktoggle">checkbox</label>
                                    </div>
                                    <div class="form-group">
                                        <label>Phần trăm khuyến mãi</label>
                                        <input class="form-control" type="number" value="${product.percent_sale}"
                                               placeholder="ví dụ: 20" name="percent_sale">
                                    </div>
                                    <div class="form-group">
                                        <label>Giá khuyến mãi</label>
                                        <input class="form-control" type="number" value="${product.price_sale}"
                                               name="price_sale">
                                    </div>
                                    <div class="form-group">
                                        <label>Khuyến mãi từ</label>
                                        <input class="form-control" type="date"
                                               value="<%=Util.dateFormatNoTime((Date)pageContext.getAttribute("date_start_sale"))%>"
                                               name="date_start_sale">
                                    </div>
                                    <div class="form-group">
                                        <label>Đến</label>
                                        <input class="form-control" type="date"
                                               value="<%=Util.dateFormatNoTime((Date)pageContext.getAttribute("date_end_sale"))%>"
                                               name="date_end_sale">
                                    </div>
                                    <div class="form-group">
                                        <label>Ngày thêm sản phẩm</label>
                                        <input class="form-control" type="date"
                                               value="<%=Util.dateFormatNoTime((Date)pageContext.getAttribute("date_created"))%>"
                                               name="date_created" readonly>
                                    </div>
                                    <div class="form-group">
                                        <label>Mô tả ngắn</label>
                                        <textarea style="height: 100px;" class="form-control" type="text"
                                                  name="description" required>${product.description}</textarea>
                                    </div>
                                    <div>
                                        <label>Mô tả dài</label>
                                        <textarea name="content" id="content" cols="30"
                                                  rows="10" required>${product.content}</textarea>
                                    </div>
                                    <div class="mt-4">
                                        <button class="btn btn-primary" type="submit">Lưu thay đổi</button>
                                        <a href="product" class="btn btn-link">Hủy</a>
                                    </div>
                                </c:if>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%System.out.println("Da ra them add-product.jsp");%>
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
