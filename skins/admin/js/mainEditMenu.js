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
    var inputArr  = [];

    // --- save submit ---
    $('.edit-active').remove();
    $('.dinamicEdit').html('<input type="submit" value="Зберегти" name="el-save"><a href="'+document.location.pathname+'" class="no-save">Відмінити</a>');
    // --- end save submit ---

    // --- create array inputs ---
    $(checked).each(function(i, el){
        var ex_el = $(el).parents('tr').find('td[rel_edit^="ex|"]');

        for( i=0; i<ex_el.length; ++i){
            inputArr.push($(ex_el).eq(i));
        }

        obj[$(el).val()] = inputArr; // add input[ex]
        inputArr = []; // reset array
    });
    // --- end create array inputs ---

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

            if(explodeData[0] == 'checkbox'){
                resultArr.push(onSelect('checkbox', explodeData[1], obj[prop][elProp].text()));
            }
        }

        resultObj[prop] = resultArr;
        resultArr = []; // reset array
    }
    // --- end formation input ---

    // --- edit html code ---
    var editTag = '.edFormEdit tr:not(:first-child) td:first-child input:checked';
    $('.edFormEdit tr:not(:first-child) td:first-child input, input[name="all_cheked"]').attr('disabled',true); // disable checkbox

    for(var prop in resultObj) {
        for(var elProp in resultObj[prop]) {
            $(editTag+'[value="'+prop+'"]').parents('tr').find('td[rel_edit$="'+$(resultObj[prop][elProp]).attr("name")+'"]').html(resultObj[prop][elProp]);
        }
    }
    // --- end edit html code ---
}

// --- type inputs ---
function onText(type, name, value, id){
    return '<input type="'+type+'" name="'+name+'" value="'+value+'">';
}

function onNumber(type, name, value, id){
    return '<input min="1" type="'+type+'" name="'+name+'" value="'+value+'">';
}

function onSelect(type, name, value, id){
    checked = '';

    if(value != 'Ні'){
        var checked = 'checked';
    }

    return '<input '+checked+'  type="'+type+'" name="'+name+'" value="1">';
}
// --- end type inputs ---