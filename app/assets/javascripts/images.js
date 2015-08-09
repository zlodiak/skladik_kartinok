$( document ).ready(function() {
  // image ajax events
  $(document).on('click', '.destroy_image', handlerDestroyImage);
  $(document).on('click', '.edit_image', handlerEditImageFormOutput);

  // editimage form output via ajax
  function handlerEditImageFormOutput(){
    var link = $(this),
        article = link.closest('article'),
        currentUserNameId = article.attr('data-current-user'),
        imageId = article.attr('data-image-id'),
        form = $(this).closest('form');

    $.ajax({
      url: '/get_image_data/' + imageId,
      type: 'GET',
      data: form.serialize(),
      success: function(image){
        $('#image_description_updte').val(image.description);
        $('#modalUpdateImage').modal();
      },
      error: function(xhr, ajaxOptions, thrownError){
        handleModal('Невозможно редактировать альбом', 'Ошибка на сервере. Повторите попытку через некоторое время. ', 'f00', 2000);
      }        
    })

    $(document).on('click', '#updateImageSubmit', handlerEditImageUpdate);

    // editalbum form send data to update-action 
    function handlerEditImageUpdate(e){
      e.preventDefault();

      $.ajax({
        url: '/images/' + imageId,
        type: 'PATCH',
        data: $('#update_image_form').serialize(),
        success: function(image){
          article.find('.description').html(image.description);
          $('#modalUpdateImage').modal('hide');
        },
        error: function(xhr, ajaxOptions, thrownError){
          errorText = handleConstructErrorMessage(xhr.responseText);
          handleModal('Альбом не создан', errorText, 'f00', 10000);
        }        
      })
    }        
  }   


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
        clearFieldsLoadForm();
        handleModal('Картинка добавлена', 'в альбом ' + data.album_title, '00ff2a', 2000);              
      },
      error: function(xhr, ajaxOptions, thrownError){
        errorText = handleConstructErrorMessage(xhr.responseText);
        handleModal('Альбом не создан', errorText, 'f00', 10000);
      } 
  }; 
   
  $('#new_image_direct').ajaxForm(options); 

  function clearFieldsLoadForm(){
    $('#image_image').val('');
    $('#image_album_id').val('');
    $('#image_description').val('');
  }

  // destroy image ajax handler
  function handlerDestroyImage(e){
    var link = $(this),
        article = link.closest('article'),
        currentUserNameId = article.attr('data-current-user'),
        imageId = article.attr('data-image-id');

    $.ajax({
      url: '/images/' + imageId,
      type: 'POST',
      data: { _method: 'DELETE' },
      success: function(result){
        article.fadeOut(300);
        handleModal('Удаление картинки прошло успешно', '', '00ff2a', 2000);
      },
      error: function(xhr, ajaxOptions, thrownError){
        handleModal('Удаление картинки завершилось с ошибкой', 'У вас не хватает прав. ' + xhr.status + ' error', 'f00', 2000);
      }        
    })
  }  
});


