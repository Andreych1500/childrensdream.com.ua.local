$(document).ready(function() {

    // --- remove class ---
    setTimeout(function(){
        $('.no-active').removeClass('no-active');
    }, 100);
    // --- end remove class ---


    // --- active section menu ---
    $(".admin-left-panel li").each(function( index ) {
        var url = window.location.pathname.split('/')[2];

        $(".admin-left-panel li a").removeClass("active");
        $('.admin-left-panel li a[href="/admin/'+url+'"]').addClass('active');
    });
    // --- end active section ---


    // --- checked all element ---
    $('input[name="all_cheked"]').click(function(){
        if($(this).is( ":checked" ) == true){
            $('.edFormEdit tr:not(:first-child) td:first-child input').each(function(){
                $(this).parents('tr').addClass('c-checked');
                $(this).prop("checked", true);
            });
        } else {
            $('.edFormEdit tr:not(:first-child) td:first-child input').each(function(){
                $(this).prop("checked", false);
                $(this).parents('tr').removeClass('c-checked');
            });
        }
    });
    // --- end checked all element ---


    // --- checked style element ---
    $('.edFormEdit tr:not(:first-child) td:first-child input[type="checkbox"]').click(function(){
        if($(this).is( ":checked" ) == true){
            $(this).parents('tr').addClass('c-checked');
        } else {
            $(this).parents('tr').removeClass('c-checked');
        }
    });
    // --- end checked style ---


    // --- edit el on double click ---
    $('.edFormEdit tr:not(:first-child) td:not(:first-child)').dblclick(function(){
        if($(this).parents('.c-checked').length == 0){
            document.location.href = $(this).siblings('td').find('.menu-edit a:first-child').attr('href');
        }
    });
    // --- end edit el on double click ---


    // --- open block new information ---
    $('.new-info').unbind('click').click(function(){
        $('.info-open-click').slideToggle( "normal");
    });
    // --- end open block new information ---
});

function okFrom(){
    return confirm('Ви підтверджуєте свою дію?');
}

function openEdit(el){
    var el_block = $(el).siblings('.menu-edit');
    $(el_block).css('display','block');
    $(el_block).parents('tr').addClass('activeContent');

    if($(el_block).css('display') == 'block'){
        $(document).mouseup(function (e){
            if (!$(el_block).is(e.target) && $(el_block).has(e.target).length === 0) {
                $(el_block).hide();
                $('.activeContent').removeClass('activeContent');
            }
        });
    }
}

function deleteElement(id_el, this_el, i_block_table){
    var val_file = $(this_el).parents('.activeContent').find('input[name^="del"]').val();
    var el_file = [];

    if(val_file !== undefined){
        el_file = val_file.split('|');
    }

    if(id_el != '' && i_block_table != '') {
        $.ajax({
            url: '/mylti_file/delete_el.php',
            type: "POST",
            data: {'del_el': id_el, 'del_file' : el_file, 'table' : i_block_table},
            success: function (response) {
                var res = JSON.parse(response);

                if(res.error === undefined){
                    if (res.delete == 'ok') {
                        var url = window.location.pathname.split('/')[2];
                        document.location.href = '/admin/' + url;
                    }
                }
            }
        });
    }
}