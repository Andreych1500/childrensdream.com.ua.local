$(document).ready(function () {
    // Open new information
    $('.new-info').click(function () {
        $('.info-open-click').css('left', $(this).offset().left).slideToggle("normal");
    });

    // Active menu
    $('.navigation li').click(function () {
        if ($('.active-section').length == 0) {
            $.cookie("act-menu", $(this).index(), {expires: 14, path: '/'});
        }

        if ($(this).is('.act-navigation')) {
            $.removeCookie("act-menu", {path: '/'});
            $(this).removeAttr('class');
            $('.navigation-lv2').removeClass('act-nav-lv2');
            $('.section-lv2').removeClass("act-section");
        } else {
            $.cookie("act-menu", $(this).index(), {expires: 14, path: '/'});
            $('.navigation .act-navigation').removeAttr('class');
            $(this).addClass('act-navigation');
            $('.navigation-lv2').addClass('act-nav-lv2');
            $('.section-lv2').removeClass('act-section').eq($(this).index()).addClass('act-section');
        }
    });

    // Active section menu
    $('.list-sec-menu').click(function (e) {
        if (e.target.className == 'list-sec-menu' || 'act-list') {
            var el = $(e.target);
            var indexMenu = $(el).parent('.section-lv2').index() + ':' + $(el).index();
            var cookie = [];

            // Animation
            if ($(el).is('.act-list')) {
                $(el).find('.section-module').slideUp('middle', function () {
                    $(el).removeClass('act-list');
                });
            } else {
                $(el).find('.section-module').slideDown('middle', function () {
                    $(el).addClass('act-list');
                });
            }

            // Save
            if ($.cookie("act-menu-lv2") !== undefined) {
                var array = JSON.parse($.cookie("act-menu-lv2"));

                if ($.inArray(indexMenu, array) >= 0) {
                    array = $.grep(array, function (velue) {
                        return velue !== indexMenu;
                    });

                    if (array.length <= 0) {
                        $.removeCookie("act-menu-lv2", {path: '/'});
                    } else {
                        $.cookie("act-menu-lv2", JSON.stringify(array), {expires: 14, path: '/'});
                    }
                } else {
                    array.push(indexMenu);
                    $.cookie("act-menu-lv2", JSON.stringify(array), {expires: 14, path: '/'});
                }
            } else {
                cookie.push(indexMenu);
                $.cookie("act-menu-lv2", JSON.stringify(cookie), {expires: 14, path: '/'});
            }
        }
    });

    // Deactive menu
    $('.to-admin').click(function () {
        $.removeCookie("active-menu", {path: '/'});
    });

    // Active tabs
    $('.tabs-panel li').click(function () {
        $('.tabs-panel li').removeAttr('class');
        $(this).addClass('active-tab');
        $('.content-form .tabs').removeClass('active-block-tabs').eq($(this).index()).addClass('active-block-tabs');
    });

    // Backup check
    $('.reload-file[href$="?backup=ok"]').click(function () {
        if ($('.operation-info').length == 0) {
            setTimeout(function () {
                $('.bottom-table').append('<div class="operation-info">Зачекайте будь-ласка!<img src="/skins/admin/img/load.gif" alt="loading"></div>');
                $('.operation-info').slideDown('middle');
            }, 600);
        }
    });

    // Add element input
    $('.add-el-list').click(function () {
        if ($(this).attr('data-type') == 'text') {
            $(this).before('<input type="' + $(this).attr('data-type') + '" name="' + $(this).attr('data-name') + '" value="" ' + $(this).attr('data-attr') + '>');
        }

        if ($(this).attr('data-type') == 'textarea') {
            $(this).before('<textarea name="' + $(this).attr('data-name') + '" ' + $(this).attr('data-attr') + '></textarea>');
        }
    });

    // All checked element
    $('input[name="all_cheked"]').click(function () {
        if ($(this).is(":checked") == true) {
            $('.illustration-table tr:not(:first-child) td:first-child input').each(function () {
                $(this).prop("checked", true).parents('tr').addClass('c-checked');
            });
        } else {
            $('.illustration-table tr:not(:first-child) td:first-child input').each(function () {
                $(this).prop("checked", false).parents('tr').removeClass('c-checked');
            });
        }
    });

    // Checked style element
    $('.illustration-table tr:not(:first-child) td:first-child input[type="checkbox"]').click(function () {
        if ($(this).is(":checked") == true) {
            $(this).parents('tr').addClass('c-checked');
        } else {
            $(this).parents('tr').removeClass('c-checked');
        }
    });

    // Double click open function
    $('.illustration-table tr:not(:first-child) td:not(:first-child)').dblclick(function () {
        if ($(this).parents('.c-checked').length == 0) {
            var link = $(this).parents('tr').find('.menu-update a[href*="?edit="], a:first-child').attr('href');

            if (link !== undefined) {
                document.location.href = link;
            }
        }
    });

    // Open option filter
    $('.add-field-filter').click(function () {
        var el_block = $('.filter-option-list');

        if ($(el_block).css('display') == 'none') {
            $(this).before('<span class="triangle"></span>');
            $(el_block).slideDown('middle');
        }

        if ($(el_block).css('display') == 'block') {
            $(document).mouseup(function (e) {
                if (!$(el_block).is(e.target) && $(el_block).has(e.target).length === 0) {
                    $(el_block).slideUp('middle', function(){
                        $('.triangle').remove();
                    });
                }
            });
        }
    });

    // Filter
    $('.filter-option-list div').click(function () {
        var index = $(this).index();
        var cookie = [];

        if ($(this).is('.act-option')) {
            $(this).removeClass('act-option');
            $('.filter .input-value').eq(index).fadeOut('slow', function () {
                if ($(this).find('input').length) {
                    $(this).find('input[name^="filter"]').attr('value', '');
                } else if ($(this).find('select').length) {
                    $(this).find('select option').removeAttr('selected').eq(0).attr('selected', true);
                }
                $(this).find('input, select').attr('disabled', true);
            });
        } else {
            $(this).addClass('act-option');
            $('.filter .input-value').eq(index).fadeIn('slow', function () {
                $(this).find('input, select').attr('disabled', false);
            });
        }

        // Save
        if ($.cookie("filter") !== undefined) {
            var array = JSON.parse($.cookie("filter"));

            if ($.inArray(index, array) >= 0) {
                array = $.grep(array, function (velue) {
                    return velue !== index;
                });

                if (array.length <= 0) {
                    $.removeCookie("filter", {path: window.location.pathname});
                } else {
                    $.cookie("filter", JSON.stringify(array), {expires: 30, path: window.location.pathname});
                }
            } else {
                array.push(index);
                $.cookie("filter", JSON.stringify(array), {expires: 30, path: window.location.pathname});
            }
        } else {
            cookie.push(index);
            $.cookie("filter", JSON.stringify(cookie), {expires: 30, path: window.location.pathname});
        }
    });

    // Edit element on window
    $('.illustration-table input[name^="ids"], input[name="all_cheked"]').click(function () {
        if ($('.illustration-table tr:not(:first-child) td:first-child input:checked').length > 0) {
            $('.dynamicEdit').addClass('dynamicEdit-act').attr('onclick', 'editElements()');
        } else {
            $('.dynamicEdit').removeClass('dynamicEdit-act').removeAttr('onclick');
        }
    });
});

