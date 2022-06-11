<%@ page import="vn.thegioidochoi.model.util.Util" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="vi-VN">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>${title}</title>
    <%-- Link icon --%>
    <link href="${applicationScope.header.shortcut}" rel="shortcut icon">
    <!-- Css Styles -->
    <link rel="stylesheet" href="user_page/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/owl.theme.default.min.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/style.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/style_home.css" type="text/css">
</head>

<body>
<jsp:include page="Menu.jsp"></jsp:include>

<%--<jsp:include page="search_bar.jsp"></jsp:include>--%>

<!-- User Section -->
<div class="container" style="
    background: white;
    padding: 20px;
    margin-bottom: 20px;
">
    <div class="row my-2 user__border">
        <div class="col-lg-4 order-lg-1 text-center img-2">
            <div class="img-ava">
                <img src="${sessionScope.user_avatar}" class="mx-auto img-fluid img-circle d-block" alt="Ảnh đại diện">
                <label class="load-ava">
                    <span class="custom-file-control">Đổi Ảnh</span>
                    <form id="submit-avatar" action="saveAvatar" method="post" enctype="multipart/form-data">
                        <input type="file" id="file" class="custom-file-input" name="avatar" accept="image/png, image/gif, image/jpeg">

                    </form>
                </label>
            </div>
            <h6 class="mt-2">${sessionScope.user_name}</h6>
        </div>
        <div class="col-lg-8 order-lg-2">
            <ul class="nav nav-tabs tab">
                <li class="nav-item">
                    <a href="#profile" data-target="#profile" data-toggle="tab" class="nav-link active nav-link-2">Tài
                        Khoản</a>
                </li>
                <li class="nav-item">
                    <a href="#messages" data-target="#messages" data-toggle="tab" class="nav-link nav-link-2">Đổi Mật
                        Khẩu</a>
                </li>
                <li class="nav-item">
                    <a href="#edit" data-target="#edit" data-toggle="tab" class="nav-link nav-link-2">Đơn Hàng</a>
                </li>
                <li class="nav-item">
                    <a href="#my-coupon-code" data-target="#my-coupon-code" data-toggle="tab"
                       class="nav-link nav-link-2">Mã khuyến
                        mãi</a>
                </li>
                <li class="nav-item">
                    <a href="#like" data-target="#like" data-toggle="tab" class="nav-link nav-link-2">Yêu Thích</a>
                </li>
            </ul>
            <div class="tab-content py-4">
                <div class="tab-pane active" id="profile">
                    <!-- <h5 class="mb-3">Thông Tin Tài Khoản</h5> -->
                    <div class="row">
                        <div class="col-md-12">
                            <header>
                                <h1>HỒ SƠ CỦA TÔI</h1>
                                <div class="content">Quản lý thông tin hồ sơ để bảo mật tài khoản</div>
                            </header>
                            <div class="form-group" style="display: none">
                                <input class="form-control" type="text" value="edit" name="type">
                            </div>
                            <form id="formAcount" class="formAcount validate clearfix" action="user" method="post">
                                <div class="form-group clearfix">
                                    <div class="row">
                                        <label class="col-md-3 control-label"> Họ tên: <span>(*)</span></label>
                                        <div class="col-lg-6 col-md-9">
                                            <input type="text" id="fullName" name="fullName" required
                                                   value="${sessionScope.user_name}" placeholder="Họ tên"
                                                   class="validate[required,minSize[4],maxSize[32]] form-control input-sm">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group clearfix">
                                    <div class="row">
                                        <label class="col-md-3 control-label">Ngày sinh: <span></span></label>
                                        <div class="col-lg-6 col-md-9">
                                            <input type="date" id="birthday" name="birthday"
                                                   value="${sessionScope.user_birth}" placeholder="Ngày sinh"
                                                   class="validate[required] form-control input-sm">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group clearfix">
                                    <div class="row">
                                        <label class="col-md-3 control-label">Điện thoại: <span></span></label>
                                        <div class="col-lg-6 col-md-9">
                                            <input type="text" id="mobile" name="mobile"
                                                   value="0${sessionScope.user_phone}" placeholder="Điện thoại"
                                                   class="validate[required,custom[phone]] form-control input-sm">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group clearfix">
                                    <div class="row">
                                        <label class="col-md-3 control-label">Email: <span>(*)</span></label>
                                        <div class="col-lg-6 col-md-9">
                                            <input type="text" id="email" name="email" value="${sessionScope.user_mail}"
                                                   placeholder="Email"
                                                   class="validate[required,custom[email]] form-control input-sm" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group clearfix">
                                    <div class="row">
                                        <label class="col-md-3 control-label">Tỉnh/Thành phố : <span>(*)</span></label>
                                        <div class="col-lg-6 col-md-9">
                                            <input type="text" id="city" name="city" value="${sessionScope.city}"
                                                   placeholder="Tỉnh/ Thành phố"
                                                   class="validate[required,custom[email]] form-control input-sm">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group clearfix">
                                    <div class="row">
                                        <label class="col-md-3 control-label">Quận/ Huyện: <span>(*)</span></label>
                                        <div class="col-lg-6 col-md-9">
                                            <input type="text" id="district" name="district"
                                                   value="${sessionScope.district}"
                                                   placeholder="Quận/ Huyện"
                                                   class="validate[required,custom[email]] form-control input-sm">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group clearfix">
                                    <div class="row">
                                        <label class="col-md-3 control-label">Xã/ Phường/ Thị trấn:
                                            <span>(*)</span></label>
                                        <div class="col-lg-6 col-md-9">
                                            <input type="text" id="ward" name="ward" value="${sessionScope.ward}"
                                                   placeholder="Xã/ Phường/ Thị trấn"
                                                   class="validate[required,custom[email]] form-control input-sm">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group clearfix">
                                    <div class="row">
                                        <label class="col-md-3 control-label">Địa chỉ chi tiết: <span>(*)</span></label>
                                        <div class="col-lg-6 col-md-9">
                                            <input type="text" id="address" name="address"
                                                   value="${sessionScope.detail}"
                                                   placeholder="Địa chỉ chi tiết"
                                                   class="validate[required] form-control input-sm">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group clearfix">
                                    <div class="row">
                                        <label class="col-md-3 control-label"></label>
                                        <div class="col-lg-6 col-md-9">
                                            <input type="submit" class="btn-update" value="CẬP NHẬT">
                                            <!-- <button type="submit" class="btn-update">CẬP NHẬT                                      -->
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!--/row-->
                </div>
                <div class="tab-pane" id="messages">
                    <!-- <h5 class="mb-3">Thông Tin Tài Khoản</h5> -->
                    <div class="row">
                        <div class="col-md-12">
                            <header>
                                <h1>THAY ĐỔI MẬT KHẨU</h1>
                                <div class="content">Bạn nên cập nhật mật khẩu thường xuyên vì lí do bảo mật</div>
                            </header>
                            <form id="formPass" class="formAcount validate clearfix" method="post" action="user">
                                <div class="form-group clearfix">
                                    <div class="row">
                                        <label class="col-md-3 control-label"> Mật khẩu cũ: </label>
                                        <div class="col-lg-6 col-md-9">
                                            <input type="password"  name="passwd-old" id="passwd-old"
                                                   class="validate[required,minSize[4],maxSize[32]] form-control input-sm">
                                            <label id="mk-old-notice" class="invisible notice">Trường này không được trống</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group clearfix">
                                    <div class="row">
                                        <label class="col-md-3 control-label"> Mật khẩu mới: </label>
                                        <div class="col-lg-6 col-md-9">
                                            <input type="password" id="passwd" name="passwd"
                                                   class="validate[required,minSize[4],maxSize[32]] form-control input-sm">
                                            <label id="mk-notice" class="invisible notice">Mật khẩu phải dài từ 8 - 25
                                                kí tự và phải chứa cả số và chữ in hoa</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group clearfix">
                                    <div class="row">
                                        <label class="col-md-3 control-label"> Xác nhận mật khẩu: </label>
                                        <div class="col-lg-6 col-md-9">
                                            <input type="password" id="pass-again" name="pass-again"
                                                   class="validate[required,minSize[4],maxSize[32]] form-control input-sm">
                                            <label id="mka-notice" class="invisible notice">Mật khẩu phải trùng khớp với
                                                mật khẩu mới đã nhập</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group clearfix">
                                    <div class="row">
                                        <label class="col-md-3 control-label"></label>
                                        <div class="col-lg-6 col-md-9">
                                            <button type="submit" class="btn-update">LƯU
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!--/row-->
                </div>
                <div class="tab-pane myorder__style" id="edit">
                    <!-- <div class="heading">Đơn hàng của tôi</div> -->
                    <div class="inner">
                        <table>
                            <thead>
                            <tr>
                                <th>Mã đơn hàng</th>
                                <th>Ngày mua</th>
                                <th>Thanh toán</th>
                                <th>Trạng thái đơn hàng</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${order}" var="o">
                                <tr>
                                    <td>
                                        <a href="order_detail?id=${o.id}">${o.id}</a>
                                    </td>
                                    <td>${o.date_created}</td>
                                    <td>
                                        <c:if test="${o.payment==true}">Tiền mặt</c:if>
                                        <c:if test="${o.payment==false}">Ví momo</c:if>
                                    </td>
                                    <td>
                                        <c:if test="${o.status==1}">Đã hủy </c:if>
                                        <c:if test="${o.status==2}">Bị từ chối </c:if>
                                        <c:if test="${o.status==3}">Đang xử lí </c:if>
                                        <c:if test="${o.status==4}">Đang đóng gói </c:if>
                                        <c:if test="${o.status==5}">Đang vận chuyển </c:if>
                                        <c:if test="${o.status==6}">Thành công </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="tab-pane myorder__style " id="my-coupon-code">
                    <!-- <div class="heading">Đơn hàng của tôi</div> -->
                    <div class="inner">
                        <table>
                            <thead>
                            <tr>
                                <th>Mã giảm giá</th>
                                <th>% Giảm giá</th>
                                <th>Ngày còn lại</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${sessionScope.coupon_code}" var="cd">
                                <tr>
                                    <td>${cd.code}</td>
                                    <td>${cd.percent}</td>
                                    <td>Còn ${cd.date_number} ngày</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="tab-pane " id="like">
                    <div class="row">
                        <c:forEach items="${sessionScope.favorite}" var="f">
                            <c:set var="price" value="${f.price}"></c:set>
                            <div class="col-lg-4 col-md-6 col-sm-6">
