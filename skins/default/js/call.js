function removeError(el){
    el.addClass('errors');
    setTimeout(function(){
        el.addClass('no-errors');
        setTimeout(function(){
            el.removeClass();
        }, 1400);
    }, 2800);
}

function callMe(){
    var name   = $(".form-call input[name='name']").val();
    var email  = $(".form-call input[name='email']").val();
    var thems  = $(".form-call input[name='thems']").val();
    var text   = $(".form-call textarea[name='text']").val();
    var capcha = $(".form-call input[name='capcha']").val();
    var error  = 0;

    var atpos = email.indexOf("@");
    var dotpos = email.lastIndexOf(".");
    if(!(atpos<1 || dotpos<atpos+2 || dotpos+2>=email.length) == false){
        error = 1;
        removeError($(".form-call input[name='email']"));
    }

    if(name == ''){
        error = 1;
        removeError($(".form-call input[name='name']"));
    }

    if(email == ''){
        error = 1;
        removeError($(".form-call input[name='email']").addClass('errors'));
        $(".form-call input[name='email']").addClass('errors');
    }

    if(text == ''){
        error = 1;
        removeError($(".form-call textarea[name='text']").addClass('errors'));
    }

    if(thems == ''){
        error = 1;
        removeError($(".form-call input[name='thems']").addClass('errors'));
    }

    if(capcha == ''){
        error = 1;
        removeError($(".form-call input[name='capcha']").addClass('errors'));
    }

    if(error == 0){
        return true;
    } else {
        return false;
    }
}