$(document).ready(function() {

    // --- prev | next ---
    $('.btnModal-right').click(function () {
        var blockPhoto = $('.n-ActIndex');

        if($(blockPhoto).prev('div').length){
            var prevClone = $(blockPhoto).prev('div').find('img').clone(true);

            if(!$('.modalMain').find('img:first-child').is(':animated')){
                $('.modalMain').find('img:first-child').height(0).animate({
                    opacity: 0
                }, 700, 'swing');

                prevClone.css({ opacity: 0 });

                $('.modalMain').append(prevClone);

                prevClone.animate({ opacity: 1 }, 700, 'swing', function () {
                    $(this).prev().remove();
                });

                $('.n-ActIndex').removeClass('n-ActIndex');
                $(blockPhoto).prev('div').addClass('n-ActIndex');
            }
        }
    });

    $('.btnModal-left').click(function () {
        var blockPhoto = $('.n-ActIndex');

        if ($(blockPhoto).next('div').length) {
            var nextClone = $(blockPhoto).next('div').find('img').clone(true);

            if (!$('.modalMain').find('img:first-child').is(':animated')) {
                $('.modalMain').find('img:first-child').height(0).animate({
                    opacity: 0
                }, 700, 'swing');

                nextClone.css({opacity: 0});

                $('.modalMain').append(nextClone);

                nextClone.animate({opacity: 1}, 700, 'swing', function () {
                    $(this).prev().animate({opacity: 0}, function () {
                        $(this).remove();
                    });
                });

                $('.n-ActIndex').removeClass('n-ActIndex');
                $(blockPhoto).next('div').addClass('n-ActIndex');
            }
        }
    });
    // --- end prev | next ---

    //modal close window
    $('.icon-close').click( function(){
        $('.modal').animate({opacity: 0}, 200, function(){ // після виконання минулої анімації
            $(this).css('display', 'none');
            $('.fixed-overlay img').remove();
            $('.n-ActIndex').removeClass('n-ActIndex');
            $('.fixed-overlay').fadeOut(400);
        });
    });

});

function modalPhoto() {

    if ($(window).width() > 800) {
        $('.slider-nav .slick-active.slick-center').addClass('n-ActIndex');

        var clone = $('.n-ActIndex img').clone();

        $('.modalMain').append(clone);

        $('.fixed-overlay').fadeIn(400, function () {
            $('.modal').css('display', 'flex').animate({opacity: 1}, 200);
        });
    }
}