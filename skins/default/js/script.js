$(document).ready(function () {
    // Width window
    var globWindowWidth = $(window).outerWidth(true) + widthScroll_Y();

    // Slider
    if ($('.slide-item').length > 1) {
        Slider(undefined, 'Y', undefined);
    }

    $('.row-slide span').click(function () {
        if (!$(this).is('.active-row')) {
            Slider($(this).index(), undefined, 'Y');
        }
    });

    // Animate to menu scroll
    $('.top-menu a[href*=#], .pushy-mob-menu a[href*=#]').click(function (e) {
        var str = $(this).attr('href');
        var anchor = str.match(/#[a-z]+/gi);
        var j = 35;

        if (globWindowWidth <= 848) {
            j = 0;
        }

        if ($(anchor[0]).length) {
            $('html, body').stop().animate({
                scrollTop: $(anchor[0]).offset().top - j
            }, 1000);
            e.preventDefault();
        }
    });

    // Fixed Menu
    $(window).scroll(function () {
        var scrolledY = window.pageYOffset || document.documentElement.scrollTop;

        if (scrolledY >= 120) {
            $('.top-menu').addClass('fixed-menu');
        } else {
            $('.top-menu').removeClass('fixed-menu');
        }

        // Show or hide toTop
        if (scrolledY >= 300) {
            $('.toTop').show();
        } else {
            $('.toTop').hide();
        }
    });

    // Scroll toTop
    $('.toTop').unbind('click').click(function () {
        $('body,html').animate({scrollTop: 0}, 700);
    });

    // Active menu
    $(".top-menu ul li, .pushy-mob-menu li").each(function () {
        var url = window.location.pathname;

        $(".top-menu li a, .pushy li a").removeClass("active");
        $('.top-menu li a[href="' + url + '"], .pushy-mob-menu li a[href="' + url + '"]').parent('li').addClass('active');
    });

    // Resize window
    $(window).resize(function () {

        var widthWindowResize = $(window).outerWidth(true) + widthScroll_Y();

        // Mobile menu
        if (widthWindowResize <= 848) {
            $('.top-menu').removeClass().addClass('pushy-mob-menu');
        } else {
            var pushMobmenu = $('.pushy-mob-menu');

            if (pushMobmenu.is(':hidden')) {
                pushMobmenu.removeAttr('style');
            }
            pushMobmenu.removeClass().addClass('top-menu');
        }

        if (widthWindowResize <= 540) {
            if ($('.call-us').prev('.mob-menu').length == 1) {
                $('.mob-menu').insertBefore('header .pushy-mob-menu', '');
            }
        } else {
            if ($('.call-us').next('.mob-menu').length == 1) {
                $('.mob-menu').insertBefore('header .call-us', '');
            }
        }

        // Name element H1
        var hNameProduct = $('.mattress-detail h1');
        if (widthWindowResize <= 640) {
            $('.goods h1').prependTo('.mattress-detail');
        } else {
            if (hNameProduct.length > 0) {
                hNameProduct.prependTo('.goods');
            }
        }
    });

    // Add more element
    $('.more-el').unbind('click').click(function () {
        var rel = $(this).find('input[name="more-el"]').val().split("|");

        $.ajax({
            url: '/static/?ajax=ok',
            type: "POST",
            data: {nextLine: rel[0], siteLang: rel[1]},
            success: function (response) {
                var res = JSON.parse(response);

                if ($(res.html).length > 0) {
                    $(res.html).insertBefore($(".products .block-title:last"), '').fadeIn(1100);
                    var valRel = (+rel[0] + 1) + '|' + rel[1];
                    $('input[name="more-el"]').val(valRel);
                }

                if (res.end == 0) {
                    $('.products .block-title:last').remove();
                }
            }
        });
    });

    // Mini scroll fixed-menu
    var pathname = window.location.pathname;
    var arrPathname = ['/', '/ru/'];

    if (jQuery.inArray(pathname, arrPathname) < 0 && globWindowWidth >= 848) {
        if ($.cookie('scroll') === undefined) {
            $.cookie('scroll', pathname, {expires: 1, path: pathname});
        } else {
            $.removeCookie('scroll', {path: pathname});
            $.cookie('scroll', pathname, {expires: 1, path: pathname});
        }
    } else {
        scrollMenuPanel();
        $.removeCookie("scroll", {path: pathname});
    }

    // Delete goods
    $(".del-good").unbind('click').click(function () {
        var temp = JSON.parse($.cookie('items')); // розпаковуємо массив
        var id = 'g' + $(this).find('span').attr('rel_id');
        delete temp[id];

        $(this).parents('tr').hide('slow', function () {
            $(this).remove();
        });

        $.cookie('items', JSON.stringify(temp), {expires: 360, path: '/'});

        if (countCookies(temp) == 0) {
            location.reload();
        }

        var card = $('a[href$="/order/"]:first-child span').text();
        $('a[href$="/order/"] span').text(--card);

        // Edit order price
        setTimeout(function () {
            var globPrice = 0;
            $('.line-tab-goods tr').each(function (i, el) {
                globPrice = globPrice + parseInt($(el).find('.el_prive_hidden').attr('rel_aep'));
                $('.all-goods-price').text(globPrice.toLocaleString());
            });
        }, 1000);
    });

    // Prev or next slide click
    $(window).keydown(function (eventObject) {
        if ($('.fixed-overlay').css('display') == 'block') {
            if (eventObject.which == 37) {
                $('.btnModal-right').trigger('click');
            }
            if (eventObject.which == 39) {
                $('.btnModal-left').trigger('click');
            }
        }
    });

    $('.btnModal-right').click(function () {
        var blockPhoto = $('.n-ActIndex');
        var modalMain = $('.modalMain');

        if ($(blockPhoto).prev('div').length) {
            var prevClone = $(blockPhoto).prev('div').find('img').clone(true);

            if (!modalMain.find('img:first-child').is(':animated')) {
                modalMain.find('img:first-child').height(0).animate({
                    opacity: 0
                }, 700, 'swing');

                prevClone.css({opacity: 0});

                modalMain.append(prevClone);

                prevClone.animate({opacity: 1}, 700, 'swing', function () {
                    $(this).prev().remove();
                });

                blockPhoto.removeClass('n-ActIndex');
                $(blockPhoto).prev('div').addClass('n-ActIndex');
            }
        }
    });

    $('.btnModal-left').click(function () {
        var blockPhoto = $('.n-ActIndex');
        var modalMain = $('.modalMain');

        if ($(blockPhoto).next('div').length) {
            var nextClone = $(blockPhoto).next('div').find('img').clone(true);

            if (!modalMain.find('img:first-child').is(':animated')) {
                modalMain.find('img:first-child').height(0).animate({
                    opacity: 0
                }, 700, 'swing');

                nextClone.css({opacity: 0});

                modalMain.append(nextClone);

                nextClone.animate({opacity: 1}, 700, 'swing', function () {
                    $(this).prev().animate({opacity: 0}, function () {
                        $(this).remove();
                    });
                });

                blockPhoto.removeClass('n-ActIndex');
                $(blockPhoto).next('div').addClass('n-ActIndex');
            }
        }
    });

    // Modal close window
    $('.fixed-overlay .icon-cross').click(function () {
        $('.modal').animate({opacity: 0}, 200, function () { // після виконання минулої анімації
            $(this).css('display', 'none');
            $('.fixed-overlay img').remove();
            $('.n-ActIndex').removeClass('n-ActIndex');
            $('.fixed-overlay').fadeOut(400);
        });
    });

    $(document).mouseup(function (e) {
        if ($('.fixed-overlay').css('display') == 'block') {
            var elNotBlock = $('.btnModal-left, .btnModal-right, .modal_container');
            if (!$(elNotBlock).is(e.target) && $(elNotBlock).has(e.target).length === 0) {
                $('.modal').css('display', 'none');
                $('.fixed-overlay img').remove();
                $('.n-ActIndex').removeClass('n-ActIndex');
                $('.fixed-overlay').fadeOut(400);
            }
        }
    });

    // Start
    $(window).resize();
    $(window).scroll();

    // Map
    if (pathname == '/contacts/' || pathname == '/ru/contacts/') {
        mapStart();
    }
});

function mapStart() {
    var map = new google.maps.Map(document.getElementById('map-canvas'), {
        center: {lat: 49.5504868, lng: 25.5866435},
        zoom: 17,
        mapTypeId: google.maps.MapTypeId.ROADMAP, // Відображення карти
        disableDefaultUI: true, // Відключаєм стандартні настройки
        zoomControl: true, // Значок + -
        mapTypeControl: true, // Значок вибір типу карти
        mapTypeControlOptions: {
            style: google.maps.MapTypeControlStyle.DROPDOWN_MENU,
            position: google.maps.ControlPosition.LEFT_TOP
        },
        scaleControl: false, // Метраж на карті
        streetViewControl: true, // Мождивість попасти у вулицю онлайн
        rotateControl: false,
        scrollwheel: false
    });

    var marker = new google.maps.Marker({
        position: {lat: 49.550666, lng: 25.586499},
        map: map,
        title: 'Children\'s Dream',
        animation: google.maps.Animation.DROP
    });

    var textH2 = (window.location.pathname == '/contacts/'? 'Магазин дитячих матраців' : 'Магазин детских матрасов');
    var infowindow = new google.maps.InfoWindow({
        content: '<div class="content-map"><h2>' + textH2 + ' | Children\'s Dream</h2></div>'
    });

    google.maps.event.addListener(marker, 'click', function () {
        infowindow.open(map, marker);
    });
}

function moreComments(submit) {
    var rel = $(submit).attr('data-param').split("|");

    $.ajax({
        url: '/comments/?more=ok&ajax=ok',
        type: "POST",
        data: {nextLine: rel[0], siteLang: rel[1]},
        success: function (response) {
            var res = JSON.parse(response);

            //$(submit).attr(onclick);
            if ($(res.html).length > 0) {
                $(".view-comments .comment-item:last").after($(res.html).fadeIn('fast'));

                var valRel = (+rel[0] + 1) + '|' + rel[1];
                $(submit).attr('data-param', valRel);
            }

            if (res.end == 0) {
                $(submit).remove();
            }
        }
    });
}

function edit_price(el) {
    var price = parseInt($(el).parents('tr').find('.el_prive_hidden').val());
    var count = $(el).val();

    if (count > 99) {
        count = 99;
        $(el).val(99);
    }

    var gPrice = count * price;
    var globPrice = 0;

    $(el).parents('tr').find('.el_prive_hidden').attr('rel_aep', gPrice);
    $(el).parents('tr').find('.edJsPrice').text(gPrice.toLocaleString());

    $('.line-tab-goods tr').each(function (i, el) {
        globPrice = globPrice + parseInt($(el).find('.el_prive_hidden').attr('rel_aep'))
    });

    $('.all-goods-price').text(globPrice.toLocaleString());
    $('input[name="sum_price"]').val(globPrice);
}

function countCookies(obj) {
    var count = 0;
    for (var prs in obj) {
        if (obj.hasOwnProperty(prs)) count++;
    }
    return count;
}

function addToCard(id_el, text_submit, count) {
    var items = {};

    if ($.cookie('items') === undefined) {
        items['g' + id_el] = count;
        $.cookie('items', JSON.stringify(items), {expires: 360, path: '/'});
    } else {
        var temp = JSON.parse($.cookie('items')); // розпаковка массива
        temp['g' + id_el] = count; // добавити елемент
        $.cookie('items', JSON.stringify(temp), {expires: 360, path: '/'}); // запакувати назад
    }

    $('.icon-basket').remove();
    $('.add-shop').addClass('backet-ok').removeAttr('onclick').text(text_submit);
    var card = $('a[href$="/order/"]:first-child span').text();
    $('a[href$="/order/"] span').text(++card);
}

function widthScroll_Y() {
    var div = document.createElement('div');
    $('body').append($(div).css({
        'overflowY': 'scroll',
        'width': '50px',
        'height': '50px',
        'visibility': 'hidden',
        'position': 'absolute'
    }));
    var scrollWidth;

    if (hasVerticalScroll()) {
        scrollWidth = div.offsetWidth - div.clientWidth;
    } else {
        scrollWidth = 0;
    }

    $(div).remove();
    return scrollWidth;
}

function hasVerticalScroll(node) {
    if (node == undefined) {
        if (window.innerHeight)
            return document.body.offsetHeight > innerHeight;
        else
            return document.documentElement.scrollHeight >
                document.documentElement.offsetHeight ||
                document.body.scrollHeight > document.body.offsetHeight;
    }
    else {
        return node.scrollHeight > node.offsetHeight;
    }
}

function scrollMenuPanel() {
    if (window.location.hash != '') {
        setTimeout(function () {
            $('.top-menu a[href*=' + window.location.hash + ']').trigger('click');
        }, 300);
    }
}

function showHide() {
    var mobMenu = $('.mob-menu');

    if (mobMenu.is('.aciveMenu')) {
        mobMenu.removeClass('aciveMenu');
    } else {
        mobMenu.addClass('aciveMenu');
    }

    $('.pushy-mob-menu').slideToggle("middle");
}

function Slider(eq, animate, stop) {
    var index = $('.main-banner .active-slide').index();
    var slide_item = $('.main-banner .slide-item');
    var slide_row = $('.row-slide span');

    if (eq !== undefined) {
        index = eq;
    }

    if (animate !== undefined) {
        index += 1;
    }

    if (slide_item.eq(index).length == 0) {
        index = 0;
    }

    if (stop !== undefined) {
        slide_row.removeClass('active-row').eq(index).addClass('active-row');
        slide_item.removeClass('active-slide').removeAttr('style').eq(index).fadeIn('slow').addClass('active-slide');
    }

    if (animate !== undefined) {
        setTimeout(function () {
            Slider(undefined, 'Y', 'Y');
        }, 20000);
    }
}

function modalPhoto(el, more) {
    var globWindowWidth = $(window).outerWidth(true) + widthScroll_Y();

    if (globWindowWidth > 800) {

        if (more == 'N') {
            var clone = $(el).clone();
            $('span[class^="btnModal-"]').hide();

            $('.modalMain').append(clone);
            $('.modal img').css({'max-width': clone[0].naturalWidth, 'max-height': clone[0].naturalHeight});
        } else {
            $('.slider-nav .slick-current.slick-center').addClass('n-ActIndex');
            var clone = $(el).clone();

            $('.modalMain').append(clone);
        }

        $('.fixed-overlay').fadeIn(400, function () {
            $('.modal').css('display', 'flex').animate({opacity: 1}, 200);
        });
    }
}

function checkForm(nameForm) {
    var obj = $('form[name=' + nameForm + '] :input');
    var error = 0;

    for (var i = 0; i < (obj.length - 1); ++i) {
        var input = $(obj[i]);

        if (input.attr('data-no-checked') !== undefined) {
            continue;
        }

        // Check email
        if (input.attr('name') == 'email') {
            var atpos = input.val().indexOf("@");
            var dotpos = input.val().lastIndexOf(".");

            if (!(atpos < 1 || dotpos < atpos + 2 || dotpos + 2 >= input.val().length) == false) {
                error = 1;
                input.addClass('error');
            }
        }

        if (input.val().length == 0) {
            input.addClass('error');
            error = 1;
        }
    }

    if (error == 0) {
        if (nameForm == 'form-comment') {
            $.ajax({
                type: "POST",
                url: "/comments/?comments=ok&ajax=ok",
                cache: false,
                data: {
                    "name": $(obj[0]).val(),
                    "email": $(obj[1]).val(),
                    "text": $(obj[2]).val(),
                    "ok": $(obj[3]).val()
                },

                success: function (msg) {
                    var response = JSON.parse(msg);

                    if (response.error == "ok") {
                        setTimeout(function () {
                            $(".hack-error").fadeIn("slow").delay(5000).fadeOut(800);
                        }, 100);
                    }
                    if (response.status == "ok") {
                        $(".form-comment form").hide(600);

                        setTimeout(function () {
                            $(".thanks").show('drop').delay(4500).fadeOut(800);
                        }, 1500);

                        setTimeout(function () {
                            $(".form-comment form").show('drop');
                        }, 8500);

                        $(".form-comment input[type='text'], .form-comment input[type='email'], .form-comment textarea").val('');
                    }
                }
            });

            return false;
        } else {
            return true;
        }
    } else {
        setTimeout(function () {
            for (var i = 0; i < (obj.length - 1); ++i) {
                if ($(obj[i]).is('.error')) {
                    $(obj[i]).removeClass();
                }
            }
        }, 3500);

        return false;
    }
}