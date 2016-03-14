$(document).ready(function(){

    $('.back-menu').click(function(){
       $('.cancel').trigger('click');
    });


    // --- translition no spec simvol ---
    if($('input[name="code"]').length > 0) {
        $('.add-content .input-value input[name="name"]').keyup(function () {
            if ($('input[name="seo_name"]').val() === undefined) {
                $('.add-content .input-value input[name="code"]').val((translit($('.add-content .input-value input[name="name"]').val().toLowerCase()))
                    .replace(/\s/g, '-')
                    .replace(/\*/g, '-')
                    .replace(/\</g, '-')
                    .replace(/\>/g, '-')
                    .replace(/\//g, '-')
                    .replace(/\)/g, '')
                    .replace(/\(/g, '')
                );
            }
        });
    }
    // --- end translition no spec simvol ---

});


function getInfoFile(el){
    var new_inp = $('#to_file').find('input[type="file"]');

    $(new_inp).attr('rel_size', $(el).parents('.upload_file').attr('rel_size'));
    $(new_inp).attr('rel_to_set', $(el).parents('.upload_file').attr('id')).trigger("click");
}


function resetFile(control){
    control.replaceWith( control = control.clone( true ) );
}


function  cancel(){
    var del_files = [];

    $('.upload_file input[name^="del"]').each(function(i){
        if($(this).val() != '') {
            del_files[i] = $(this).val();
        }
    });

    if (del_files.length > 0){
        $.ajax({
            url: '/mylti_file/delete_file.php',
            type: "POST",
            data: {'del_file': del_files},
            success: function (response) {
                var res = JSON.parse(response);

                var url = window.location.pathname.split('/')[2];
                document.location.href = '/admin/'+url;
            }
        });
    }
}


function addPhoto(el, stringValue){
    if(stringValue.length > 1){
        var dir_name = $('input[name="dir_name"]').val();
        var files = new FormData($('#to_file')[0]);

        files.append("directory", dir_name);
        files.append('size', $(el).attr('rel_size'));

        if($('#to_file input[name="isset"]').length > 0){
            files.append("isset", $('#to_file input[name="isset"]').val());
        }

        var rel_to_set="#"+$(el).attr('rel_to_set');

        $.ajax({
            url: "/mylti_file/addPhoto.php",
            type: "POST",
            data: files,
            enctype: 'multipart/form-data',
            processData: false,
            contentType: false,
            success: function (response) {
                var res = JSON.parse(response);

                // delete_file
                var del_files = [];

                if($(rel_to_set).find('input[name^="del"]').val() != '') {
                    del_files[0] = $(rel_to_set).find('input[name^="del"]').val();
                }

                if (del_files.length > 0) {
                    $.ajax({
                        url: '/mylti_file/delete_file.php',
                        type: "POST",
                        data: {'del_file': del_files},
                    });
                }

                if (res.error !== undefined) {
                    $(rel_to_set).find('button + input').val('');
                    alert('Загружайте лише фото!');
                    $(rel_to_set).find('button').text('Вибрати файл');
                } else {
                    var name_file = res[0].name_file;
                    $(rel_to_set).find('button + input[type="hidden"]').attr('value', res[0].file + '|' + res[0].name_dir + '|' + res[0].name_file);
                    $(rel_to_set).find('button').text(name_file);

                    $(rel_to_set).find('input[name^="del"]').val(res[0].file + '|' + res[0].name_dir + '|' + res[0].name_file);
                }

                resetFile($("#control")); //reset file input

                // --- update image ---
                if($('input[name="update"]').length > 0){
                    if(res.error === undefined){
                        $(rel_to_set).find('.photos').removeClass('hidden');
                        $(rel_to_set).find('.photos img').attr('src', res[0].file)
                    } else {
                        $(rel_to_set).find('.photos').addClass('hidden');
                    }
                }
                // --- end update image ---
            }
        });
    }
}