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
        handleModal('Картинка не добавлена', errorText, 'f00', 10000);
      } 
  }; 
   
  $('#new_image').ajaxForm(options); 

  // detail image
  $('#thumbsList .thumb').on('click', function(){
    var imageId = $(this).closest('article').attr('data-image-id'),
        form = $(this).closest('form');

    $.ajax({
      url: '/images/' + imageId,
      type: 'GET',
      data: form.serialize(),
      success: function(image){
        console.log(image.url_giant);
        console.log(image.description);
        $('#detailImageFile').html('<img class="detail_image_img img-responsive" src=' + image.url_giant + ' alt="" id="detailImageImg" />');        
        $('#detailImageMeta').html(constructMeta(image));
        $('#modalDetailImage').modal();
      },
      error: function(xhr, ajaxOptions, thrownError){
        handleModal('Невозможно редактировать альбом', 'Ошибка на сервере. Повторите попытку через некоторое время. ' + xhr.status + ajaxOptions + thrownError, 'f00', 2000);
      }        
    });

    function constructMeta(image){
      var meta = '';
             
      meta = '<div class="row"> \
              <div class="col-xs-12"> \
                <strong class="title">Описание: </strong> \
                <div class="value">' + image.description +'</div> \
              </div> \
              <div class="col-xs-6"> \
                <strong class="title">Дата создания: </strong> \
                <div class="value">' + image.created_at +'</div> \
              </div> \
              <div class="col-xs-6"> \
                <strong class="title">Дата изменения: </strong> \
                <div class="value">' + image.updated_at +'</div> \
              </div> \
              <div class="col-xs-12"> \
                <strong class="title">Владелец: </strong> \
                <div class="value">' + image.owner +'</div> \
              </div> \
              ';

      return meta;
    };
  });

  // load image direct ajax
  var options = { 
      dataType: 'json',
      success: function(data) { 
        console.log('suss___');
        handleModal('Картинка добавлена', 'в альбом ' + data.album_title, '00ff2a', 2000);              
      },
      error: function(xhr, ajaxOptions, thrownError){
        console.log('error___' + xhr.staus + ajaxOptions + thrownError);
        errorText = handleConstructErrorMessage(xhr.responseText);
        handleModal('Альбом не создан', errorText, 'f00', 10000);
      } 
  }; 
   
  $('#new_image_direct').ajaxForm(options); 
});


