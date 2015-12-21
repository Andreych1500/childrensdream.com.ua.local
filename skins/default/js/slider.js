$(document).ready(function() {
    htmSlider();

    $('.top-menu a[href*=#]').bind("click", function(e){
        if($(this).attr('href').search( /ru/i ) == 1){
            var temp = $(this).attr('href');
            var anchor = temp.replace(/\/ru\//g, "");
        } else {
            var temp = $(this).attr('href');
            var anchor = temp.replace(/\//g, "");
        }

        $('html, body').stop().animate({
            scrollTop: $(anchor).offset().top
        }, 1000);
        e.preventDefault();
    });

});

window.onload = function(){

    var widthWindon = document.documentElement.clientWidth;


    if(widthWindon < '1024'){
        var slideWidth = $('.sliders-line').width();
        var widthplus = 0;

        if(widthWindon < 867){
            widthplus = 20;
        }

        $('.sliders-line .slide-item').width(slideWidth + widthplus);
    }

    $(window).resize(function() {
        $('.sliders-line .slide-item').width($('.sliders-line').width());
    });

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
    if(widthWindon < 867){
        widthplus = 16;
    }


    /* смещение слайдера */
    var scrollSlider = slideWrap.position().left - (slideWidth + widthplus);

    /* Клик следующий слайд */
    prevLink.click(function(){
        if(!slideWrap.is(':animated')) {
            slideWrap.animate({left: scrollSlider}, 1300, function(){
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
                .css({'left': scrollSlider})
                .find('.slide-item:last')
                .prependTo(slideWrap)
                .parent()
                .animate({left: 0}, 1300);
        }
    });

    /* Функция автоматической прокрутки слайдера */
    function autoplay(){
        slideWrap.animate({left: scrollSlider}, 1300, function(){
            slideWrap
                .find('.slide-item:first')
                .appendTo(slideWrap)
                .parent()
                .css({'left': 0});
        });
    }

    if(is_animate){
        timer = setInterval(autoplay, 20000);
    } else {
        clearInterval(timer);
    }

}
