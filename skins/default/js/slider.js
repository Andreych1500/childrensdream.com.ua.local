$(document).ready(function() {
    if($('.slide-item').length > 1) {
        htmSlider();
    }

    $('.top-menu a[href*=#], .pushy-mob-menu a[href*=#]').bind("click", function(e){
        if($(this).attr('href').search( /ru/i ) == 1){
            var temp = $(this).attr('href');
            var anchor = temp.replace(/\/ru\//g, "");
        } else {
            var temp = $(this).attr('href');
            var anchor = temp.replace(/\//g, "");
        }

        var j = 35;

        if($(window).width() <= 833){
            j = 0;
        }

        $('html, body').stop().animate({

            scrollTop: $(anchor).offset().top - j
        }, 1000);
        e.preventDefault();
    });

    // resize slider
    var widthWindon = document.documentElement.clientWidth;

    if(widthWindon < '1024'){
        var slideWidth = $('.sliders-line').width();
        var widthplus = 0;

        $('.sliders-line .slide-item').width(slideWidth);
    }

    $(window).resize(function() {
        $('.sliders-line .slide-item').width($('.sliders-line').width());
    });
    // end resize slider
});

function resizeWidth(){
    var slideWrap = $('.slide-wrap');
    var slideWidth = $('.slide-list').width();
    var widthplus = 0;
    var widthWindon = document.documentElement.clientWidth;
    return slideWrap.position().left - (slideWidth + widthplus);
}

function htmSlider(){
    /* обертка слайдера */
    var slideWrap = $('.slide-wrap');

    /* кнопки вперед/назад */
    var nextLink = $('.next-slide');
    var prevLink = $('.prev-slide');

    /* Проверка на анимацию */
    var is_animate = true;

    /* ширина слайда с отступами */
    var slideWidth = $('.slide-list').width();

    /* сброс міні бага */
    var widthplus = 0;
    var widthWindon = document.documentElement.clientWidth;

    /* смещение слайдера */
    var scrollSlider = slideWrap.position().left - (slideWidth + widthplus);

    /* Клик следующий слайд */
    prevLink.click(function(){
        if(!slideWrap.is(':animated')) {
            slideWrap.animate({left: resizeWidth()}, 1500, function(){
                slideWrap
                    .find('.slide-item:first')
                    .appendTo(slideWrap)
                    .parent()
                    .css({'left': 0});
            });
        }
    });

    /* Клик на предыдующий слайд */
    nextLink.click(function(){
        if(!slideWrap.is(':animated')) {
            slideWrap
                .css({'left': resizeWidth()})
                .find('.slide-item:last')
                .prependTo(slideWrap)
                .parent()
                .animate({left: 0}, 1500);
        }
    });

    /* Функция автоматической прокрутки слайдера */
    function autoplay(){
        slideWrap.animate({left: resizeWidth()}, 1500, function(){
            slideWrap
                .find('.slide-item:first')
                .appendTo(slideWrap)
                .parent()
                .css({'left': 0});
        });
    }

    if(is_animate){
        timer = setInterval(autoplay, 25000);
    } else {
        clearInterval(timer);
    }
}
