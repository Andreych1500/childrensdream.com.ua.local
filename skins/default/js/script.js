$(document).ready(function() {

     /*$(".top-menu ul li").each(function( index ) {
         var url = window.location.pathname;

        $(".top-menu li a").removeClass("active");
         $('.top-menu li a[href="'+url+'"]').addClass('active');
     });*/

    window.onscroll = function () {
        var scrolled = window.pageYOffset || document.documentElement.scrollTop;
        if (scrolled >= 120) {
            $('.top-menu').addClass('fixed-menu');
        } else {
            $('.top-menu').removeClass('fixed-menu');
        }
    }

    $('.scrollup').remove();

        $('.toTop').unbind('click').click(function(){
            $('body,html').animate({scrollTop:0},600);
        });

        $(window).scroll(function() {
         if($(window).scrollTop()>=400) {
            $('.toTop').show();
        } else {
            $('.toTop').hide();
        }
    });

    var scrollHeight = Math.max(
        document.body.scrollWidth, document.documentElement.scrollWidth,
        document.body.offsetWidth, document.documentElement.offsetWidth,
        document.body.clientWidth, document.documentElement.clientWidth
    );
    console.log(scrollHeight);

    $( window ).resize(function() {
        var sss = Math.max(
            document.body.scrollWidth, document.documentElement.scrollWidth,
            document.body.offsetWidth, document.documentElement.offsetWidth,
            document.body.clientWidth, document.documentElement.clientWidth
        );
        console.log(sss);
    });
});