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
                            <li class="breadcrumb-item"><a href="product.html">Vận chuyển</a></li>
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
                            <form action="add-supplier" method="post"
                                  accept-charset="UTF-8">
                                <c:if test="${type=='add'}">
                                    <div class="form-group" style="display: none">
                                        <input class="form-control" type="text" value="add" name="type">
                                    </div>
                                    <div class="form-group">
                                        <label>Ảnh</label>
                                        <input class="form-control" type="file" name="img">
                                    </div>
                                    <div class="form-group">
                                        <label>Nhà cung cấp</label>
                                        <input id="name_supplier"class="form-control" type="text" value="" name="supplier_id">
                                    </div>
                                    <div class="form-group">
                                        <label>Địa chỉ</label>
                                        <input id="address" class="form-control" type="text" name="address">
                                    </div>
                                    <div class="form-group">
                                        <label>Điện thoại</label>
                                        <input id="phone" class="form-control" type="text"  name="phone">
                                    </div>
                                    <div class="form-group">
                                        <label>Email</label>
                                        <input id="email" class="form-control" type="text"  name="email">
                                    </div>
                                    <div class="mt-4">
                                        <button class="btn btn-primary" type="submit">Lưu thay đổi</button>
                                        <a href="categories.html" class="btn btn-link">Hủy</a>
                                    </div>
                                </c:if>
                                <c:if test="${type=='edit'}">
                                    <div class="form-group" style="display: none">
                                        <input class="form-control" type="text" value="edit" name="type">
                                    </div>
                                    <div class="form-group">
                                        <label>ID</label>
                                        <input class="form-control" type="text" name="id" value="${supplier.id}"
                                               readonly>
                                    </div>
                                    <div class="form-group">
                                        <label>Ảnh</label>
                                        <input class="form-control" type="file" value="${supplier.logo}" name="img">
                                    </div>
                                    <div class="form-group">
                                        <div class="avatar">
                                            <img class="avatar-img rounded" alt="avatar"
                                            <c:if test="${fn:startsWith(supplier.logo, 'imgs')}"> src="../${supplier.logo}"</c:if>
                                                 <c:if test="${fn:startsWith(supplier.logo, 'http')}">src="${supplier.logo}"</c:if>
                                            >
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>Nhà cung cấp</label>
                                        <input id="name_supplier"class="form-control" type="text" value="${supplier.name}" name="suppliername">
                                    </div>
                                    <div class="form-group">
                                        <label>Địa chỉ</label>
                                        <input id="address" class="form-control" type="text" value="${supplier.address}" name="adđress">
                                    </div>
                                    <div class="form-group">
                                        <label>Điện thoại</label>
                                        <input id="phone" class="form-control" type="text" value="${supplier.phone}" name="phone">
                                    </div>
                                    <div class="form-group">
                                        <label>Email</label>
                                        <input id="email" class="form-control" type="text" value="${supplier.email}" name="email">
                                    </div>
                                    <div class="mt-4">
                                        <button class="btn btn-primary" type="submit">Lưu thay đổi</button>
                                        <a href="categories.html" class="btn btn-link">Hủy</a>
                                    </div>
                                </c:if>
                                <%--                        edit--%>
                                <%--                                <c:if test="${type=='edit'}">--%>
                                <%--                                    <c:set var="price" value="${product.price}"></c:set>--%>
                                <%--                                    <c:set var="price_sale" value="${product.price_sale}"></c:set>--%>
                                <%--                                    <c:set var="date_start_sale" value="${product.date_start_sale}"></c:set>--%>
                                <%--                                    <c:set var="date_end_sale" value="${product.date_end_sale}"></c:set>--%>
                                <%--                                    <c:set var="date_created" value="${product.date_created}"></c:set>--%>

                                <%--                                    <div class="form-group" style="display: none">--%>
                                <%--                                        <input class="form-control" type="text" value="edit" name="type">--%>
                                <%--                                    </div>--%>
                                <%--                                    <div class="form-group">--%>
                                <%--                                        <label>ID</label>--%>
                                <%--                                        <input class="form-control" type="text" name="id" value="${product.id}"--%>
                                <%--                                               readonly>--%>
                                <%--                                    </div>--%>
                                <%--                                    <div class="form-group">--%>
                                <%--                                        <label>Ảnh</label>--%>
                                <%--                                        <input class="form-control" type="file" value="" name="img">--%>
                                <%--                                    </div>--%>
                                <%--                                    <div class="form-group">--%>
                                <%--                                        <div class="avatar">--%>
                                <%--                                            <img class="avatar-img rounded" alt="avatar"--%>
                                <%--                                            <c:if test="${fn:startsWith(product.img, 'imgs')}"> src="../${product.img}"</c:if>--%>
                                <%--                                                 <c:if test="${fn:startsWith(product.img, 'http')}">src="${product.img}"</c:if>--%>
                                <%--                                            >--%>
                                <%--                                        </div>--%>
                                <%--                                    </div>--%>
                                <%--                                    <div class="form-group">--%>
                                <%--                                        <label>Tên sản phẩm</label>--%>
                                <%--                                        <input class="form-control" type="text" name="name" value="${product.name}">--%>
                                <%--                                    </div>--%>
                                <%--                                    <div class="form-group">--%>
                                <%--                                        <label>Danh mục</label>--%>
                                <%--                                        <select class="form-control select" name="category_id">--%>
                                <%--                                            <option value="1" <c:if test="${product.category_id==1}">selected</c:if>>Cây--%>
                                <%--                                                để bàn--%>
                                <%--                                            </option>--%>
                                <%--                                            <option value="2" <c:if test="${product.category_id==2}">selected</c:if>>Cây--%>
                                <%--                                                dây leo--%>
                                <%--                                            </option>--%>
                                <%--                                            <option value="3" <c:if test="${product.category_id==3}">selected</c:if>>Cây--%>
                                <%--                                                tết--%>
                                <%--                                            </option>--%>
                                <%--                                            <option value="4" <c:if test="${product.category_id==4}">selected</c:if>>Cây--%>
                                <%--                                                thủy sinh--%>
                                <%--                                            </option>--%>
                                <%--                                            <option value="5" <c:if test="${product.category_id==5}">selected</c:if>>Cây--%>
                                <%--                                                trong nhà--%>
                                <%--                                            </option>--%>
                                <%--                                            <option value="6" <c:if test="${product.category_id==6}">selected</c:if>>Cây--%>
                                <%--                                                ngoài vườn--%>
                                <%--                                            </option>--%>
                                <%--                                        </select>--%>
                                <%--                                    </div>--%>
                                <%--                                    <div class="form-group">--%>
                                <%--                                        <label>Giá</label>--%>
                                <%--                                        <input class="form-control" type="text" value="${product.price}"--%>
                                <%--                                               name="price">--%>
                                <%--                                    </div>--%>

                                <%--                                    <div class="form-group">--%>
                                <%--                                        <label>Nhà cung cấp</label>--%>
                                <%--                                        <input class="form-control" type="text" value="${product.supplier_id}"--%>
                                <%--                                               name="supplier_id">--%>
                                <%--                                    </div>--%>


                                <%--                                    <div class="form-group">--%>
                                <%--                                        <label>Số lượng</label>--%>
                                <%--                                        <input class="form-control" type="text" name="quantity"--%>
                                <%--                                               value="${product.quantity}">--%>
                                <%--                                    </div>--%>
                                <%--                                    <div class="form-group">--%>
                                <%--                                        <label>Loại</label><br>--%>
                                <%--                                        <select class="form-control select" name="type_weight">--%>
                                <%--                                            <option disabled>Chọn Danh Mục</option>--%>
                                <%--                                            <option value="4" <c:if test="${product.type_weight==4}">selected</c:if>>--%>
                                <%--                                                Lớn--%>
                                <%--                                            </option>--%>
                                <%--                                            <option value="3" <c:if test="${product.type_weight==3}">selected</c:if>>--%>
                                <%--                                                Trung Bình--%>
                                <%--                                            </option>--%>
                                <%--                                            <option value="2" <c:if test="${product.type_weight==2}">selected</c:if>>--%>
                                <%--                                                Nhỏ--%>
                                <%--                                            </option>--%>
                                <%--                                            <option value="1" <c:if test="${product.type_weight==1}">selected</c:if>>Rất--%>
                                <%--                                                nhỏ--%>
                                <%--                                            </option>--%>
                                <%--                                        </select>--%>
                                <%--                                    </div>--%>
                                <%--                                    <div class="status-toggle">--%>
                                <%--                                        <label>Hiển thị</label>--%>
                                <%--                                        <input id="rating_2" class="check" name="active" value="true" type="checkbox"--%>
                                <%--                                               <c:if test="${product.active}">checked</c:if>>--%>
                                <%--                                        <label for="rating_2" class="checktoggle">checkbox</label>--%>
                                <%--                                    </div>--%>
                                <%--                                    <div class="status-toggle">--%>
                                <%--                                        <label>Có khuyến mãi không</label>--%>
                                <%--                                        <input id="rating_1" class="check" type="checkbox" name="is_sale" value="true"--%>
                                <%--                                               <c:if test="${product.is_sale}">checked</c:if>>--%>
                                <%--                                        <label for="rating_1" class="checktoggle">checkbox</label>--%>
                                <%--                                    </div>--%>
                                <%--                                    <div class="form-group">--%>
                                <%--                                        <label>Phần trăm khuyến mãi</label>--%>
                                <%--                                        <input class="form-control" type="text" value="${product.percent_sale}"--%>
                                <%--                                               placeholder="ví dụ: 20" name="percent_sale">--%>
                                <%--                                    </div>--%>
                                <%--                                    <div class="form-group">--%>
                                <%--                                        <label>Giá khuyến mãi</label>--%>
                                <%--                                        <input class="form-control" type="text" value="${product.price_sale}"--%>
                                <%--                                               name="price_sale">--%>
                                <%--                                    </div>--%>
                                <%--                                    <div class="form-group">--%>
                                <%--                                        <label>Khuyến mãi từ</label>--%>
                                <%--                                        <input class="form-control" type="date"--%>
                                <%--                                               value="<%=Util.dateFormatNoTime((Date)pageContext.getAttribute("date_start_sale"))%>"--%>
                                <%--                                               name="date_start_sale">--%>
                                <%--                                    </div>--%>
                                <%--                                    <div class="form-group">--%>
                                <%--                                        <label>Đến</label>--%>
                                <%--                                        <input class="form-control" type="date"--%>
                                <%--                                               value="<%=Util.dateFormatNoTime((Date)pageContext.getAttribute("date_end_sale"))%>"--%>
                                <%--                                               name="date_end_sale">--%>
                                <%--                                    </div>--%>
                                <%--                                    <div class="form-group">--%>
                                <%--                                        <label>Ngày thêm sản phẩm</label>--%>
                                <%--                                        <input class="form-control" type="date"--%>
                                <%--                                               value="<%=Util.dateFormatNoTime((Date)pageContext.getAttribute("date_created"))%>"--%>
                                <%--                                               name="date_created" readonly>--%>
                                <%--                                    </div>--%>
                                <%--                                    <div class="form-group">--%>
                                <%--                                        <label>Mô tả ngắn</label>--%>
                                <%--                                        <textarea style="height: 100px;" class="form-control" type="text"--%>
                                <%--                                                  name="description">${product.description}</textarea>--%>
                                <%--                                    </div>--%>
                                <%--                                    <div>--%>
                                <%--                                        <label>Mô tả dài</label>--%>
                                <%--                                        <textarea name="content" id="content" cols="30"--%>
                                <%--                                                  rows="10">${p.content}</textarea>--%>
                                <%--                                    </div>--%>
                                <%--                                    <div class="mt-4">--%>
                                <%--                                        <button class="btn btn-primary" type="submit">Lưu thay đổi</button>--%>
                                <%--                                        <a href="categories.html" class="btn btn-link">Hủy</a>--%>
                                <%--                                    </div>--%>
                                <%--                                </c:if>--%>
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
