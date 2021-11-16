<%@ page import="vn.thegioicaycanh.model.util.Util" %><%--
  Created by IntelliJ IDEA.
  User: Trinh Quang Tien
  Date: 26/01/2021
  Time: 19:27
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="vi-VN">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Giỏ hàng</title>
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
<body
        <c:if test="${position != null}">
            <c:out value="Co vo"></c:out>
            onload="load(${position})"
        </c:if>
>
<jsp:include page="Menu.jsp"></jsp:include>
<jsp:include page="search_bar.jsp"></jsp:include>
<!-- Breadcrumb Section End -->
<!-- Shoping Cart Section Begin -->
<section class="shoping-cart spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="shoping__cart__table">
                    <table>
                        <thead>
                        <tr>
                            <th class="shoping__product">Sản phẩm</th>
                            <th>Giá bán</th>
                            <th>Số lượng</th>
                            <th>Tổng</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <%System.out.println(request.getAttribute("cis"));%>
                        <c:forEach var="ci" items="${cis}">
                        <tr>
                            <c:set var="ps" value="${ci.price_sale}"></c:set>
                            <c:set var="p" value="${ci.price}"></c:set>
                            <c:set var="total" value="${ci.totalPrice}"></c:set>
                            <td class="shoping__cart__item">
                                <img src="${ci.img}" alt="">
                                <h5>${ci.name}</h5>
                            </td>
                            <td class="shoping__cart__price">

                                <c:if test="${ci.sale==true}">
                                    <%=Util.formatCurrency((double) pageContext.getAttribute("ps"))%>
                                <span style="text-decoration: line-through;margin-left: 5px;color: gray;font-size: 13px">
                                <%=Util.formatCurrency((double) pageContext.getAttribute("p"))%>
                                </span>
                                </c:if>
                                <c:if test="${ci.sale==false}">
                                    <%=Util.formatCurrency((double) pageContext.getAttribute("p"))%>
                                </c:if>
                            </td>
                            <td class="shoping__cart__quantity">
                                <div class="quantity">
                                    <div class="pro-qty" data-pro_id="${ci.id}">
                                        <input type="text" value="${ci.quantity}">
                                    </div>
                                </div>
                            </td>
                            <td class=" shoping__cart__total">
                            <%=Util.formatCurrency((double) pageContext.getAttribute("total"))%>
                            </td>
                            <td class="shoping__cart__item__close">
                                <a href="cart-handle?current-page=cart&id=${ci.id}&action=del" class="icon_close"></a>
                            </td>
                        </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="shoping__cart__btns">
                    <a href="shopping" class="primary-btn cart-btn">TIẾP TỤC MUA SẮM</a>

                </div>
            </div>
            <c:if test="${sessionScope.user_id!=null}">
            <div class="col-lg-6">
                <div class="shoping__continue">
                    <div class="shoping__discount">
                        <h5>Mã giảm giá</h5>
                        <form action="cart" method="post">
                            <input type="text" placeholder="Nhập mã giãm giá mua hàng" name="code">
                            <button type="submit" class="site-btn">SỬ DỤNG MÃ</button>
                        </form>
                    </div>
                </div>
            </div>
            </c:if>
            <div class="col-lg-6" >
                <div class="shoping__checkout">
                    <h5>TỔNG TIỀN GIỎ HÀNG</h5>
                    <ul>
                        <c:set var="fp_ori" value="${fp_ori}"></c:set>
                        <c:set var="fp_new" value="${fp_new}"></c:set>
                        <c:set var="fp_sale" value="${fp_sale}"></c:set>
                        <c:if test="${fp_ori!=fp_new}">
                            <li>Tổng<span style="text-decoration:line-through"><%=Util.formatCurrency((double)pageContext.getAttribute("fp_ori"))%></span></li>
                            <li>Giảm<span><%=Util.formatCurrency((double)pageContext.getAttribute("fp_sale"))%></span></li>
                            <li>Tổng<span><%=Util.formatCurrency((double)pageContext.getAttribute("fp_new"))%></span></li>
                        </c:if>
                        <c:if test="${fp_ori==fp_new}">
                            <li>Tổng<span><%=Util.formatCurrency((double)pageContext.getAttribute("fp_ori"))%></span></li>
                        </c:if>


                        <!-- <li>Tổng tất cả <span>439.000VNĐ</span></li> -->
                    </ul>
                    <a href="checkout" class="primary-btn">TIẾN HÀNH THANH TOÁN</a>
                </div>
            </div>
        </div>
    </div>
</section>

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
