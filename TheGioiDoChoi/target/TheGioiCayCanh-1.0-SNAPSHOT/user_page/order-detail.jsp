<%@ page import="vn.thegioicaycanh.model.util.Util" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="vi-VN">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>${title}</title>
    <link href="img/icon/icon-logo.png" rel="shortcut icon">


    <!-- Css Styles -->
    <link rel="stylesheet" href="user_page/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="user_page/css/style.css" type="text/css">
</head>

<body>
<jsp:include page="Menu.jsp"></jsp:include>
<jsp:include page="search_bar.jsp"></jsp:include>
<!-- Follow Section Begin -->
<section class="follow spad">
<%--    <c:set var="or" value="${order}"></c:set>--%>
    <div class="container">
        <div class="row">
            <div class="col-lg">
                <div class="Account__Style">
                    <div class="heading">
                        <span>Chi tiết đơn hàng #${order.id}</span>
                        <span class="split">-</span>
                        <span class="status">Giao hàng thành công</span>
                    </div>
                    <div class="created-date">Ngày đặt hàng: ${order.date_created}</div>
                    <div class="styles_section-2">
                        <div class="styles_group_1">
                            <div class="title">Địa chỉ người nhận</div>
                            <div class="content">
                                <p class="name">${order.user_name}</p>
                                <p class="address">
                                    <span>Địa chỉ: </span>
                                    ${order.address}
                                </p>
                                <p class="phone">
                                    <span>Điện thoại: </span>0${order.phone}
                                </p>
                            </div>
                        </div>
                        <div class="styles_group_1">
                            <div class="title">Hình thức giao hàng</div>
                            <div class="content">
                                <p>Vận chuyển</p>
                            </div>
                        </div>
                        <div class="styles_group_1">
                            <div class="title">Hình thức thanh toán</div>
                            <div class="content">
                                <c:if test="${order.payment==true}"><p class="">Thanh toán tiền mặt khi nhận hàng</p></c:if>
                                <c:if test="${order.payment==false}"><p class="">Thanh toán qua ví Momo</p></c:if>
                            </div>
                        </div>
                    </div>
                    <table class="styles_section-3">
                        <thead>
                        <tr>
                            <th>Sản phẩm</th>
                            <th>Giá</th>
                            <th>Số lượng</th>
                            <th>Giảm giá</th>
                            <th>Tạm tính</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${p_list}" var="pl">
                        <c:set var="price" value="${pl.price}"></c:set>
                        <c:set var="sale" value="${pl.sale}"></c:set>
                        <c:set var="total" value="${pl.total}"></c:set>
                        <tr>
                            <td>
                                <div class="product-item">
                                    <img src="${pl.img}" alt="${pl.pro_name}">
                                    <div class="product-info">
                                        <a class="product-name" href="shop-detail?id=${pl.id}">${pl.pro_name}</a>
                                        <p class="product-seller">Cung cấp bởi Thế Giới Cây Cảnh</p>
                                        <div class="product-review">
                                            <a id="btn-comment" href="#" data-toggle="modal"
                                               data-target="#exampleModalCenter">Viết nhận xét</a>
                                            <a href="warranty?order_id=${order.id}&pro_id=${pl.pro_id}&user_id=${sessionScope.user_id}" target="_blank">Bảo hành</a>
                                        </div>
                                    </div>
                                </div>

                            </td>
                            <td class="price"><%= Util.formatCurrency((double) pageContext.getAttribute("price"))%></td>
                            <td class="quantity">${pl.quantity}</td>
                            <td class="discount-amount"><%= Util.formatCurrency((double) pageContext.getAttribute("sale"))%></td>
                            <td class="raw-total"><%= Util.formatCurrency((double) pageContext.getAttribute("total"))%></td>
                        </tr>
                        </c:forEach>
                        </tbody>
                        <tfoot>
                        <c:set var="sum" value="${sum}"></c:set>
                        <c:set var="ship" value="${ship}"></c:set>
                        <c:set var="total_money" value="${total_money}"></c:set>
                        <tr>
                            <td colspan="4">
                                <span>Tạm tính</span>
                            </td>
                            <td><%= Util.formatCurrency((double) pageContext.getAttribute("sum"))%></td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <span>Phí vận chuyển</span>
                            </td>
                            <td><%= Util.formatCurrency((double) pageContext.getAttribute("ship"))%></td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <span>Tổng cộng</span>
                            </td>
                            <td>
                                <span class="sum"><%= Util.formatCurrency((double) pageContext.getAttribute("total_money"))%></span>
                            </td>
                        </tr>
                        </tfoot>
                    </table>
                    <a class="view-list-order" href="user">Quay lại đơn hàng của tôi</a>
                    <button class="cancel-order" disabled="">Hủy Đơn Hàng</button>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 style="color:#7fad39 ;" class="modal-title" id="exampleModalLongTitle">Viết nhận xét</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- <div class="container-cm col-lg-12"> -->

                <!-- <h5>ĐÁNH GIÁ SẢN PHẨM</h5> -->
                <!-- <form id="form-cm"> -->
                <!-- <label for="sao">Đánh giá của bạn về sản phẩm này</label> -->
                <select class="fullname-cm" name="star">
                    <option value="154" selected>😍 Rất tốt</option>
                    <option value="155">😀 Tốt</option>
                    <option value="156">🙂 Được</option>
                    <option value="157">😐 Tệ</option>
                    <option value="158">😌 Rất tệ</option>
                </select>
                <!-- <h6>Viết nhận xét của bạn vào bên dưới:</h6> -->
                <input class="message" type="text" name="message"
                       placeholder="Hãy chia sẻ những điều bạn thích về sản phẩm này nhé!"
                       style="background-color: white"><br>
                <label for="">Thêm hình sản phẩm nếu có (tối đa 5 hình): </label>
                <button style="color: #ffffff;background-color:#5e6158;border-radius: 5px;" class="chonhinh">Chọn Hình
                </button>
                <br>
                <button type="button" class="submit-cm" name="submit-cm">Gửi Nhận Xét</button>

            </div>
        </div>
    </div>
</div>
<!-- Write comment section end -->

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


</body>

</html>