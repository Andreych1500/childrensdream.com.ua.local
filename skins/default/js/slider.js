$(document).ready(function() {

    if($('.slide-item').length > 1) {
        htmSlider();
    }

    // --- animate to menu scroll ---
    $('.top-menu a[href*=#], .pushy-mob-menu a[href*=#]').bind("click", function(e){
        if($(this).attr('href').search( /ru/i ) == 1){
            var anchor = $(this).attr('href').replace(/\/ru\//g, "");
        } else {
            var anchor = $(this).attr('href').replace(/\//g, "");
        }

        var j = 35;

        if($(window).outerWidth(true) <= 833){
            j = 0;
        }

        $('html, body').stop().animate({

            scrollTop: $(anchor).offset().top - j
        }, 1000);
        e.preventDefault();
    });
    // --- end animate to menu scroll ---


    // resize slider
    $(window).resize(function() {
        $('.main-banner .slide-item').width($('.slide-list').width());

        $('.slide-wrap').stop(true, false);
    });
    // end resize slider
});

function resizeWidth(){
    var slideWrap = $('.slide-wrap');
    var slideWidth = $('.slide-list').width();
    return slideWrap.position().left - (slideWidth);
}

function htmSlider(){
    var slideWrap = $('.slide-wrap');
    var nextLink = $('.next-slide');
    var prevLink = $('.prev-slide');

    var is_animate = true;

    var slideWidth = $('.slide-list').width();

    // --- animate slide ---
    var scrollSlider = slideWrap.position().left - (slideWidth);


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


    function autoplay(){
        if(!slideWrap.is(':animated')) {
            slideWrap.animate({left: resizeWidth()}, 1500, function () {
                slideWrap
                    .find('.slide-item:first')
                    .appendTo(slideWrap)
                    .parent()
                    .css({'left': 0});
            });
        }
    }

    if(is_animate){
        timer = setInterval(autoplay, 25000);
    } else {
        clearInterval(timer);
    }
    // --- end animate ---
}
