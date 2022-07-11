(function($) {
  "use strict";

	// Variables declarations

	$("#delete-product-announcement").on('click', function(e) {
		console.log("Da delete san pham");
	});
	$("#delete-product-button").on('click', function(e) {
		$('#wrong_info_login').modal('show');
		console.log("Da delete san pham");
	});
	var $wrapper = $('.main-wrapper');
	var $pageWrapper = $('.page-wrapper');
	//var $slimScrolls = $('.slimscroll');
	
	// Sidebar
	
	var Sidemenu = function() {
		this.$menuItem = $('#sidebar-menu a');
	};
	
	function init() {
		var $this = Sidemenu;
		$('#sidebar-menu a').on('click', function(e) {
			if($(this).parent().hasClass('submenu')) {
				e.preventDefault();
			}
			if(!$(this).hasClass('subdrop')) {
				$('ul', $(this).parents('ul:first')).slideUp(350);
				$('a', $(this).parents('ul:first')).removeClass('subdrop');
				$(this).next('ul').slideDown(350);
				$(this).addClass('subdrop');
			} else if($(this).hasClass('subdrop')) {
				$(this).removeClass('subdrop');
				$(this).next('ul').slideUp(350);
			}
		});
		$('#sidebar-menu ul li.submenu a.active').parents('li:last').children('a:first').addClass('active').trigger('click');
	}
	
	// Sidebar Initiate
	init();
	
	// Mobile menu sidebar overlay
	
	$('body').append('<div class="sidebar-overlay"></div>');
	$(document).on('click', '#mobile_btn', function() {
		$wrapper.toggleClass('slide-nav');
		$('.sidebar-overlay').toggleClass('opened');
		$('html').addClass('menu-opened');
		return false;
	});
	
	// Sidebar overlay
	
	$(".sidebar-overlay").on("click", function () {
		$wrapper.removeClass('slide-nav');
		$(".sidebar-overlay").removeClass("opened");
		$('html').removeClass('menu-opened');
	});	
	
	// Select 2
	
	if ($('.select').length > 0) {
		$('.select').select2({
			minimumResultsForSearch: -1,
			width: '100%'
		});
	}

	$(document).on('click', '#filter_search', function() {
		$('#filter_inputs').slideToggle("slow");
	});

	// Datetimepicker
	
	if($('.datetimepicker').length > 0 ){
		$('.datetimepicker').datetimepicker({
			format: 'YYYY-MM-DD',
			icons: {
				up: "fas fa-angle-up",
				down: "fas fa-angle-down",
				next: 'fas fa-angle-right',
				previous: 'fas fa-angle-left'
			}
		});
	}

	// Tooltip
	
	if($('[data-toggle="tooltip"]').length > 0 ){
		$('[data-toggle="tooltip"]').tooltip();
	}
	
	// Datatable

    if ($('.datatable').length > 0) {
        $('.datatable').DataTable({
            "bFilter": false,
        });
    }

    // Owl Carousel

    if ($('.images-carousel').length > 0) {
		$('.images-carousel').owlCarousel({
			loop: true,
			center: true,
			margin: 10,
			responsiveClass: true,
			responsive: {
				0: {
					items: 1
				},
				600: {
					items: 1
				},
				1000: {
					items: 1,
					loop: false,
					margin: 20
				}
			}
		});
    }

	// Sidebar Slimscroll

	// if($slimScrolls.length > 0) {
	// 	$slimScrolls.slimScroll({
	// 		height: 'auto',
	// 		width: '100%',
	// 		position: 'right',
	// 		size: '7px',
	// 		color: '#ccc',
	// 		allowPageScroll: false,
	// 		wheelStep: 10,
	// 		touchScrollStep: 100
	// 	});
	// 	var wHeight = $(window).height() - 60;
	// 	$slimScrolls.height(wHeight);
	// 	$('.sidebar .slimScrollDiv').height(wHeight);
	// 	$(window).resize(function() {
	// 		var rHeight = $(window).height() - 60;
	// 		$slimScrolls.height(rHeight);
	// 		$('.sidebar .slimScrollDiv').height(rHeight);
	// 	});
	// }
	
	// Small Sidebar

	$(document).on('click', '#toggle_btn', function() {
		if($('body').hasClass('mini-sidebar')) {
			$('body').removeClass('mini-sidebar');
			$('.subdrop + ul').slideDown();
		} else {
			$('body').addClass('mini-sidebar');
			$('.subdrop + ul').slideUp();
		}
		setTimeout(function(){ 
			mA.redraw();
			mL.redraw();
		}, 300);
		return false;
	});
	
	$(document).on('mouseover', function(e) {
		e.stopPropagation();
		if($('body').hasClass('mini-sidebar') && $('#toggle_btn').is(':visible')) {
			var targ = $(e.target).closest('.sidebar').length;
			if(targ) {
				$('body').addClass('expand-menu');
				$('.subdrop + ul').slideDown();
			} else {
				$('body').removeClass('expand-menu');
				$('.subdrop + ul').slideUp();
			}
			return false;
		}
		
		$(window).scroll(function() {
			if ($(window).scrollTop() >= 30) {
				$('.header').addClass('fixed-header');
			} else {
				$('.header').removeClass('fixed-header');
			}
		});
		
		$(document).on('click', '#loginSubmit', function() {
			$("#adminSignIn").submit();
		});
		
	});

})(jQuery);
// bắt lỗi Đổi mật khẩu
$(document).ready(function () {


	$('.gallery-photo-add').on('change', function() {
		imagesPreview(this, 'div.gallery');
	});
	// $('.currency-format').on('change', function() {
	// 	formatCurrency($(this));
	// });
	$('.thumbnail-img').on('change', function() {
		imagesPreview(this, 'div.gallery-thumbnail-img');
	});
	$('#formPass').submit(function (e) {
		e.preventDefault();
		let passwd = $('#passwd').val();
		let pass_again = $('#pass-again').val();
		let checkpass = false;
		let checkpass_again = false;
		if (passwd.length < 8) {
			$('#mk-notice').addClass("visible");
			$('#mk-notice').removeClass("invisible");
			checkpass=false;
		}
		let up = false,
			num = false;
		for (let j = 0; j < passwd.length; j++) {
			let c = passwd.charCodeAt(j);
			if (c > 65 && c <= 90) {
				up = true;
			}
			if (c >= 48 && c <= 57) {
				num = true;
			}
		}

		if (passwd == pass_again) {
			$('#mka-notice').removeClass("visible");
			$('#mka-notice').addClass("invisible");
			checkpass_again=true;
		} else {
			$('#mka-notice').addClass("visible");
			$('#mka-notice').removeClass("invisible");
		}
		if (num == false || up == false) {
			$('#mk-notice').addClass("visible");
			$('#mk-notice').removeClass("invisible");

		} else{
			$('#mk-notice').addClass("invisible");
			$('#mk-notice').removeClass("visible");
			checkpass=true;
		}
		if(checkpass==true && checkpass_again==true){
			$(this).unbind('submit').submit();
		}

	});
});

