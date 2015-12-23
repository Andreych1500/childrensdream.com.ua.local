/*function callMe(){
    var name   = $(".form-comment input[name='name']").val();
    var email  = $(".form-comment input[name='email']").val();
    var text   = $(".form-comment textarea[name='text']").val();
    var error  = 0;

    var atpos = email.indexOf("@");
    var dotpos = email.lastIndexOf(".");
    if(!(atpos<1 || dotpos<atpos+2 || dotpos+2>=email.length) == false){
        error = 1;
        removeError($(".form-comment input[name='email']"));
    }

    if(name == ''){
        error = 1;
        removeError($(".form-comment input[name='name']"));
    }

    if(email == ''){
        error = 1;
        removeError($(".form-comment input[name='email']").addClass('errors'));
        $(".form-comment input[name='email']").addClass('errors');
    }

    if(text == ''){
        error = 1;
        removeError($(".form-comment textarea[name='text']").addClass('errors'));
    }


    if(error == 0){
        $.ajax({
            type:"POST",
            url:"/comments?ajax=1",
            cache:false,
            data:{ "name" : name, "email" : email, "text" : text },

            success: function(msg){
                var response = JSON.parse(msg); // непрацює у IE7
                if(response.warning == "ok"){
                    setTimeout(function(){
                        $(".hack-error").fadeIn("slow").delay(5000).fadeOut(800);
                    }, 100);
                }
                if(response.status == "ok"){
                    $(".form-comment form").hide(600);

                    setTimeout(function(){
                        $(".thanks").show('drop').delay(5000).fadeOut(800);
                    }, 1100);

                    setTimeout(function(){
                        $(".form-comment form").show('drop');
                    }, 7500);

                    $(".form-comment input[type='text'], .form-comment input[type='email'], .form-comment textarea").val("");
                }
            },

        });
    }

    return false;
}*/