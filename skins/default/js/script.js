$(document).ready(function() {

    var widthScrollY = widthScroll_Y();
    var globWindowWidth = $(window).outerWidth(true) + widthScrollY;

    if($('.slide-item').length > 1) {
        htmSlider();
    }

    // --- animate to menu scroll ---
    $('.top-menu a[href*=#], .pushy-mob-menu a[href*=#]').click(function(e){
        var str = $(this).attr('href');
        var anchor = str.match(/#[a-z]+/gi);
        var j = 35;

        if(globWindowWidth <= 848){
            j = 0;
        }

        if($(anchor[0]).length){
            $('html, body').stop().animate({
                scrollTop: $(anchor[0]).offset().top - j
            }, 1000);
            e.preventDefault();
        }
    });

    // --- fixed menu ---
    $(window).scroll(function () {
        var scrolledY = window.pageYOffset || document.documentElement.scrollTop;

        if (scrolledY >= 120) {
            $('.top-menu').addClass('fixed-menu');
        } else {
            $('.top-menu').removeClass('fixed-menu');
        }

        // --- show hide toTop ---
        if(scrolledY >= 300){
            $('.toTop').show();
        } else{
            $('.toTop').hide();
        }
    });

    // --- scroll toTop ---
    $('.toTop').unbind('click').click(function(){
        $('body,html').animate({scrollTop:0},700);
    });

    // --- active menu ---
    $(".top-menu ul li, .pushy-mob-menu li").each(function() {
        var url = window.location.pathname;

        $(".top-menu li a, .pushy li a").removeClass("active");
        $('.top-menu li a[href="'+url+'"], .pushy-mob-menu li a[href="'+url+'"]').parent('li').addClass('active');
    });

    // --- resize window ---
    $(window).resize(function() {

        var widthWindow = $(window).outerWidth(true) + widthScrollY;

        // resize slider
        $('.main-banner .slide-item').width($('.slide-list').width());
        $('.slide-wrap').stop(true, false);
        
        // --- mobile menu ---
        if(widthWindow <= 848){
            $('.top-menu').removeClass().addClass('pushy-mob-menu');
        } else {
            var pushMobmenu = $('.pushy-mob-menu');

            if(pushMobmenu.is(':hidden')){
                pushMobmenu.removeAttr('style');
            }
            pushMobmenu.removeClass().addClass('top-menu');
        }

        var mobmenu = $('.mob-menu');
        if(widthWindow <= 540){
            mobmenu.insertBefore('header .pushy-mob-menu', '');
        } else {
            mobmenu.insertBefore('header .call-us', '');
        }

        // --- name element to top ---
        var hNameProduct = $('.mattress-detail h1');
        if(widthWindow <= 640){
            $('.goods h1').prependTo('.mattress-detail');
        } else {
            if(hNameProduct.length > 0) {
                hNameProduct.prependTo('.goods');
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

    // --- mini scroll fixed-menu ---
    var pathname = window.location.pathname;
    var arrPathname = ['/','/ru/'];

    if(jQuery.inArray(pathname, arrPathname) < 0 && globWindowWidth >= 848) {
        if(getCookie('scroll') == undefined ) {
            setCookie('scroll', pathname, 0);
        } else {
            deleteCookie('scroll');
            setCookie('scroll', pathname, 0);
        }
    } else {
        scrolMenuPanel();
        deleteCookie('scroll');
    }

    // --- delete goods ---
    $(".del-good").unbind('click').click(function(){
        var temp = JSON.parse(getCookie('items')); // розпаковуємо массив
        var id = 'g'+$(this).find('span').attr('rel_id');
        delete temp[id];

        $(this).parents('tr').hide('slow',
            function(){
                $(this).remove();
            }
        );

        var time_cookie = {expires : 16700000};
        setCookie('items',JSON.stringify(temp),time_cookie);

        if(count(temp) == 0){
            location.reload();
        }

        var card = $('.top-menu ul li').last().find('span');
        var mobcard = $('.mobile-basket').find('span');
        var countG    = $(card).text();
        var mobcountG = $(mobcard).text();
        --countG;
        --mobcountG;
        $(card).text(countG);
        $(mobcard).text(mobcountG);

        // --- edit order price ---
        setTimeout(function(){
            var globPrice = 0;
            $('.line-tab-goods tr').each(function(i,el){
                globPrice = globPrice + parseInt($(el).find('.el_prive_hidden').attr('rel_aep'))
                $('.all-goods-price').text(globPrice.toLocaleString());
            });
        }, 1000);
        // --- emd order price ---

    });

    // --- start resize function ---
    $(window).resize();
});

function edit_price(el) {
    var price  = parseInt($(el).parents('tr').find('.el_prive_hidden').val());
    var count  = $(el).val();

    if(count > 99){
        count = 99;
        $(el).val(99);
    }

    var gPrice = count * price;
    var globPrice = 0;

    $(el).parents('tr').find('.el_prive_hidden').attr('rel_aep',gPrice);
    $(el).parents('tr').find('.edJsPrice').text(gPrice.toLocaleString());

    $('.line-tab-goods tr').each(function(i,el){
        globPrice = globPrice + parseInt($(el).find('.el_prive_hidden').attr('rel_aep'))
    });

    $('.all-goods-price').text(globPrice.toLocaleString());
}

// --- count el cookies ---
function count(obj) {
    var count = 0;
    for(var prs in obj){
        if(obj.hasOwnProperty(prs)) count++;
    }
    return count;
}

// --- add card to cookie ---
function addToCard(id_el, text_submit, count){
    var items = {};
    var time_cookie = {expires : 16700000};

    if(getCookie('items') === undefined){
        items['g' + id_el] = count;
        setCookie('items',JSON.stringify(items),time_cookie);
    } else {
        var temp = JSON.parse(getCookie('items')); // розпаковка массива
        temp['g' + id_el] = count; // добавити елемент
        setCookie('items',JSON.stringify(temp),time_cookie); // запакувати назад
    }

    $('.icon-basket').remove();
    $('.add-shop').addClass('backet-ok').removeAttr('onclick').text(text_submit);
    var card = $('.top-menu ul li').last().find('span');
    var mobcard = $('.mobile-basket').find('span');
    var countG    = $(card).text();
    var mobcountG = $(mobcard).text();
    ++countG;
    ++mobcountG;
    $(card).text(countG);
    $(mobcard).text(mobcountG);
}

function deleteCookie ( cookie_name ){
    var cookie_date = new Date ( );
    cookie_date.setTime ( cookie_date.getTime() - 1 );
    document.cookie = cookie_name += "=; expires=" + cookie_date.toGMTString();
}


function getCookie(name) {
    var matches = document.cookie.match(new RegExp(
        "(?:^|; )" + name.replace(/([\.$?*|{}\(\)\[\]\\\/\+^])/g, '\\$1') + "=([^;]*)"
    ));
    return matches ? decodeURIComponent(matches[1]) : undefined;
}

function setCookie(name, value, options) {
    options = options || {};

    var expires = options.expires;

    if (typeof expires == "number" && expires) {
        var d = new Date();
        d.setTime(d.getTime() + expires * 1000);
        expires = options.expires = d;
    }

    if (expires && expires.toUTCString) {
        options.expires = expires.toUTCString();
    }

    var updatedCookie = name + "=" + value;

    for (var propName in options) {
        updatedCookie += "; path=/;" + propName;
        var propValue = options[propName];
        if (propValue !== true) {
            updatedCookie += "=" + propValue;
        }
    }

    document.cookie = updatedCookie;
}

function widthScroll_Y(){

    var div = document.createElement('div');

    $('body').append($(div).css({'overflowY':'scroll','width':'50px','height':'50px','visibility':'hidden'}));

    var scrollWidth = div.offsetWidth - div.clientWidth;

    $(div).remove();

    return scrollWidth;
}

function scrolMenuPanel(){
    if(window.location.hash != '') {
        setTimeout(function () {
            $('.top-menu a[href*=' + window.location.hash + ']').trigger('click');
        }, 300);
    }
}

function showHide(){
    var mobMenu = $('.mob-menu');

    if(mobMenu.is('.aciveMenu')){
        mobMenu.removeClass('aciveMenu');
    } else {
        mobMenu.addClass('aciveMenu');
    }

    $('.pushy-mob-menu').slideToggle( "slow");
}

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
}