$(document).ready(function() {

     //$(".top-menu ul li").each(function( index ) {
     //    var url = window.location.pathname;
     //
     //    $(".top-menu li a").removeClass("active");
     //    $('.top-menu li a[href="'+url+'"]').addClass('active');
     //});

    var scrollHeight = Math.max(
        document.body.scrollWidth, document.documentElement.scrollWidth,
        document.body.offsetWidth, document.documentElement.offsetWidth,
        document.body.clientWidth, document.documentElement.clientWidth
    );
    console.log(scrollHeight);

    $( window ).resize(function() {
        var sss = Math.max(
            document.body.scrollWidth, document.documentElement.scrollWidth,
            document.body.offsetWidth, document.documentElement.offsetWidth,
            document.body.clientWidth, document.documentElement.clientWidth
        );
        console.log(sss);
    });
});