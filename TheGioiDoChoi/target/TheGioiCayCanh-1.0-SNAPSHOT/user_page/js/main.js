/*  ---------------------------------------------------
    Template Name: Ogani
    Description:  Ogani eCommerce  HTML Template
    Author: Colorlib
    Author URI: https://colorlib.com
    Version: 1.0
    Created: Colorlib
---------------------------------------------------------  */

'use strict';


// Material Select Initialization
// $(document).ready(function() {
//     // Write comment begin
// $('.btn-open').click(function(event) {
//     $('.hop-thoai').addClass('hien-ra');
//     $('.nen-mo').addClass('hien-ra');
// });
// $('.btn-close').click(function(event) {
//     $('.hop-thoai').removeClass('hien-ra');
//     $('.nen-mo').removeClass('hien-ra');
// });
// $('.nen-mo').click(function(event) {
//     $('.hop-thoai').removeClass('hien-ra');
//     $('.nen-mo').removeClass('hien-ra');
// });

(function ($) {

    /*------------------
        Preloader
    --------------------*/
    $(window).on('load', function () {
        $(".loader").fadeOut();
        $("#preloder").delay(300).fadeOut("slow");

        /*------------------
            Gallery filter
        --------------------*/
        $('.featured__controls li').on('click', function () {
            console.log("Co vo");
            $('.featured__controls li').removeClass('active');
            $(this).addClass('active');
        });
        if ($('.featured__filter').length > 0) {
            var containerEl = document.querySelector('.featured__filter');
            var mixer = mixitup(containerEl);
        }

        $('.code_sale_controls li').on('click', function () {
            console.log('Co vo');
            $('.code_sale_controls li').removeClass('active');
            $(this).addClass('active');
        });
        if ($('.code_sale_filter').length > 0) {
            var containerEl1 = document.querySelector('.code_sale_filter');
            var mixer = mixitup(containerEl1);
        }
    });


    /*------------------
        Background Set
    --------------------*/
    $('.set-bg').each(function () {
        var bg = $(this).data('setbg');
        $(this).css('background-image', 'url(' + bg + ')');
    });

    //Humberger Menu
    $(".humberger__open").on('click', function () {
        $(".humberger__menu__wrapper").addClass("show__humberger__menu__wrapper");
        $(".humberger__menu__overlay").addClass("active");
        $("body").addClass("over_hid");
    });

    $(".humberger__menu__overlay").on('click', function () {
        $(".humberger__menu__wrapper").removeClass("show__humberger__menu__wrapper");
        $(".humberger__menu__overlay").removeClass("active");
        $("body").removeClass("over_hid");
    });

    /*------------------
        Navigation
    --------------------*/
    $(".mobile-menu").slicknav({
        prependTo: '#mobile-menu-wrap',
        allowParentLinks: true
    });

    /*-----------------------
        Categories Slider
    ------------------------*/
    $(".categories__slider").owlCarousel({
        loop: true,
        margin: 0,
        items: 4,
        dots: false,
        nav: true,
        navText: ["<span class='fa fa-angle-left'><span/>", "<span class='fa fa-angle-right'><span/>"],
        animateOut: 'fadeOut',
        animateIn: 'fadeIn',
        smartSpeed: 1200,
        autoHeight: false,
        autoplay: true,
        responsive: {

            0: {
                items: 1,
            },

            480: {
                items: 2,
            },

            768: {
                items: 3,
            },

            992: {
                items: 4,
            }
        }
    });


    $('.hero__categories__all').on('click', function () {
        $('.hero__categories ul').slideToggle(400);
    });

    /*--------------------------
        Latest Product Slider
    ----------------------------*/
    $(".latest-product__slider").owlCarousel({
        loop: true,
        margin: 0,
        items: 1,
        dots: false,
        nav: true,
        navText: ["<span class='fa fa-angle-left'><span/>", "<span class='fa fa-angle-right'><span/>"],
        smartSpeed: 1200,
        autoHeight: false,
        autoplay: true
    });

    /*-----------------------------
        Product Discount Slider
    -------------------------------*/
    $(".product__discount__slider").owlCarousel({
        loop: true,
        margin: 0,
        items: 3,
        dots: true,
        smartSpeed: 1200,
        autoHeight: false,
        autoplay: true,
        responsive: {

            320: {
                items: 1,
            },

            480: {
                items: 2,
            },

            768: {
                items: 2,
            },

            992: {
                items: 3,
            }
        }
    });

    /*---------------------------------
        Product Details Pic Slider
    ----------------------------------*/
    $(".product__details__pic__slider").owlCarousel({
        loop: true,
        margin: 20,
        items: 4,
        dots: true,
        smartSpeed: 1200,
        autoHeight: false,
        autoplay: true
    });

    /*-----------------------
        Price Range Slider
    ------------------------ */
    var rangeSlider = $(".price-range"),
        minamount = $("#minamount"),
        maxamount = $("#maxamount"),
        minPrice = rangeSlider.data('min'),
        maxPrice = rangeSlider.data('max'),
        maxi = rangeSlider.data("maxi"),
        mini = rangeSlider.data("mini"),
        type_page = rangeSlider.data("type_page"),
        url = rangeSlider.data("url");

    rangeSlider.slider({
        range: true,
        min: mini,
        max: maxi,
        values: [minPrice, maxPrice],
        stop: function (event, ui) {
            minamount.val(ui.values[0] + '.000 ₫');
            maxamount.val(ui.values[1] + '.000 ₫');
            window.location.href = type_page + "?price_min=" + ui.values[0] + "&price_max=" + ui.values[1] + "&" + url;
            console.log(type_page + "?price_min=" + ui.values[0] + "&price_max=" + ui.values[1] + "&" + url);
        }
    });
    minamount.val(rangeSlider.slider("values", 0) + ".000 ₫");
    maxamount.val(rangeSlider.slider("values", 1) + ".000 ₫");

    /*--------------------------
        Select
    ----------------------------*/
    $("select").niceSelect();

    /*------------------
        Single Product
    --------------------*/
    $('.product__details__pic__slider img').on('click', function () {

        var imgurl = $(this).data('imgbigurl');
        var bigImg = $('.product__details__pic__item--large').attr('src');
        if (imgurl != bigImg) {
            $('.product__details__pic__item--large').attr({
                src: imgurl
            });
        }
    });

    /*-------------------
        Quantity change
    --------------------- */
    //todo
    var proQty = $('.pro-qty');
    proQty.prepend('<span class="dec qtybtn">-</span>');
    proQty.append('<span class="inc qtybtn">+</span>');
    proQty.on('click', '.qtybtn', function () {
        var $button = $(this);
        var oldValue = $button.parent().find('input').val();
        if ($button.hasClass('inc')) {
            var scroll = $(window).scrollTop();
            var newVal = parseFloat(oldValue) + 1;
            let id = $(this).parent().data("pro_id");
            let directUrl = "cart-handle?current-page=cart"+"&id="+id+"&action=add&position="+scroll;
            window.location.href=directUrl;
        } else {
            // Don't allow decrementing below zero
            if (oldValue > 0) {
                var newVal = parseFloat(oldValue) - 1;
            } else {
                newVal = 0;
            }
            var scroll = $(window).scrollTop();
            let id = $(this).parent().data("pro_id");
            let directUrl = "cart-handle?current-page=cart"+"&id="+id+"&action=sub&position="+scroll;
            window.location.href=directUrl;
        }
        $button.parent().find('input').val(newVal);


    });

    // Header sale
    var ww = $(window).width();
    $(window).on("resize", function () {
        ww = $(window).width();
        if (ww < 980) {
            $("#sys_mod_filter").removeClass("fix-top");
            $("#sys_tmp_height_filter").remove();
        }
    });
    var sys_mod_filter = $("#sys_mod_filter");
    if (sys_mod_filter.length > 0) {
        var filterOffTop = $("#sys_mod_filter").offset().top;
        $(window).on("scroll", function () {
            if (ww > 980) {
                var getOffTop = (window.pageYOffset !== undefined) ? window.pageYOffset : (document.documentElement || document.body.parentNode || document.body).scrollTop;
                if (getOffTop > filterOffTop) {
                    sys_mod_filter.addClass("fix-top");
                    if ($("#sys_tmp_height_filter").length <= 0) {
                        $("<div id='sys_tmp_height_filter'></div>").height($("#sys_mod_filter").outerHeight(true)).insertAfter("#sys_mod_filter");
                    }
                } else {
                    sys_mod_filter.removeClass("fix-top");
                    $("#sys_tmp_height_filter").remove();
                }
            }
        });
    }
    $("#sys_apply_filter").on("click", function () {
        var paramAjax = {
            keyword: $("#sys_txt_search").val(),
            cateId: $("#sys_selected_val").children("span").attr("data-cate-id"),
            minDayLeft: $("#sys_filter_days_left").val()[0],
            maxDayLeft: $("#sys_filter_days_left").val()[1]
        };
        console.log(paramAjax);
    });
    $("#sys_selected_val").on("click", function (e) {
        $("#sys_list_dd_cate").fadeToggle(300);
        $("body").on("click.hideDropCate", function () {
            $("#sys_list_dd_cate").fadeOut(300);
            $("body").off("click.hideDropCate");
        });
        e.stopPropagation();
    });
    $("#sys_list_dd_cate").on("click", "a", function (e) {
        $("#sys_selected_val").children("span").html($(this).html()).attr("data-cate-id", $(this).attr("data-cate-id"));
        $("#sys_list_dd_cate").fadeOut(300);
        $("body").off("click.hideDropCate");
        e.stopPropagation();
        return false;
    });
    $("#sys_apply_filter").on("click", function () {
        var paramAjax = {
            keyword: $("#sys_txt_search").val(),
            cateId: $("#sys_selected_val").children("span").attr("data-cate-id"),
            minDayLeft: $("#sys_filter_days_left").val()[0],
            maxDayLeft: $("#sys_filter_days_left").val()[1]
        };
        console.log(paramAjax);
    });
    // Scroll top
    $("#scroll-top").click(function (e) {
        e.preventDefault();
        $(window).scrollTop(0);
    });

    // Them======================
    $('#order-place').prop("checked", false).trigger("change");
    $('#order-place').change(function (e) {
        e.preventDefault();
        console.log('co vo');
        var conditionVal = $('#order-place').val();
        if ($('#order-place').is(':checked'))
            $('#order-place-input-required').prop('required', true);

        else
            $('#order-place-input-required').prop('required', false);

    });

    var timeout = null;
    $('#cash').prop("checked", true).trigger("change");
    $('#cash').change(function (e) {
        e.preventDefault();
        if ($('#cash').is(':checked')) {
            $('#momo').prop('checked', false);
            $('#cash').prop('checked', true);
            $("#checkout-btn").removeAttr("data-toggle");
            $("#checkout-btn").removeAttr("data-target");
            $("#checkout-btn").removeClass("hasModal");
        }
        if ($("#momo-code").hasClass("show")) {
            $("#momo-code").removeClass("show");
        }
    });
    $('#momo').prop("checked", false).trigger("change");
    $('#momo').change(function (e) {
        e.preventDefault();
        if ($('#momo').is(':checked')) {
            console.log("Vo--------------");
            $('#momo').prop('checked', true);
            $('#cash').prop('checked', false);
            $("#checkout-btn").attr("data-toggle", "modal");
            $("#checkout-btn").attr("data-target", "#momo-payment");
            $("#checkout-btn").addClass("hasModal");
        }
    });


    function countdown() {
        var times = $('#count-down-time').text();
        var time = parseInt(times);
        time--;
        console.log("time" + time)
        $("#count-down-time").text(time);
        timeout = setTimeout(countdown, 1000);
    }

    $("#checkout-btn").click(function (e) {
        e.preventDefault();
        if ($(this).hasClass("hasModal")) {
            countdown();
        }

    });
    $("#momo-payment").on("hidden.bs.modal", function () {
        clearTimeout(timeout);
        console.log("Da close");
    });
    $('#select_sort').change(function () {
        $(this).find(":selected").each(function () {
            window.location.href = $(this).val();
        });
    });
    $('#login-mobile').change(function () {
        $(this).find(":selected").each(function () {
            window.location.href = $(this).val();
        });
    });
    $('#login-web').change(function () {
        $(this).find(":selected").each(function () {
            window.location.href = $(this).val();
        });
    });
    $(window).on('load', function () {
        $('#wrong_info_login').modal('show');
    });
    $(window).on('load', function () {
        $('#notify-forget').modal('show');
    });
    $('#cat_id').change(function () {
        $(this).find(":selected").each(function () {
            window.location.href = $(this).val();
        });
    });
    $('#sortedprice_id').change(function () {
        $(this).find(":selected").each(function () {
            window.location.href = $(this).val();
        });
    });
    $('#sorteddate_id').change(function () {
        $(this).find(":selected").each(function () {
            window.location.href = $(this).val();
        });
    });
    $('#select_category').change(function () {
        $(this).find(":selected").each(function () {
            window.location.href = $(this).val();
        });
    });
    $('#select_date').change(function () {
        $(this).find(":selected").each(function () {
            window.location.href = $(this).val();
        });
    });

})(jQuery);

