$(document).ready(function() {
    var clientH = document.documentElement.clientHeight;
    var contentH = $('.custom-content-form').outerHeight(true) - 275;
    var offset = $('.custom-content-form').offset();

    $(window).scroll(function () {
        var scrolledY = window.pageYOffset || document.documentElement.scrollTop;
        
        if(contentH > clientH && scrolledY >= offset.top){
            $('.line-custom').css({'position':'fixed','top':'0','z-index':'9'});
            $('.edFormEdit').css('margin-top','65px');
            //#E6EEF0
        } else {
            $('.line-custom').removeAttr('style').css({'position':'static'});
            $('.edFormEdit').removeAttr('style');
        }

        if($('.c-checked').length) {
            if((clientH + scrolledY -58) > $('.edFormEdit').outerHeight(true)){
                $('.dinamicEdit').removeAttr('style');
            } else {
                $('.dinamicEdit').css({'position': 'fixed', 'bottom': '0', 'z-index': '9'});
            }
        }
    });


    $('body').on('click', function(){
        var scrolledY = window.pageYOffset || document.documentElement.scrollTop;
        if($('.c-checked').length){


            if($('.edFormEdit').outerHeight(true) > (clientH + scrolledY)){
                $('.dinamicEdit').css({'position':'fixed','bottom':'0','z-index':'9'});
            }
        } else {
            $('.dinamicEdit').removeAttr('style');
        }
    });

    // --- active section menu ---
    $(".admin-left-panel li").each(function( index ) {
        var url = window.location.pathname.split('/')[2];

        $(".admin-left-panel li a").removeClass("active");
        $('.admin-left-panel li a[href="/admin/'+url+'/"]').addClass('active');
    });
});

function getDocumentScroll() {
    var scrollHeight = Math.max(
        document.body.scrollHeight, document.documentElement.scrollHeight,
        document.body.offsetHeight, document.documentElement.offsetHeight,
        document.body.clientHeight, document.documentElement.clientHeight
    );

    return {
        top: pageYOffset,
        bottom: pageYOffset + document.documentElement.clientHeight,
        height: scrollHeight
    };
}

function deleteElement(id_el, this_el, i_block_table){

    if(okFrom()){
        var val_file = $(this_el).parents('.activeContent').find('input[name^="del"]').val();
        var el_file = [];

        if(val_file !== undefined){
            el_file = val_file.split('|');
        }

        if(id_el != '' && i_block_table != '') {
            $.ajax({
                url: '/ajax/delete_el.php?ajax=ok',
                type: "POST",
                data: {'del_el': id_el, 'del_file' : el_file, 'table' : i_block_table},
                success: function (response) {
                    var res = JSON.parse(response);

                    if(res.error === undefined){
                        if (res['delete'] == 'ok') {
                            var url = window.location.pathname.split('/')[2];
                            document.location.href = '/admin/' + url;
                        }
                    }
                }
            });
        }
    }
}