$(document).ready(function () {
	$('#login-form').submit(function (e) {
		e.preventDefault();
		let pass = $('#pass').val();
		if (pass.length < 8) {
			$('#pw-notice').addClass("visible");
			$('#pw-notice').removeClass("invisible");
			return;
		}
		let up = false,
			num = false;
		for (let j = 0; j < pass.length; j++) {
			let c = pass.charCodeAt(j);
			if (c > 65 && c <= 90) {
				up = true;
			}
			if (c >= 48 && c <= 57) {
				num = true;
			}
		}

		if (num == false || up == false) {
			$('#pw-notice').addClass("visible");
			$('#pw-notice').removeClass("invisible");

		} else
			$(this).unbind('submit').submit()
	});
})
$(document).ready(function () {
	//binds to onchange event of your input field
		$('.img-field').bind('change', function() {

			//this.files[0].size gets the size of your file.
			for(let i=0;i<this.files.length;i++) {
				console.log("co vo");
				console.log(this.files[i].size);
				if(this.files[i].size>=1024*1024){
					$(this).val('');
					alert("File upload không được lớn hơn 1MB")
				}
			}

		});

	$("input[data-type='currency']").on({
		keyup: function() {
			formatCurrency($(this));
		},
		blur: function() {
			formatCurrency($(this), "blur");
		}
	});
	if($("input[data-type='currency']").length) formatCurrency($("input[data-type='currency']"))
	const formatYmd = date => date.toISOString().slice(0, 10);
	$('.date-start-sale').attr('min',formatYmd(new Date()))
	$('.date-start-sale').focus(function(){
		$('.date-end-sale').val('');
	})
	$('.date-end-sale').focus(function(){
		$(this).attr('min',$('.date-start-sale').val())
	})

	$('.percent-sale').keyup(function(){
		let price = $('.price').val().replace(/\D/g, "");
		let percent = $(this).val().replace(/\D/g,"")
		let price_final = Math.floor(price*(100-percent)/100);

		$('.price-sale').val(VND(price_final).format())
	})
	$('.price-sale').keyup(function (){
		let price = $('.price').val().replace(/\D/g, "");
		let price_sale = $('.price-sale').val().replace(/\D/g,"")
		let percent = Math.floor(100-price_sale/price*100);
		$('.percent-sale').val(percent)
	})
	$('#is_sale').on( "click", function() {
		if( $(this).is(':checked') ){
			// alert("Checkbox Is checked");
			$('.sale-zone').css('display','block');
			$('.sale-zone input').prop('required',true)
		}
		else{
			// alert("Checkbox Is not checked");
			$('.sale-zone').css('display','none');
			$('.sale-zone input').prop('required',false)
		}
	})
	if($('#is_sale').is(':checked')){
		// alert("Checkbox Is checked");
		$('.sale-zone').css('display','block');
		$('.sale-zone input').prop('required',true)
	}
	else{
		// alert("Checkbox Is not checked");
		$('.sale-zone').css('display','none');
		$('.sale-zone input').prop('required',false)
	}

// Example
	console.log(formatYmd(new Date()));

	// let revenue = $("#revenue");
	// let data11111 = revenue.data('revenue');
	// console.log("data11111111111: ",data11111)
	// const weekday = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"];
	//
	// const d = new Date();
	// let day_arr = []
	// for(let i = 1;i<=7;i++){
	// 	let date_before = new Date(d.getTime() - (i * 24 * 60 * 60 * 1000));
	// 	day_arr.push(weekday[date_before.getDay()])
	// }




	// const data_revenue = {
	// 	labels: day_arr,
	// 	datasets: [
	// 		{
	// 			label: 'Doanh thu (1000đ)',
	// 			data: [0, 10, 5, 2, 20, 30, 45],
	// 			borderColor: 'rgb(127, 173, 57)',
	// 			backgroundColor: 'rgba(127,173,57,0.46)',
	// 			fill : 'start',
	// 			tension: 0.3
	// 		}
	// 	]
	// };
	// const data_order_status = {
	// 	labels: [
	// 		'Đang rồi',
	// 		'Đã xác nhận',
	// 		'Đã hủy',
	// 		'Đã nhận',
	// 		'Đã thanh toán',
	// 		'Đã nhận',
	// 		'Đã thanh toán'
	// 	],
	// 	datasets: [{
	// 		label: 'Trạng thái',
	// 		data: [90, 50, 100,53,62,68,71],
	// 		backgroundColor: [
	// 			'rgba(255,37,37,0.86)',
	// 			'rgb(255,92,0)',
	// 			'rgb(255,199,0)',
	// 			'rgb(153,255,0)',
	// 			'rgb(0,255,225)',
	// 			'rgb(0,140,255)',
	// 			'rgb(140,0,255)'
	// 		],
	// 		hoverOffset: 4
	// 	}]
	// };
	// const config_order_status = {
	// 	type: 'doughnut',
	// 	data: data_order_status,
	// };
	// const config_revenue = {
	// 	type: 'bar',
	// 	data: data_revenue,
	// 	options: {}
	// };
	//
	// new Chart(
	// 	document.getElementById('revenue'),
	// 	config_revenue
	// );
	// new Chart(
	// 	document.getElementById('order-status'),
	// 	config_order_status
	// );

})
var formatCurrency = function(input){

	// appends $ to value, validates decimal side
	// and puts cursor back in right position.

	// get input value
	var input_val = input.val();

	// don't validate empty input
	if (input_val === "") { return; }


	let value = input_val.replace(/\D/g, "");


	let text = VND(value).format();
	console.log('text',text);
	input.val(text); // => "€1.234,57"
	console.log("value: ",input.val());
	console.log("Đơn vị tiền tệ: ",VND(value).format());


}
const VND = value => currency(value, {precision: 0,pattern: `# !`, symbol: '₫', decimal: ',', separator: '.' });
var imagesPreview = function(input, placeToInsertImagePreview) {
	$(placeToInsertImagePreview).children().remove();
	console.log(input);
	if (input.files) {
		var filesAmount = input.files.length;

		for (i = 0; i < filesAmount; i++) {
			var reader = new FileReader();

			reader.onload = function(event) {
				$($.parseHTML('<img>')).attr({'src': event.target.result}).css('marginRight', '10px').width(100).height(100).appendTo(placeToInsertImagePreview);
			}

			reader.readAsDataURL(input.files[i]);
		}
	}

};