function getInfoFile(el, dirSave) {
    $('#control').attr({
        'data-size': $(el).parents('.upload_file').attr('data-size'),
        'data-set': $(el).parents('.upload_file').attr('id'),
        'data-dir': dirSave
    }).trigger('click');
}

function resetFile(control) {
    control.replaceWith(control.clone(true));
}

function addPhoto(el) {
    if ($(el).val().length > 1) {
        var parameter = new FormData($('#to_file')[0]);

        parameter.append('directory', $(el).attr('data-dir'));
        parameter.append('size', $(el).attr('data-size'));

        var elSet = $('#' + $(el).attr('data-set'));

        $.ajax({
            url: "/admin/setting/personal-interface/?addPhoto=ok&ajax=ok",
            type: "POST",
            data: parameter,
            cache: false,
            contentType: false,
            processData: false,
            success: function (response) {
                var res = JSON.parse(response);

                // delete_file
                if (elSet.find('input[name^="del"]').val() != '') {
                    var del_files = elSet.find('input[name^="del"]').val();
                }

                if (del_files !== undefined && del_files.length > 0) {
                    $.ajax({
                        url: '/admin/setting/personal-interface/?delPhoto=ok&ajax=ok',
                        type: "POST",
                        data: {'file_delete': del_files},
                        cache: false
                    });
                }

                if (res['error'] !== undefined) {
                    elSet.find('button + input').val('');
                    elSet.find('button').text('Вибрати файл');
                    elSet.find('.photos').addClass('hidden').find('img').removeAttr('src');
                    alert('Загружайте лише фото!');
                } else {
                    elSet.find('button + input[type="hidden"]').attr('value', res['file'] + '|' + res['name_dir'] + '|' + res['name_file']);
                    elSet.find('button').text(res['name_file']);
                    elSet.find('input[name^="del"]').val(res['file']);
                    elSet.find('.photos').removeClass('hidden'); // update image
                    elSet.find('.photos img').attr('src', res['file']);
                }

                resetFile($("#control")); //reset file input
            }
        });
    }
}

