$(document).ready(function() {

    $(".top-menu ul li").each(function( index ) {
        var url = window.location.pathname;

        $(".top-menu li a").removeClass("active");
        $('.top-menu li a[href="'+url+'"]').addClass('active');
    });

    $('.add-shop .input-value input[name="name"]').keyup(function() {
        $('.add-shop .input-value input[name="seo_name"]').val((translit($('.add-shop .input-value input[name="name"]').val())).replace(/\s/g, '-'));
    });

});

function okFrom(){
   return confirm('Ви підтверджуєте свою дію?');
}