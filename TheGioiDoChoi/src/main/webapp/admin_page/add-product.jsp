<%--
  Created by IntelliJ IDEA.
  User: Trinh Quang Tien
  Date: 22/01/2021
  Time: 13:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="vn.thegioidochoi.model.util.Util" %>
<%@ page import="java.util.Date" %>
<%@ page import="vn.thegioidochoi.model.Product.Product" %>
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
            <form action="add-product" method="post" enctype="multipart/form-data">
                <c:if test="${type=='add'}">
                    <div class="row">
                        <div class="col-xl-6">
                            <div class="card flex-fill">
                                <div class="card-header">
                                    <h4 class="card-title">Thông tin chung</h4>
                                </div>
                                <div class="card-body">
                                    <div class="form-group" style="display: none">
                                        <input class="form-control" type="text" value="add" name="type">
                                    </div>
                                    <div class="form-group">
                                        <label>Tên sản phẩm</label>
                                        <input class="form-control" type="text" value="" name="name" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Giá</label>
                                        <input class="form-control price" data-type="currency" type="text" value=""
                                               name="price" placeholder="ví dụ: 20000" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Danh mục</label>
                                        <select class="form-control select2" name="category_id" required>
                                            <c:forEach var="cate" items="${applicationScope.category}">
                                                <c:if test="${cate.master_id == cate.id && cate.parent==0 }">

                                                    <option value="${cate.id}">${cate.name}</option>
                                                </c:if>
                                                <c:if test="${cate.master_id == cate.id && cate.parent==1 }">
                                                    <optgroup label="${cate.name}">
                                                        <c:forEach var="subcate" items="${cate.subcategories}">
                                                            <option value="${subcate.id}">${subcate.name}</option>
                                                        </c:forEach>
                                                    </optgroup>
                                                </c:if>

                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Nhà cung cấp</label>
                                        <select class="form-control select2" name="supplier_id" required>
                                            <c:forEach var="supplier" items="${suppliers}">
                                                <option value="${supplier.id}">${supplier.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <label>Tuổi</label>
                                        <select class="form-control select2" name="age" required>
                                            <option value="1">Từ 1 đến 6 tuổi</option>
                                            <option value="2">Từ 6 đến 11 tuổi</option>
                                            <option value="3">Từ 12 tuổi trở lên</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Giới tính</label>
                                        <select class="form-control select2" name="gender" required>
                                            <option value="1">Nam</option>
                                            <option value="2">Nữ</option>
                                            <option value="3">Cả 2</option>
                                        </select>
                                    </div>
                                    <div class="status-toggle">
                                        <label>Nổi bật</label>
                                        <input id="is_highlight" class="check" checked type="checkbox" name="is_highlight" value="true">
                                        <label for="is_highlight" class="checktoggle">checkbox</label>
                                    </div>


                                    <div class="status-toggle">
                                        <label>Hiển thị</label>
                                        <input id="show" class="check" type="checkbox" name="active" value="true"
                                               checked>
                                        <label for="show" class="checktoggle">checkbox</label>
                                    </div>
                                </div>
                            </div>
                            <div class="card flex-fill">
                                <div class="card-header">
                                    <h4 class="card-title">Quản lý kho</h4>
                                </div>
                                <div class="card-body">
                                    <div class="form-group">
                                        <label>SKU</label>
                                        <input class="form-control" type="text" value="" name="sku"
                                               placeholder="ví dụ: ruke129d" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Số lượng</label>
                                        <input class="form-control" type="number" value="" name="quantity" required>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="col-xl-6">
                            <div class="card flex-fill">
                                <div class="card-header">
                                    <h4 class="card-title">Ảnh sản phẩm</h4>
                                </div>
                                <div class="card-body">
                                    <div class="form-group">
                                        <label>Ảnh thumbnail</label>
                                        <input class="form-control thumbnail-img img-field" type="file" name="thumbnail-img"
                                               accept=".png, .jpg, .jpeg" required>
                                    </div>
                                    <div class="gallery-thumbnail-img"></div>
                                    <div class="form-group">
                                        <label>Ảnh gallery</label>
                                        <input class="form-control gallery-photo-add img-field" type="file" name="gallery-img"
                                               accept=".png, .jpg, .jpeg" multiple required>
                                    </div>
                                    <div class="gallery"></div>
                                </div>
                            </div>
                            <div class="card flex-fill">
                                <div class="card-header">
                                    <h4 class="card-title">Khuyến mãi</h4>
                                </div>
                                <div class="card-body">
                                    <div class="status-toggle">
                                        <label>Khuyến mãi</label>
                                        <input id="is_sale" class="check" checked type="checkbox" name="is_sale" value="true">
                                        <label for="is_sale" class="checktoggle">checkbox</label>
                                    </div>
                                    <div class="sale-zone">
                                        <div class="form-group">
                                            <label>Phần trăm khuyến mãi</label>
                                            <input class="form-control percent-sale" type="number" value=""
                                                   placeholder="ví dụ: 20"
                                                   name="percent_sale">
                                        </div>
                                        <div class="form-group">
                                            <label>Giá khuyến mãi</label>
                                            <input class="form-control price-sale" data-type="currency" type="text"
                                                   value="" name="price_sale">
                                        </div>
                                        <div class="form-group">
                                            <label>Khuyến mãi từ</label>
                                            <input class="form-control date-start-sale" type="date" value=""
                                                   name="date_start_sale">
                                        </div>
                                        <div class="form-group">
                                            <label>Đến</label>
                                            <input class="form-control date-end-sale" type="date" value=""
                                                   name="date_end_sale">
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="col-xl-12">
                            <div class="card flex-fill">
                                <div class="card-header">
                                    <h4 class="card-title">Mô tả</h4>
                                </div>
                                <div class="card-body">
                                    <div class="form-group">
                                        <label>Mô tả ngắn</label>
                                        <textarea style="height: 100px;" class="form-control" type="text"
                                                  name="description" required></textarea>
                                    </div>
                                    <div>
                                        <label>Mô tả dài</label>
                                        <textarea name="content" id="content" cols="30" rows="10" required></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </c:if>
                <%--                        edit--%>
                <c:if test="${type=='edit'}">
                    <c:set var="price" value="${product.price}"></c:set>
                    <c:set var="price_sale" value="${product.price_sale}"></c:set>
                    <c:set var="date_start_sale" value="${product.date_start_sale}"></c:set>
                    <c:set var="date_end_sale" value="${product.date_end_sale}"></c:set>
                    <c:set var="date_created" value="${product.date_created}"></c:set>



                    <div class="row">
                        <div class="col-xl-6">
                            <div class="card flex-fill">
                                <div class="card-header">
                                    <h4 class="card-title">Thông tin chung</h4>
                                </div>
                                <div class="card-body">
                                    <div class="form-group" style="display: none">
                                        <input class="form-control" type="text" value="edit" name="type">
                                        <input class="form-control" type="number" value="${product.id}" name="id">
                                    </div>
                                    <div class="form-group">
                                        <label>Tên sản phẩm</label>
                                        <input class="form-control" type="text" value="${product.name}" name="name" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Giá</label>
                                        <input class="form-control price" data-type="currency" type="text" value="<%=Util.formatCurrency((double)pageContext.getAttribute("price"))%>"
                                               name="price" placeholder="ví dụ: 20000" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Danh mục</label>
                                        <select class="form-control select2" name="category_id" required>
                                            <c:forEach var="cate" items="${applicationScope.category}">
                                                <c:if test="${cate.master_id == cate.id && cate.parent==0 }">

                                                    <option value="${cate.id}">${cate.name}</option>
                                                </c:if>
                                                <c:if test="${cate.master_id == cate.id && cate.parent==1 }">
                                                    <optgroup label="${cate.name}">

                                                        <c:forEach var="subcate" items="${cate.subcategories}">
                                                            <option value="${subcate.id}" <c:if test="${subcate.id==product.category_id}">selected</c:if>
                                                            >${subcate.name}</option>
                                                        </c:forEach>
                                                    </optgroup>
                                                </c:if>

                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Nhà cung cấp</label>
                                        <select class="form-control select2" name="supplier_id" required>
                                            <c:forEach var="supplier" items="${suppliers}">
                                                <option value="${supplier.id}"
                                                        <c:if test="${supplier.id==product.supplier_id}">selected</c:if>
                                                >${supplier.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <label>Tuổi</label>
                                        <select class="form-control select2" name="age" required>
                                            <option value="1"
                                                    <c:if test="${product.age==1}">selected</c:if>
                                            >Từ 1 đến 6 tuổi</option>
                                            <option value="2"
                                                    <c:if test="${product.age==2}">selected</c:if>
                                            >Từ 6 đến 11 tuổi</option>
                                            <option value="3"
                                                    <c:if test="${product.age==3}">selected</c:if>
                                            >Từ 12 tuổi trở lên</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Giới tính</label>
                                        <select class="form-control select2" name="gender" required>
                                            <option value="1"
                                                    <c:if test="${product.gender==1}">selected</c:if>
                                            >Nam</option>
                                            <option value="2"
                                                    <c:if test="${product.gender==2}">selected</c:if>
                                            >Nữ</option>
                                            <option value="3"
                                                    <c:if test="${product.gender==3}">selected</c:if>
                                            >Cả 2</option>
                                        </select>
                                    </div>
                                    <div class="status-toggle">
                                        <label>Nổi bật</label>
                                        <input id="is_highlight" class="check"
                                               <c:if test="${product.highlight}">checked</c:if>
                                                type="checkbox" name="is_highlight" value="true">
                                        <label for="is_highlight" class="checktoggle">checkbox</label>
                                    </div>


                                    <div class="status-toggle">
                                        <label>Hiển thị</label>
                                        <input id="show" class="check"
                                               <c:if test="${product.active}">checked</c:if>
                                               type="checkbox" name="active" value="true"
                                               >
                                        <label for="show" class="checktoggle">checkbox</label>
                                    </div>
                                    <div class="form-group">
                                        <label>Ngày tạo</label>
                                        <input class="form-control" type="text" value="<%=Util.dateFormatNoTime((Date)pageContext.getAttribute("date_created"))%>" readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="card flex-fill">
                                <div class="card-header">
                                    <h4 class="card-title">Quản lý kho</h4>
                                </div>
                                <div class="card-body">
                                    <div class="form-group">
                                        <label>SKU</label>
                                        <input class="form-control" type="text" value="${product.product_code}" name="sku"
                                               placeholder="ví dụ: ruke129d" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Số lượng</label>
                                        <input class="form-control" type="number" value="${product.quantity}" name="quantity" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Đã bán</label>
                                        <input class="form-control" type="number" value="${product.sold}" readonly>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="col-xl-6">
                            <div class="card flex-fill">
                                <div class="card-header">
                                    <h4 class="card-title">Ảnh sản phẩm</h4>
                                </div>
                                <div class="card-body">
                                    <div class="form-group">
                                        <label>Ảnh thumbnail</label>
                                        <input class="form-control thumbnail-img img-field" type="file" name="thumbnail-img"
                                               accept=".png, .jpg, .jpeg">
                                    </div>
                                    <div class="gallery-thumbnail-img">
                                        <img  <c:if test="${fn:startsWith(product.img, 'imgs')}"> src="../${product.img}"</c:if>
                                                                                                  <c:if test="${fn:startsWith(product.img, 'http')}">src="${product.img}"</c:if>
                                                                                                  style="margin-right: 10px; width: 100px; height: 100px;">
                                    </div>
                                    <div class="form-group">
                                        <label>Ảnh gallery</label>
                                        <input class="form-control gallery-photo-add img-field" type="file" name="gallery-img"
                                               accept=".png, .jpg, .jpeg" multiple>
                                    </div>
                                    <div class="gallery">
                                        <c:forEach var="gallery" items="${product.imageUrls}">
                                            <img  <c:if test="${fn:startsWith(gallery, 'imgs')}"> src="../${gallery}"</c:if>
                                                                                                      <c:if test="${fn:startsWith(gallery, 'http')}">src="${gallery}"</c:if>
                                                                                                      style="margin-right: 10px; width: 100px; height: 100px;">
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                            <div class="card flex-fill">
                                <div class="card-header">
                                    <h4 class="card-title">Khuyến mãi</h4>
                                </div>
                                <div class="card-body">
                                    <div class="status-toggle">
                                        <label>Khuyến mãi</label>
                                        <input id="is_sale" class="check" <c:if test="${product.is_sale}">checked</c:if> type="checkbox" name="is_sale" value="true">
                                        <label for="is_sale" class="checktoggle">checkbox</label>
                                    </div>
                                    <div class="sale-zone">
                                        <div class="form-group">
                                            <label>Phần trăm khuyến mãi</label>
                                            <input class="form-control percent-sale" type="number" value="${product.percent_sale}"
                                                   placeholder="ví dụ: 20"
                                                   name="percent_sale">
                                        </div>
                                        <div class="form-group">
                                            <label>Giá khuyến mãi</label>
                                            <input class="form-control price-sale" data-type="currency" type="text"
                                                   value="<%=Util.formatCurrency((double)pageContext.getAttribute("price_sale"))%>" name="price_sale">
                                        </div>
                                        <div class="form-group">
                                            <label>Khuyến mãi từ</label>
                                            <input class="form-control date-start-sale" type="date" value="<%=Util.dateFormatNoTime((Date)pageContext.getAttribute("date_start_sale"))%>
"
                                                   name="date_start_sale">
                                        </div>
                                        <div class="form-group">
                                            <label>Đến</label>
                                            <input class="form-control date-end-sale" type="date" value="<%=Util.dateFormatNoTime((Date)pageContext.getAttribute("date_end_sale"))%>"
                                                   name="date_end_sale">
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="col-xl-12">
                            <div class="card flex-fill">
                                <div class="card-header">
                                    <h4 class="card-title">Mô tả</h4>
                                </div>
                                <div class="card-body">
                                    <div class="form-group">
                                        <label>Mô tả ngắn</label>
                                        <textarea style="height: 100px;" class="form-control" type="text"
                                                  name="description" required >${product.description}</textarea>
                                    </div>
                                    <div>
                                        <label>Mô tả dài</label>
                                        <textarea name="content" id="content" cols="30" rows="10" required>${product.content}</textarea>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>


                </c:if>
                <div class="mt-4">
                    <button class="btn btn-primary" type="submit">Lưu thay đổi</button>
                    <a href="product" class="btn btn-link">Hủy</a>
                </div>
            </form>
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
        <script src="assets/js/currency.js"></script>
        <script src="assets/js/admin.js"></script>
        <script>
            $('.select2').select2();
        </script>
    </div>
</body>
</html>
