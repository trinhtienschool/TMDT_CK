<%@ page import="vn.thegioicaycanh.model.util.Util" %>
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

	<!-- Datatables CSS -->
	<link rel="stylesheet" href="assets/plugins/datatables/datatables.min.css">

	<!-- Datepicker CSS -->
	<link rel="stylesheet" href="assets/css/bootstrap-datetimepicker.min.css">

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
							<h3 class="page-title">Vận chuyển</h3>
						</div>
<%--						<div class="col-auto text-right">--%>
<%--							<a class="btn btn-white filter-btn" href="javascript:void(0);" id="filter_search">--%>
<%--								<i class="fas fa-filter"></i>--%>
<%--							</a>--%>
<%--							<a href="add-shipments.html" class="btn btn-primary add-button ml-3">--%>
<%--								<i class="fas fa-plus"></i>--%>
<%--							</a>--%>
<%--						</div>--%>
					</div>
				</div>
				<!-- /Page Header -->
				
				<!-- Search Filter -->
				<div class="card filter-card" id="filter_inputs">
					<div class="card-body pb-0">
						<form action="#" method="post">
							<div class="row filter-row">

                                <!-- thay đổi ở đây ************************ -->
                                <!-- Thay đổi theo danh sách đề mục -->
								<div class="col-sm-6 col-md-3">
									<div class="form-group">
										<label>Ship id</label>
										<input class="form-control" type="text">
									</div>
								</div>
								<div class="col-sm-6 col-md-3">
									<div class="form-group">
										<label>Từ Ngày</label>
										<div class="cal-icon">
											<input class="form-control datetimepicker" type="text">
										</div>
									</div>
								</div>
								<div class="col-sm-6 col-md-3">
									<div class="form-group">
										<label>Đến Ngày</label>
										<div class="cal-icon">
											<input class="form-control datetimepicker" type="text">
										</div>
									</div>
								</div>
								<div class="col-sm-6 col-md-3">
									<div class="form-group">
										<button class="btn btn-primary btn-block" type="submit">Chọn</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
				<!-- /Search Filter -->
				
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-hover table-center mb-0 datatable">
                                        <!-- Thay đổi code ở đây Thay đổi theo file word -->
										<thead>
											<tr>
												<th>ID</th>
												<th>Mã đơn hàng</th>
												<th>Ngày vận chuyển</th>
												<th>Loại khối lượng</th>
												<th>Giá</th>
<%--												<th class="text-right">Hành Động</th>--%>
											</tr>
                                        </thead>
                                        
                                        <!-- Thêm vào nội dung ở đây -->
										<tbody>
											<c:forEach items="${s_view}" var="sv">
												<c:set var="price" value="${sv.price}"></c:set>
												<tr>
													<td>${sv.id}</td>
													<td>${sv.order_id}</td>
													<td>${sv.date_created}</td>
													<td>${sv.type_weight}</td>
													<td><%= Util.formatCurrency((double)pageContext.getAttribute("price")) %></td>
<%--													<td class="text-right">--%>
<%--														<a href="view-shipments.html" class="btn btn-sm bg-info-light">--%>
<%--															<i class="far fa-eye mr-1"></i> Chi tiết--%>
<%--														</a>--%>
<%--													</td>--%>
												</tr>
											</c:forEach>
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

	<!-- Slimscroll JS -->
	<script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>

	<!-- Datatables JS -->
	<script src="assets/plugins/datatables/datatables.min.js"></script>
	<!-- Select2 JS -->
	<script src="assets/js/select2.min.js"></script>
	<!-- Custom JS -->
	<script src="assets/js/admin.js"></script>

</body>

</html>
	