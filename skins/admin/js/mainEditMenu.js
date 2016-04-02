$(document).ready(function(){

    //--- add function edit element on window ---
    $('.edFormEdit tr:not(:first-child) td:first-child input, input[name="all_cheked"]').click(function(){
        if($('.edFormEdit tr:not(:first-child) td:first-child input:checked').length > 0){
            $('.icon-pencil').addClass('edit-active').attr('onclick','editElements();');
        } else {
            $('.icon-pencil').removeClass('edit-active').removeAttr('onclick');
        }
    });
    // --- end add function edit element on window ---

});

function editElements(){
    var checked = $('.edFormEdit tr:not(:first-child) td:first-child input:checked');
    var obj = {};
    var resultObj = [];
    var resultArr = [];

    // --- save submit ---
    $('.edit-active').remove();
    // --- end save submit ---

    // --- create format inputs ---
    $(checked).each(function(i, el){
       var ex_el = $(el).parents('tr').find('td[rel_edit^="ex|"]');
       obj[$(el).val()] = [$(ex_el).eq(0), $(ex_el).eq(1), $(ex_el).eq(2)]; // add input[ex]
    });
    // --- end create format inputs ---

    // --- formation input ---
    for(var prop in obj) {
        for(var elProp in obj[prop]){
            var explodeData = obj[prop][elProp].attr('rel_edit').split('|').splice(1,2);

            if(explodeData[0] == 'text'){
                resultArr.push(onText('text', explodeData[1], obj[prop][elProp].text()));
            }

            if(explodeData[0] == 'number'){
                resultArr.push(onNumber('number', explodeData[1], obj[prop][elProp].text()));
            }

            //if(explodeData[1] == 'sel'){
            //    console.log(1)
            //}
        }

        resultObj[prop] = resultArr;
        resultArr = []; // reset array
    }
    // --- end formation input ---

    // --- edit html code ---
    var editTag = '.edFormEdit tr:not(:first-child) td:first-child input:checked';

    for(var prop in resultObj) {
        for(var elProp in resultObj[prop]) {
            $(editTag+'[value="'+prop+'"]').parents('tr').find('td[rel_edit$="'+$(resultObj[prop][elProp]).attr("name")+'"]').html(resultObj[prop][elProp]);
        }
    }
    // --- end edit html code ---
}

// --- type inputs ---
function onText(type, name, value){
    return '<input type="'+type+'" name="'+name+'" value="'+value+'">';
}

function onNumber(type, name, value){
    return '<input min="1" type="'+type+'" name="'+name+'" value="'+value+'">';
}

//function onSelect(){
//
//}
// --- end type inputs ---