function deleteList(el) {
    var e = window.event;

    if (e.shiftKey && e.keyCode == 46 && $(el).index() != 0) {
        $(el).remove();
    }
}

function openMenuUpdate(el) {
    var el_block = $(el).siblings('.menu-update');

    if ($(el_block).css('display') == 'none') {
        el_block.slideDown('middle').parents('tr').find('td').css('background', '#E2E7CB');
    }

    if ($(el_block).css('display') == 'block') {
        $(document).mouseup(function (e) {
            if (!$(el_block).is(e.target) && $(el_block).has(e.target).length === 0) {
                $(el_block).slideUp('middle').parents('tr').find('td').removeAttr('style');
            }
        });
    }
}

function okFrom() {
    return confirm('Ви підтверджуєте свою дію?');
}

function editElements() {
    var checked = $('.illustration-table tr:not(:first-child) td:first-child input:checked');
    var obj = {};
    var inputArr = [];
    var resultObj = [];
    var resultArr = [];


    // Add submit
    $('.dynamicEdit').removeAttr('onclick').removeClass('dynamicEdit').html('<input type="submit" value="Зберегти" name="el-save"><a href="' + document.location.pathname + '" class="no-save">Відмінити</a>');

    // Create array inputs
    $(checked).each(function (i, el) {
        var ex_el = $(el).parents('tr').find('td[data-input^="ex|"]');

        for (i = 0; i < ex_el.length; ++i) {
            inputArr.push($(ex_el).eq(i));
        }

        obj[$(el).val()] = inputArr; // add id input[ex]
        inputArr = []; // reset array
    });

    // Formation input
    for (var prop in obj) {
        for (var elProp in obj[prop]) {
            var explodeData = obj[prop][elProp].attr('data-input').split('|').splice(1, 2);

            if (explodeData[0] == 'text') {
                resultArr.push('<input type="text" name="' + explodeData[1] + '" value="' + obj[prop][elProp].text() + '">');
            }

            if (explodeData[0] == 'email') {
                resultArr.push('<input type="email" name="' + explodeData[1] + '" value="' + obj[prop][elProp].text() + '">');
            }

            if (explodeData[0] == 'number') {
                resultArr.push('<input min="1" type="number" name="' + explodeData[1] + '" value="' + obj[prop][elProp].text() + '">');
            }

            if (explodeData[0] == 'checkbox') {
                var check = 'checked';

                if (obj[prop][elProp].text().trim() == 'Ні' || obj[prop][elProp].text().trim() == 'Нет' || obj[prop][elProp].text().trim() == 'No') {
                    check = '';
                }

                resultArr.push('<input ' + check + '  type="checkbox" name="' + explodeData[1] + '" value="1">');
            }
        }

        resultObj[prop] = resultArr;
        resultArr = []; // Reset
    }

    // Edit html code
    $('.illustration-table tr:not(:first-child) td:first-child input, input[name="all_cheked"]').attr('disabled', true); // disable checkbox

    for (var propId in resultObj) {
        for (var elProp in resultObj[propId]) {
            $('td[data-input$="' + $(resultObj[propId][elProp]).attr("name") + '"]').html(resultObj[propId][elProp]);
        }
    }
}