<%--                                <div class="product__item">--%>
<%--                                    <div class="product__item__pic set-bg" data-setbg="${f.img}">--%>
<%--                                        <ul class="product__item__pic__hover">--%>
<%--                                            <li class="subFa cursor-pointer" data-current_page="user" data-pro_id="${f.id}"><a ><i class="fa fa-close"></i></a></li>--%>
<%--                                            <li class="addCart cursor-pointer" data-current_page="user" data-pro_id="${f.id}"><a ><i class="fa fa-shopping-cart"></i></a></li>--%>
<%--                                        </ul>--%>
<%--                                    </div>--%>
<%--                                    <div class="product__item__text">--%>
<%--                                        <h6><a href="shop-detail?id=${f.id}">${f.name}</a></h6>--%>
<%--                                        <h5><%= Util.formatCurrency((double) pageContext.getAttribute("price"))%></h5>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
    <div class="featured__item">
        <div class="featured__item__pic ">
            <a href="/shop-detail?product=${f.slug}"><img src="${f.img}" alt=""></a>
            <ul class="featured__item__pic__hover">
                <li class="subFa cursor-pointer" data-current_page="user" data-pro_id="${f.id}"><a ><i class="fa fa-close"></i></a></li>
                 <li class="addCart cursor-pointer" data-current_page="user" data-pro_id="${f.id}"><a ><i class="fa fa-shopping-cart"></i></a></li>
            </ul>
        </div>
        <div class="featured__item__text">
            <h4 class=" text-truncate" data-toggle="tooltip"><a href="#">${f.name}</a></h4>
            <h5>${Util.formatCurrency(f.price)}</h5>
            <p>Đã bán ${f.sold}</p>
        </div>

    </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <!--/row-->
            </div>

        </div>

    </div>
