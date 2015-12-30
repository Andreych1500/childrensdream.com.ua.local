$(document).ready(function() {

    $(".top-menu ul li").each(function( index ) {
        var url = window.location.pathname;

        $(".top-menu li a").removeClass("active");
        $('.top-menu li a[href="'+url+'"]').addClass('active');
    });

    $('.add-shop .input-value input[name="name"]').keyup(function() {
        $('.add-shop .input-value input[name="seo_name"]').val((translit($('.add-shop .input-value input[name="name"]').val()))
            .replace(/\s/g, '-')
            .replace(/\*/g, '-')
            .replace(/\</g, '-')
            .replace(/\>/g, '-')
            .replace(/\//g, '-')
        );
    });


    // input click file
    $('.upload_file button').unbind('click').click(function(){
        var new_inp = $('#to_file').find('input[type="file"]');

        /// інформація для видалення попереднього елемента
        $(this).siblings('input[type="hidden"]').val($(this).siblings('input[type="hidden"]').val());
        ///

        if($('input[name="seo_name"]').val().length > 5) {
            $(new_inp).attr('rel_to_set', $(this).parents('.upload_file').attr('id')).trigger("click");
        } else {
            alert('Спочатку заповніть назву товару!')
        }
    });
});

function okFrom(){
   return confirm('Ви підтверджуєте свою дію?');
}

function addPhoto(el,stringValue){
    if(stringValue.length > 1){
        var dir_name = $('input[name="seo_name"]').val();
        var files = new FormData($('#to_file')[0]);
        files.append("directory", dir_name);
        files.append("del", $('#to_file input[name="del"]').val());

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
                    alert('Товар з такою назвою вже існує');
                } else {
                    if (res.error !== undefined) {
                        $(rel_to_set).find('.up_file_text').text('Загружайте лише фото!');
                    } else {
                        var name_file = res[0].name_file;
                        $(rel_to_set).find('.up_file_text + input[type="hidden"]').attr('value', res[0].file + '|' + res[0].name_dir + '|' + res[0].name_file);
                        $(rel_to_set).find('.up_file_text').text(name_file);
                    }

                    // в разі відміни додавання товару при першому заливані фоток, ми очищуємо папку якщо вона існує 1 раз
                    $('#to_file input[name="del"]').val('N');
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