function radio_input(url) {
    window.location.href = url;
}

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

// bắt lỗi Đổi mật khẩu
    $(document).ready(function () {
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

        })

    });

    //add cart
    $('.addCart').click(function (e){
        var scroll = $(window).scrollTop();
        let curentUrl = window.location.href;
        let arrCondition = curentUrl.split("?");
        // console.log("length: "+arrCondition.length)
        let condition;
        if(arrCondition.length == 1){
            // console.log("co vo dk if")
            condition = "";
        }else condition = arrCondition[1];

        let currentPage = $(this).data('current_page');
        let id = $(this).data('pro_id');
        let directUrl = "cart-handle?current-page="+currentPage+"&id="+id+"&position="+scroll+"&action=add"+"&"+condition;
        window.location.href=directUrl;
        // console.log(directUrl);
    });
    //add favouristlist
    $('.addFa').click(function (e){
        var scroll = $(window).scrollTop();
        let curentUrl = window.location.href;
        let arrCondition = curentUrl.split("?");
        // console.log("length: "+arrCondition.length)
        let condition;
        if(arrCondition.length == 1){
            // console.log("co vo dk if")
            condition = "";
        }else condition = arrCondition[1];

        let currentPage = $(this).data('current_page');
        let id = $(this).data('pro_id');
        let directUrl = "add-favourist?current-page="+currentPage+"&id="+id+"&position="+scroll+"&action=add"+"&"+condition;
        window.location.href=directUrl;
        // console.log(directUrl);
    });

    //add favouristlist
    $('.subFa').click(function (e){
        var scroll = $(window).scrollTop();
        let currentPage = $(this).data('current_page');
        let id = $(this).data('pro_id');
        let directUrl = "add-favourist?current-page="+currentPage+"&id="+id+"&position="+scroll+"&action=sub";
        window.location.href=directUrl;
        // console.log(directUrl);
    });


    //fast checkout
    $('.fast-checkout').click(function (e){
        let id = $(this).data('pro_id');
        let directUrl = "checkout?fast-checkout=true&pro_id="+id;
        window.location.href=directUrl;
        // console.log(directUrl);
    });

});

function load(position){
    $(window).scrollTop(position);

}

