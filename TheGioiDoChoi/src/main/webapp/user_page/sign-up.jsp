<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi-VN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>${title}</title>
    <%-- Link icon --%>
    <link href="${applicationScope.header.shortcut}" rel="shortcut icon">
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
<%System.out.println("co vao day nua ne________________");%>
<jsp:include page="Menu.jsp"></jsp:include>

<jsp:include page="search_bar.jsp"></jsp:include>

<section class="sign-in spad">
    <div class="container">
        <div class="row sign__in sign__up">
            <div class="col-lg">
                <div class="sign__in__form sign__up__form">
                    <form action="handle-sign-up" id="formPass" method="post">
                        <button><a href="login" class="btn-dn">ĐĂNG NHẬP</a></button>
                        <button><a  class="btn-dk">ĐĂNG KÍ</a></button><br>
                        <input type="text" name="name" id="fname" placeholder="Họ Tên (*)" required><br>

                        <input type="number" name="phone" id="phone" placeholder="Điện Thoại (*)" required><br>
                        <input type="email" name="email" id="mail" placeholder="Email (*)" required><br>
                        <select name="city" id="city" required>
                            <option value="" disabled>Tỉnh/Thành phố (*)</option>
                            <option value="An Giang">An Giang</option>
                            <option value="Bà Rịa - Vũng Tàu">Bà Rịa - Vũng Tàu</option>
                            <option value="Bắc Giang">Bắc Giang</option>
                            <option value="Bắc Kạn">Bắc Kạn</option>
                            <option value="Bạc Liêu">Bạc Liêu</option>
                            <option value="Bắc Ninh">Bắc Ninh</option>
                            <option value="Bến Tre">Bến Tre</option>
                            <option value="Bình Định">Bình Định</option>
                            <option value="Bình Dương">Bình Dương</option>
                            <option value="Bình Phước">Bình Phước</option>
                            <option value="Bình Thuận">Bình Thuận</option>
                            <option value="Cần Thơ">Cần Thơ</option>
                            <option value="Cà Mau">Cà Mau</option>
                            <option value="Cao Bằng">Cao Bằng</option>
                            <option value="Đà Nẵng">Đà Nẵng</option>
                            <option value="Đắk Lắk">Đắk Lắk</option>
                            <option value="Đắk Nông">Đắk Nông</option>
                            <option value="Điện Biên">Điện Biên</option>
                            <option value="Đồng Nai">Đồng Nai</option>
                            <option value="Đồng Tháp">Đồng Tháp</option>
                            <option value="Gia Lai">Gia Lai</option>
                            <option value="Hải Phòng">Hải Phòng</option>
                            <option value="Hà Nội">Hà Nội</option>
                            <option value="Hà Giang">Hà Giang</option>
                            <option value="Hà Nam">Hà Nam</option>
                            <option value="Hà Tĩnh">Hà Tĩnh</option>
                            <option value="Hải Dương">Hải Dương</option>
                            <option value="Hậu Giang">Hậu Giang</option>
                            <option value="Hòa Bình">Hòa Bình</option>
                            <option value="Hưng Yên">Hưng Yên</option>
                            <option value="Khánh Hòa">Khánh Hòa</option>
                            <option value="Kiên Giang">Kiên Giang</option>
                            <option value="Kon Tum">Kon Tum</option>
                            <option value="Lai Châu">Lai Châu</option>
                            <option value="Lâm Đồng">Lâm Đồng</option>
                            <option value="Lạng Sơn">Lạng Sơn</option>
                            <option value="Lào Cai">Lào Cai</option>
                            <option value="Long An">Long An</option>
                            <option value="Nam Định">Nam Định</option>
                            <option value="Nghệ An">Nghệ An</option>
                            <option value="Ninh Bình">Ninh Bình</option>
                            <option value="Ninh Thuận">Ninh Thuận</option>
                            <option value="Phú Thọ">Phú Thọ</option>
                            <option value="Phú Yên">Phú Yên</option>
                            <option value="Quảng Bình">Quảng Bình</option>
                            <option value="Quảng Nam">Quảng Nam</option>
                            <option value="Quảng Ngãi">Quảng Ngãi</option>
                            <option value="Quảng Ninh">Quảng Ninh</option>
                            <option value="Quảng Trị">Quảng Trị</option>
                            <option value="Sóc Trăng">Sóc Trăng</option>
                            <option value="Sơn La">Sơn La</option>
                            <option value="Thành phố Hồ Chí Minh">Thành phố Hồ Chí Minh</option>
                            <option value="Tây Ninh">Tây Ninh</option>
                            <option value="Thái Bình">Thái Bình</option>
                            <option value="Thái Nguyên">Thái Nguyên</option>
                            <option value="Thanh Hóa">Thanh Hóa</option>
                            <option value="Thừa Thiên Huế">Thừa Thiên Huế</option>
                            <option value="Tiền Giang">Tiền Giang</option>
                            <option value="Trà Vinh">Trà Vinh</option>
                            <option value="Tuyên Quang">Tuyên Quang</option>
                            <option value="Vĩnh Long">Vĩnh Long</option>
                            <option value="Vĩnh Phúc">Vĩnh Phúc</option>
                            <option value="Yên Bái">Yên Bái</option>

                        </select><br>
                        <input type="text" name="district" id="district" placeholder="Quận/ Huyện (*)" required>
                        <input type="text" name="warm" id="warm" placeholder="Xã/ Phường/ Thị trấn (*)" required>
                        <input type="text" name="address" id="address" placeholder="Địa Chỉ Chi Tiết (*)" required>
                        <input type="password" name="new-pass" id="passwd" placeholder="Mật Khẩu" required><br>
                        <label id="mk-notice" class="invisible" style="color: red">Mật khẩu phải dài từ 8-25 kí tự và phải chứa cả số và chữ in hoa</label>

                        <input type="password" name="new-pass-con" id="pass-again" placeholder="Nhập Lại Mật Khẩu" required><br>
                        <label class="invisible" id="mka-notice" style="color: red">Mật khẩu phải trùng khớp với mật khẩu đã nhập</label>

                        <input type="submit" name="submit" id="submit" value="ĐĂNG KÝ"><br>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
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

<jsp:include page="footer.jsp"></jsp:include>

<%--<script></script>--%>
<%--<script src="js/jquery-3.3.1.min.js"></script>--%>
<script src="user_page/js/jquery-3.3.1.min.js"></script>
<script src="user_page/js/bootstrap.min.js"></script>
<script src="user_page/js/jquery.nice-select.min.js"></script>
<script src="user_page/js/jquery-ui.min.js"></script>
<script src="user_page/js/jquery.slicknav.js"></script>
<script src="user_page/js/mixitup.min.js"></script>
<script src="user_page/js/owl.carousel.min.js"></script>
<script src="user_page/js/main.js"></script>
</body>