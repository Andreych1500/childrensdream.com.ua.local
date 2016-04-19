$(document).ready(function() {
    // --- fixed menu ---
    window.onscroll = function () {
        var scrolledY = window.pageYOffset || document.documentElement.scrollTop;

        if (scrolledY >= 120) {
            $('.top-menu').addClass('fixed-menu');
        } else {
            $('.top-menu').removeClass('fixed-menu');
        }
    }
    // --- end fixed menu ---


    // --- scroll toTop ---
    $('.toTop').unbind('click').click(function(){
        $('body,html').animate({scrollTop:0},600);
    });
    // --- end scroll toTop ---


    // --- show hide toTop ---
    $(window).scroll(function() {
        if($(window).scrollTop()>=300) {
            $('.toTop').show();
        } else {
            $('.toTop').hide();
        }
    });
    // --- end show hide toTop ---


    // --- active menu ---
    $(".top-menu ul li, .pushy-mob-menu li").each(function( index ) {
        var url = window.location.pathname;

        $(".top-menu li a, .pushy li a").removeClass("active");
        $('.top-menu li a[href="'+url+'"], .pushy-mob-menu li a[href="'+url+'"]').parent('li').addClass('active');
    });
    // --- end active menu ---


    // --- resize window ---
    $(window).resize(function() {

        // --- mobile menu ---
        if($(window).width() <= 833){
            if($('header .pushy-mob-menu').length == 0){
                $('.top-menu').removeClass().addClass('pushy-mob-menu');
            }
        } else {
            if($('header .top-menu').length == 0){
                if($('.pushy-mob-menu').css('display') == 'none'){
                    $('.pushy-mob-menu').removeAttr('style');
                }

                $('.pushy-mob-menu').removeClass().addClass('top-menu');
            }
        }

        if($(window).width() <= 540){
            if(!$('.call-us').next().is('.mob-menu')){
                $('.mob-menu').insertBefore('header .pushy-mob-menu', '').addClass('mobile-menu');
            }
        } else {
            if(!$('.mobile-basket').next().is('.mob-menu')){
                $('.mob-menu').insertBefore('header .call-us', '').removeClass('mobile-menu');
            }
        }
        // --- end mobile menu ---

        // --- name element to top ---
        if($(window).width() <= 625){
            $('.goods h1').prependTo('.decoration-block');
        } else {
            if($('.decoration-block h1').length > 0) {
                $('.decoration-block h1').prependTo('.goods');
            }
        }
        // --- end name element to top ---
    });
    // --- end resize window ---
});

function scrolMenuPanel(){
    if(window.location.hash != '') {
        setTimeout(function () {
            $('.top-menu a[href*=' + window.location.hash + ']').trigger('click');
        }, 300);
    }
}

function showHide(el){
    if($('.mob-menu').is('.aciveMenu')){
        $('.mob-menu').removeClass('aciveMenu');
    } else {
        $('.mob-menu').addClass('aciveMenu');
    }

    $('.pushy-mob-menu').slideToggle( "slow");
}