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

    // --- scroll toTop ---
    $('.toTop').unbind('click').click(function(){
        $('body,html').animate({scrollTop:0},600);
    });

    // --- show hide toTop ---
    $(window).scroll(function() {
        if($(window).scrollTop()>=300) {
            $('.toTop').show();
        } else {
            $('.toTop').hide();
        }
    });

    // --- active menu ---
    $(".top-menu ul li, .pushy-mob-menu li").each(function( index ) {
        var url = window.location.pathname;

        $(".top-menu li a, .pushy li a").removeClass("active");
        $('.top-menu li a[href="'+url+'"], .pushy-mob-menu li a[href="'+url+'"]').parent('li').addClass('active');
    });

    // --- resize window ---
    $(window).resize(function() {

        // --- mobile menu ---
        if($('.mob-menu').is(':visible')){
            if($('.pushy-mob-menu').length == 0){
                $('.top-menu').removeClass().addClass('pushy-mob-menu');
            }
        } else {
            if($('.top-menu').length == 0){
                if($('.pushy-mob-menu').is(':hidden')){
                    $('.pushy-mob-menu').removeAttr('style');
                }

                $('.pushy-mob-menu').removeClass().addClass('top-menu');
            }
        }

        if($(window).outerWidth(true) <= 560 && $('.mob-menu').css('float') == 'left'){
            if(!$('.call-us').next().is('.mob-menu')){
                $('.mob-menu').insertBefore('header .pushy-mob-menu', '');
            }
        } else {
            if(!$('.mobile-basket').next().is('.mob-menu')){
                $('.mob-menu').insertBefore('header .call-us', '');
            }
        }

        // --- name element to top ---
        if($(window).outerWidth(true) <= 625){
            $('.goods h1').prependTo('.mattress-detail');
        } else {
            if($('.mattress-detail h1').length > 0) {
                $('.mattress-detail h1').prependTo('.goods');
            }
        }
    });

    //--- add more element ---
    $('.more-el').unbind('click').click(function(){
        var rel = $(this).find('input[name="more-el"]').val().split("|");

        $.ajax({
            url: '/ajax/moreElementSubmit.php',
            type: "POST",
            data: {nextLine: rel[0], siteLang: rel[1]},
            success: function (response) {
                var res = JSON.parse(response);

                if($(res.html).length > 0){
                    $(res.html).insertBefore($(".products .block-title:last"), '').fadeIn(1100);
                    var valRel = (+rel[0]+1)+'|'+rel[1];
                    $('input[name="more-el"]').val(valRel);
                }

                if(res.end == 0){
                    $('.products .block-title:last').remove();
                }
            }
        });
    });
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