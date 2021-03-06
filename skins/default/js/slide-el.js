$(document).ready(function() {

    $('.slider-nav').slick({
        slidesToShow: 3,
        slidesToScroll: 1,
        asNavFor: '.slider-for',
        dots: false,
        centerMode: true,
        centerPadding: '0px',
        focusOnSelect: true,
        vertical: true,
        arrows: false,
        verticalSwiping: true,
        nextArrow: '<span class="icon-bottom"></span>',
        prevArrow: '<span class="icon-top"></span>',
        accessibility : false
    });

    if($('.slider-nav .slick-arrow').length == 0) {
        $('.slider-for').slick({
            slidesToShow: 1,
            slidesToScroll: 1,
            arrows: true,
            fade: true,
            asNavFor: '.slider-nav',
            swipe: false,
            appendArrows: $('.slider-nav'),
            nextArrow: '<span class="icon-bottom hidden-icon"></span>',
            prevArrow: '<span class="icon-top hidden-icon"></span>',
            accessibility : false
        });
    } else {
        $('.slider-for').slick({
            slidesToShow: 1,
            slidesToScroll: 1,
            arrows: false,
            fade: true,
            asNavFor: '.slider-nav',
            swipe: false,
        });
    }
});