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
});


