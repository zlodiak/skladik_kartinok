$( document ).ready(function() {
  // load image ajax
  var options = { 
      target: '#image_image',
      dataType: 'json',
      success: function() { 
        var imageField = $('#image_image');

        imageField.replaceWith(imageField = imageField.clone(true));
        $('#image_description').val('');
        // $('#thumbsList').prepend($('<div>fuck. to do</div>'));
        handleModal('Картинка добавлена', '', '00ff2a', 2000);
        setTimeout( function(){ location.reload(); } , 2000)                
      },
      error: function(xhr, ajaxOptions, thrownError){
        errorText = handleConstructErrorMessage(xhr.responseText);
        handleModal('Альбом не создан', errorText, 'f00', 10000);
      } 
  }; 
   
  $('#new_image').ajaxForm(options); 

  // detail image
  $('#thumbsList .thumb').on('click', function(){
    var imageId = $(this).closest('article').attr('data-image-id'),
        form = $(this).closest('form');

    console.log(3333333333333);
    console.log($(this));
    console.log(111111111111);
    console.log(form);
    console.log(22222222222);
    console.log(form.attr('action'));

    $.ajax({
      url: '/images/' + imageId,
      type: 'GET',
      data: form.serialize(),
      success: function(image){
        console.log(image);
        //console.log(image.id);
        //console.log(image.description);
        // $('#modalDetailImage .detail_image_file').append('<img src=' + image.image.url(:) + '>');
        $('#modalDetailImage').modal();
      },
      error: function(xhr, ajaxOptions, thrownError){
        handleModal('Невозможно редактировать альбом', 'Ошибка на сервере. Повторите попытку через некоторое время. ' + xhr.status + ajaxOptions + thrownError, 'f00', 2000);
      }        
    })
  });
});


