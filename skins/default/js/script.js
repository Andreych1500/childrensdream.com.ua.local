$(document).ready(function() {
    window.onscroll = function () {
        var scrolledY = window.pageYOffset || document.documentElement.scrollTop;

        if (scrolledY >= 120) {
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
         if($(window).scrollTop()>=300) {
            $('.toTop').show();
        } else {
            $('.toTop').hide();
        }
    });

    // scrolling to top mini
    pathname = window.location.pathname;

    if(getCookie('scroll') == undefined ){
        setCookie('scroll', pathname, 0);
    } else {
        if(getCookie('scroll') == '/' || getCookie('scroll') == '/ru/'){
            setCookie('scroll', pathname, 0);
        } else {
            if((pathname == '/' || pathname == '/ru/') && $( window).width() >= 834) {
                scrolMenuPanel();
                setCookie('scroll', pathname, 0);
            }
        }
    }

    $(".top-menu ul li, .pushy li").each(function( index ) {
        var url = window.location.pathname;

        $(".top-menu li a, .pushy li a").removeClass("active");
        $('.top-menu li a[href="'+url+'"], .pushy li a[href="'+url+'"]').parent('li').addClass('active');
    });

    $( window ).resize(function() {
        var widthWindow = Math.max(
            document.body.scrollWidth, document.documentElement.scrollWidth,
            document.body.offsetWidth, document.documentElement.offsetWidth,
            document.body.clientWidth, document.documentElement.clientWidth
        );

        if(widthWindow <= 640){
            $('.el-text .name-el').prependTo('.dateil-info');
        } else {
            if($('.dateil-info .name-el').length > 0) {
                $('.dateil-info .name-el').prependTo('.dateil-info .el-text');
            }
        }
    });

    if(($(window).width() <= 640)){
        $('.el-text .name-el').prependTo('.dateil-info');
    } else {
        if($('.dateil-info .name-el').length > 0) {
            $('.dateil-info .name-el').prependTo('.dateil-info .el-text');
        }
    }


    // видалення товару з корзини
    $(".del-good").unbind('click').click(function(){
        var temp = JSON.parse(getCookie('items')); // розпаковка массива
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
            window.location.href = window.location.href
        }

        var card = $('.top-menu ul li').last().find('span');
        var mobcard = $('.mobile-basket').find('span');
        var countG    = $(card).text();
        var mobcountG = $(mobcard).text();
        --countG;
        --mobcountG;
        $(card).text(countG);
        $(mobcard).text(mobcountG);

        // edit price
        setTimeout(function(){
            var globPrice = 0;
            $('.line-tab-goods tr').each(function(i,el){
                globPrice = globPrice + parseInt($(el).find('.el_prive_hidden').attr('rel_aep'))
                $('.all-goods-price').text(globPrice.toLocaleString());
            });
        }, 1000);
    });
});

function scrolMenuPanel(){
    if(window.location.hash != '') {
        setTimeout(function () {
            $('.top-menu a[href*=' + window.location.hash + ']').trigger('click');
        }, 300);
    }
}

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

// count el cookies
function count(obj) {
    var count = 0;
    for(var prs in obj){
        if(obj.hasOwnProperty(prs)) count++;
    }
    return count;
}

// add card to cookie
function addToCard(id_el,text_submit,count){
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

function deleteCookie(name) {
    setCookie(name, "", {
        expires: -1
    })
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