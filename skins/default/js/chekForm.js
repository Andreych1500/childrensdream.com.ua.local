function removeError(object, parent){
    var error = 0;

   $(object).each(function(j, index){
       // --- chek email ---
       if(index.selector == parent + " input[name='email']"){
           var atpos = $(index).val().indexOf("@");
           var dotpos = $(index).val().lastIndexOf(".");

           if(!(atpos<1 || dotpos<atpos+2 || dotpos+2>=$(index).val().length) == false){
               error = 1;
               $(index).addClass('errors');
           }
       }
       // --- end chek email ---

       if($(index).val().length == 0){
           $(index).addClass('errors');
           error = 1;
       }
   });

    setTimeout(function(){
        $(object).each(function(j, index){
            if($(index).is('.errors')){
                $(index).addClass('no-errors');
            }
        });

        setTimeout(function(){
            $(object).each(function(j, index){
                    $(index).removeClass();
            });
        }, 1400);
    }, 2000);

    return error;
}

function checkForm(parents, nameForm){
    var error  = 0;

    if(nameForm == 'form-contact') {
        var object = [
            $(parents + " input[name='name']"),
            $(parents + " textarea[name='text']"),
            $(parents + " input[name='thems']"),
            $(parents + " input[name='capcha']"),
            $(parents + " input[name='email']")
        ];
    } else if(nameForm == 'form-order'){
        var object = [
            $(parents + " input[name='name']"),
            $(parents + " input[name='email']"),
            $(parents + " input[name='phone']"),
            $(parents + " input[name='city']"),
            $(parents + " input[name='adres']"),
            $(parents + " input[name='capcha']")
        ];
    } else if(nameForm == 'form-comment'){
        var object = [
            $(parents + " input[name='name']"),
            $(parents + " input[name='email']"),
            $(parents + " textarea[name='text']"),
        ];
    }

    error = removeError(object, parents);

    if(nameForm == 'form-comment') {
        if(error == 0){
            $.ajax({
                type: "POST",
                url: "/comments?ajax=1",
                cache: false,
                data: {
                    "name":  $(parents + " input[name='name']").val(),
                    "email": $(parents + " input[name='email']").val(),
                    "text":  $(parents + " textarea[name='text']").val()
                },

                success: function (msg) {
                    var response = JSON.parse(msg); // непрацює у IE7
                    if (response.warning == "ok") {
                        setTimeout(function () {
                            $(".hack-error").fadeIn("slow").delay(5000).fadeOut(800);
                        }, 100);
                    }
                    if (response.status == "ok") {
                        $(".form-comment form").hide(600);

                        setTimeout(function () {
                            $(".thanks").show('drop').delay(5000).fadeOut(800);
                        }, 1100);

                        setTimeout(function () {
                            $(".form-comment form").show('drop');
                        }, 7500);

                        $(".form-comment input[type='text'], .form-comment input[type='email'], .form-comment textarea").val("");
                    }
                },

            });
        }

        return false;

    } else {
        if(error == 0){
            return true;
        } else {
            return false;
        }
    }
}