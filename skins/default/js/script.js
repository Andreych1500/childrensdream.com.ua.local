$(document).ready(function() {
    // --- mini scroll fixed-menu ---
    var pathname = window.location.pathname;
    var arrPathname = ['/','/ru/'];

    if(jQuery.inArray(pathname, arrPathname) < 0 && $(window).width() >= 834) {
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
    // --- end mini scroll fixed-menu ---

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
            window.location.href = window.location.href;
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
    // --- end delete goods ---

    // --- start resize function ---
    $(window).resize();
    // --- end start resize function ---
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