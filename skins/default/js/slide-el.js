$(document).ready(function() {
    $('.slider-for').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows: false,
        fade: true,
        asNavFor: '.slider-nav',
        swipe: false,
    });
    $('.slider-nav').slick({
        slidesToShow: 3,
        slidesToScroll: 1,
        asNavFor: '.slider-for',
        dots: false,
        centerMode: true,
        centerPadding: '0px',
        focusOnSelect: true,
        vertical: true,
        verticalSwiping: true,
        nextArrow: '<span class="icon-bottom"></span>',
        prevArrow: '<span class="icon-top"></span>'
    });
});