</div>
<c:if test="${status==2}">
    <div class="modal fade" id="wrong_info_login" tabindex="-1" role="dialog"  aria-hidden="true">
        <div class="modal-dialog forget-dialog" role="document">
            <div class="modal-content forget-content">
                <div class="modal-header forget-header">
                    <h5 class="modal-title forget-title">Thông báo</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="x">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body forget-body">
                    <!-- <h5 class="forget-h5">Vui lòng nhập Email bạn đã đăng kí để lấy lại mật khẩu</h5> -->
                    <div>
                        <p>${status_content}</p>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary forget-send" data-dismiss="modal">ĐÓNG</button>
                </div>
            </div>
        </div>
    </div>
</c:if>
<!-- User Section End -->
<jsp:include page="footer.jsp"></jsp:include>

<!-- Js Plugins -->
<script src="user_page/js/jquery-3.3.1.min.js"></script>
<script src="user_page/js/bootstrap.min.js"></script>
<script src="user_page/js/jquery.nice-select.min.js"></script>
<script src="user_page/js/jquery-ui.min.js"></script>
<script src="user_page/js/jquery.slicknav.js"></script>
<script src="user_page/js/mixitup.min.js"></script>
<script src="user_page/js/owl.carousel.min.js"></script>
<script src="user_page/js/main.js"></script>
<script src="user_page/js/main_home.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.15.0/jquery.validate.js"></script>
<script>
    $(document).ready(function () {
        $("#formAcount").validate({
            rules: {
                fullname: {
                    required: true
                },
                email: {
                    required: true,
                    email: true
                },
                cityID: {
                    required: true
                },
                district: {
                    required: true
                },
                ward: {
                    required: true
                },
                address: {
                    required: true
                }
            },
            messages: {
                fullname: {
                    required: "Xin vui lòng nhập tên"
                },
                email: {
                    required: "Xin vui lòng nhập email",
                    email: "Email không hợp lệ, xin vui lòng nhập lại"
                },
                cityID: {
                    required: "Xin chọn tỉnh/thành phố"
                },
                district: {
                    required: "Xin vui lòng nhập quận/huyện"
                },
                ward: {
                    required: "Xin vui lòng nhập xã/ phường/ thị trấn"
                },
                address: {
                    required: "Xin vui lòng nhập địa chỉ"
                }
            }
        });
    });
</script>
</body>
</html>
