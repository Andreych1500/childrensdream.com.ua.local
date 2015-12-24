$(document).ready(function() {

    $(".top-menu ul li").each(function( index ) {
        var url = window.location.pathname;

        $(".top-menu li a").removeClass("active");
        $('.top-menu li a[href="'+url+'"]').addClass('active');
    });

});

function okFrom(){
   return confirm('Ви підтверджуєте свою дію?');
}