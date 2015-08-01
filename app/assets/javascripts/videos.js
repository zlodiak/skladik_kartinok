$( document ).ready(function() {
    // load image ajax
    $('#new_image').on('submit', function(e){
      e.preventDefault();

      var imageDescription = $('textarea#image_description');

      $.ajax({
        url: '/images',
        type: 'POST',
        dataType: "JSON", 
        data: $('#new_image').serialize(),
        success: function(image){
          console.log('im load suc');
          //$('#albumsList').prepend(handleConstructAlbumTeaser(currentUserId, album));
        },
        error: function(xhr, ajaxOptions, thrownError){
          errorText = handleConstructErrorMessage(xhr.responseText);
          handleModal('Альбом не создан', errorText, 'f00', 10000);
        }        
      })
    });  

    // construct error messages to html-format
    function handleConstructErrorMessage(errorsArray){
      var errorText = '';

      $.each(JSON.parse(errorsArray), function(key, val){
        errorText += (key+1) + '.' + val + '<br /><br />'
      })

      return errorText;
    }

    // handle modal window. for all ajax-requests
    function handleModal(title, body, colorHex, timeout){
      $('#titleModalInfo').html(title).css({'color': '#' + colorHex});
      $('#bodyModalInfo').html(body);
      $('#modalInfo').modal();

      setTimeout(deinitializationModalInfo, timeout)

      function deinitializationModalInfo(){
        $('#modalInfo').modal('hide');
        $('#titleModalInfo').empty();
        $('#bodyModalInfo').empty();
      };
    }
});


