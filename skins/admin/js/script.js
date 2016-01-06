$(document).ready(function() {

    $(".top-menu ul li").each(function( index ) {
        var url = window.location.pathname;

        $(".top-menu li a").removeClass("active");
        $('.top-menu li a[href="'+url+'"]').addClass('active');
    });


    // translition no spec simvol
    $('.add-shop .input-value input[name="name"]').keyup(function() {
        if($('input[name="seo_el_name"]').val() === undefined ) {
            $('.add-shop .input-value input[name="seo_name"]').val((translit($('.add-shop .input-value input[name="name"]').val()))
                .replace(/\s/g, '-')
                .replace(/\*/g, '-')
                .replace(/\</g, '-')
                .replace(/\>/g, '-')
                .replace(/\//g, '-')
            );
        }
    });


    //add more file
    $('.add_more span').click(function(){
        var last_index = $('.upload_file[id*="more_photos"]').last().attr('rel_id');
        var size_more_el = $('.upload_file[id*="more_photos"]').last().attr('rel_size');

        ++last_index; // створюєм нові id

        var html_input_fyle = '<div class="input-value upload_file" rel_id="'+last_index+'" rel_size="'+size_more_el+'" id="more_photos_'+last_index+'">' +
            '<p></p><button type="button" onclick="clickOninput(this)">Вибрати файл</button><div class="up_file_text">Файл не вибраний</div>' +
            '<input type="hidden" value="" name="more_photos[]"><input type="hidden" value="" name="del_more[]">' +
            '<div class="photos hidden"><img src=""></div></div>';

        $('.upload_file[id*="more_photos"]').last().after(html_input_fyle);
    });

});

function resetFile(control){
    control.replaceWith( control = control.clone( true ) );
}

function okFrom(){
   return confirm('Ви підтверджуєте свою дію?');
}

function clickOninput(el){
    // input click file
    var new_inp = $('#to_file').find('input[type="file"]');

    /// інформація для видалення попереднього елемента
    $(el).siblings('input[type="hidden"]').val($(el).siblings('input[type="hidden"]').val());
    ///

    if($('input[name="seo_name"]').val().length > 5) {
        $(new_inp).attr('rel_size', $(el).parents('.upload_file').attr('rel_size'));
        $(new_inp).attr('rel_to_set', $(el).parents('.upload_file').attr('id')).trigger("click");
    } else {
        alert('Спочатку заповніть назву товару!')
    }
}

function addPhoto(el,stringValue){

    if(stringValue.length > 1){
        var dir_name = $('input[name="seo_name"]').val();
        var files = new FormData($('#to_file')[0]);
        files.append("directory", dir_name);
        files.append("del", $('#to_file input[name="del"]').val());
        files.append('size', $(el).attr('rel_size'));

       if($('#to_file input[name="update"]').length > 0){
           files.append("update", $('#to_file input[name="update"]').val());
       }
       if($('#to_file input[name="isset"]').length > 0){
            files.append("isset", $('#to_file input[name="isset"]').val());
       }

        var rel_to_set="#"+$(el).attr('rel_to_set');

        $.ajax({
            url: "/mylti_file/main.php",
            type: "POST",
            data: files,
            enctype: 'multipart/form-data',
            processData: false,
            contentType: false,
            success: function (response) {
                var res = JSON.parse(response);

                if(res.isset == 'element'){
                    alert('Товар з таким символьним кодом вже існує');
                } else {
                    if (res.error !== undefined) {
                        $(rel_to_set).find('.up_file_text').text('Загружайте лише фото!');
                        $(rel_to_set).find('.up_file_text + input').val('');
                    } else {
                        var name_file = res[0].name_file;
                        $(rel_to_set).find('.up_file_text + input[type="hidden"]').attr('value', res[0].file + '|' + res[0].name_dir + '|' + res[0].name_file);
                        $(rel_to_set).find('.up_file_text').text(name_file);
                    }

                    resetFile($("#control")); //reset file input

                    // в разі відміни додавання товару при першому заливані фоток, ми очищуємо папку якщо вона існує 1 раз
                    $('#to_file input[name="del"]').val('N');
                    //

                    // заміна зображення у редагувані товару
                    if($('input[name="update"]').length > 0){
                        if(res.error === undefined){
                            $(rel_to_set).find('.photos').removeClass('hidden');
                            $(rel_to_set).find('.photos img').attr('src', res[0].file)
                        } else {
                            $(rel_to_set).find('.photos').addClass('hidden');
                        }
                    }
                    //

                    // delete_file
                    var name_del_file = $(rel_to_set).find('.up_file_text + input[type="hidden"] + input[type="hidden"]').val();
                    if (name_del_file != "") {
                        $.ajax({
                            url: '/mylti_file/delete_file.php',
                            type: "POST",
                            data: {'del_file': name_del_file},
                        });
                    }
                }
            }
        });
    }
}