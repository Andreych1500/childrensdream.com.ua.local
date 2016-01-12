// JavaScript Document
function removeError(el){
    el.addClass('error');
    setTimeout(function(){
        el.addClass('no-errors');
        setTimeout(function(){
            el.removeClass();
        }, 1400);
    }, 3000);
}

function myOrder(){
    var name    = $(".order input[name='name']").val();
    var email   = $(".order input[name='email']").val();
    var phone   = $(".order input[name='phone']").val();
    var city    = $(".order input[name='city']").val();
    var adres   = $(".order input[name='adres']").val();
    var capcha  = $(".order input[name='capcha']").val();
    var error  = 0;

    var atpos = email.indexOf("@");
    var dotpos = email.lastIndexOf(".");
    if(!(atpos<1 || dotpos<atpos+2 || dotpos+2>=email.length) == false){
        error = 1;
        removeError($(".order input[name='email']"));
    }

    if(name == ''){
        error = 1;
        removeError($(".order input[name='name']"));
    }

    if(phone == ''){
        error = 1;
        removeError($(".order input[name='phone']"));
    }

    if(city == ''){
        error = 1;
        removeError($(".order input[name='city']"));
    }

    if(capcha == ''){
        error = 1;
        removeError($(".order input[name='capcha']"));
    }

    if(adres == ''){
        error = 1;
        removeError($(".order input[name='adres']"));
    }

    if(email == ''){
        error = 1;
        removeError($(".order input[name='email']").addClass('errors'));
        $(".order input[name='email']").addClass('errors');
    }


    if(error == 0){
        return true;
    } else {
        return false;
    }
}