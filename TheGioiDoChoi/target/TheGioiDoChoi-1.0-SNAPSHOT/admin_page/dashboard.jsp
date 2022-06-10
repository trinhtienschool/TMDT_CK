<%@ page import="vn.thegioidochoi.model.util.Util" %>
<%@ page import="java.util.Arrays" %>
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
			
				<!-- Page Header -->
				<div class="page-header">
					<div class="row">
						<div class="col-12">
							<h3 class="page-title">Dashboard</h3>
						</div>
					</div>
				</div>
				<!-- /Page Header -->
				
				<div class="row">
					<div class="col-xl-3 col-sm-6 col-12">
						<div class="card">
							<div class="card-body">
								<div class="dash-widget-header">
									<span class="dash-widget-icon bg-primary">
										<i class="far fa-user"></i>
									</span>
									<div class="dash-widget-info">
										<h3>${c_user}</h3>
										<h6 class="text-muted">Người dùng</h6>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-sm-6 col-12">
						<div class="card">
							<div class="card-body">
								<div class="dash-widget-header">
									<span class="dash-widget-icon bg-primary">
										<i class="fas fa-qrcode"></i>
									</span>
									<div class="dash-widget-info">
										<h3>${c_product}</h3>
										<h6 class="text-muted">Sản phẩm</h6>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-sm-6 col-12">
						<div class="card">
							<div class="card-body">
								<div class="dash-widget-header">
									<span class="dash-widget-icon bg-primary">
										<i class="fas fa-user-shield"></i>
									</span>
									<div class="dash-widget-info">
										<h3>${c_supplier}</h3>
										<h6 class="text-muted">Nhà cung cấp</h6>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row" style="margin: 0 !important;">
					<div class="col-md-8">
						<!-- Recent Bookings -->
						<div class="card card-table flex-fill">
							<div class="card-header">
								<h4 class="card-title">Doanh thu</h4>
							</div>
							<div class="card-body">
								<!--								style="width:100%;max-width:700px"-->
								<%
									int[] total = {6,8,4,3,22,4,6};
									pageContext.setAttribute("total_price", Arrays.toString(total));
									
								%>
								<canvas data-revenue="${pageContext.getAttribute("total_price")}" id="revenue" ></canvas>
							</div>
						</div>
						<!-- /Recent Bookings -->
					</div>
					<div class="col-md-4">
						<!-- Recent Bookings -->
						<div class="card card-table flex-fill">
							<div class="card-header">
								<h4 class="card-title">Trạng thái đơn hàng</h4>
							</div>
							<div class="card-body">
								<canvas id="order-status"></canvas>
							</div>
						</div>
						<!-- /Recent Bookings -->
					</div>
				</div>
				<div class="row" style="margin: 0 !important;">
					<div class="col-md-12 d-flex">
					
						<!-- Recent Bookings -->
						<div class="card card-table flex-fill">
							<div class="card-header">
								<h4 class="card-title">Đặt hàng gần đây</h4>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-center">
										<thead>
											<tr>
												<th>Tên khách hàng</th>
												<th>Ngày đặt</th>
												<th>Trạng thái</th>
												<th>Tổng tiền</th>
											</tr>
										</thead>
										<tbody>
										<c:forEach items="${orderlist}" var="ol">
											<c:set var="total_pay" value="${ol.total_pay}"></c:set>
											<tr>
												<td>${ol.user_name}</td>
												<td class="text-nowrap">${ol.date_created}</td>
												<td>
													<c:if test="${ol.status==1}"><span class="badge badge-danger">Đã hủy</span></c:if>
													<c:if test="${ol.status==2}"><span class="badge badge-warning">Bị từ chối</span></c:if>
													<c:if test="${ol.status==3}"><span class="badge badge-dark">Đang xử lí</span></c:if>
													<c:if test="${ol.status==4}"><span class="badge badge-primary">Đang đóng gói</span></c:if>
													<c:if test="${ol.status==5}"><span class="badge badge-info">Đang vận chuyển</span></c:if>
													<c:if test="${ol.status==6}"><span class="badge badge-success">Hoàn thành</span></c:if>
												</td>
												<td>
													<div class="font-weight-600"><%= Util.formatCurrency((double)pageContext.getAttribute("total_pay")) %></div>
												</td>
											</tr>
										</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<!-- /Recent Bookings -->
						
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
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script>

		const weekday = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"];

		const d = new Date();
		let day_arr = []
		for(let i = 1;i<=7;i++){
			let date_before = new Date(d.getTime() - (i * 24 * 60 * 60 * 1000));
			day_arr.push(weekday[date_before.getDay()])
		}




		const data_revenue = {
			labels: day_arr,
			datasets: [
				{
					label: 'Doanh thu (1000đ)',
					data: [0, 10, 5, 2, 20, 30, 45],
					borderColor: 'rgb(127, 173, 57)',
					backgroundColor: 'rgba(127,173,57,0.46)',
					fill : 'start',
					tension: 0.3
				}
			]
		};
		const data_order_status = {
			labels: [
				'Đang giao',
				'Đã xác nhận',
				'Đã hủy'
			],
			datasets: [{
				label: 'Trạng thái',
				data: [300, 50, 100],
				backgroundColor: [
					'rgb(255, 99, 132)',
					'rgb(54, 162, 235)',
					'rgb(255, 205, 86)'
				],
				hoverOffset: 4
			}]
		};
		const config_order_status = {
			type: 'doughnut',
			data: data_order_status,
		};
		const config_revenue = {
			type: 'line',
			data: data_revenue,
			options: {}
		};
	</script>
	<script>
		let revenue_chart = new Chart(
				document.getElementById('revenue'),
				config_revenue
		);
		revenue_chart.destroy()

		let order_status_chart = new Chart(
				document.getElementById('order-status'),
				config_order_status
		);
		order_status_chart.destroy()
	</script>

</body>

</html>