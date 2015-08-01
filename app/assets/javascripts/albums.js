$( document ).ready(function() {
    // album ajax events
    $(document).on('click', '.destroy_album', handlerDestroyAlbum);
    $(document).on('click', '.edit_album', handlerEditAlbumFormOutput);

    // editalbum form output through ajax
    function handlerEditAlbumFormOutput(){
      var link = $(this),
          article = link.closest('article'),
          currentUserNameId = article.attr('data-current-user'),
          albumId = article.attr('data-album-id');

      $.ajax({
        url: '/users/' + currentUserNameId + '/get_album_data/' + albumId,
        type: 'GET',
        data: $('form').serialize(),
        success: function(album){
          $('#album_title_update').val(album.title);
          $('#album_description_updte').val(album.description);
          $('#modalUpdateAlbum').modal();
        },
        error: function(xhr, ajaxOptions, thrownError){
          handleModal('Невозможно редактировать альбом', 'Ошибка на сервере. Повторите попытку через некоторое время. ', 'f00', 2000);
        }        
      })

      $(document).on('click', '#updateAlbumSubmit', handlerEditAlbumUpdate);

      // editalbum form send data to update-action 
      function handlerEditAlbumUpdate(e){
        e.preventDefault();

        $.ajax({
          url: '/users/' + currentUserNameId + '/albums/' + albumId,
          type: 'PATCH',
          data: $('form').serialize(),
          success: function(album){
            article.find('.title').html(album.title);
            article.find('.body').html(album.description);
            $('#modalUpdateAlbum').modal('hide');
          },
          error: function(xhr, ajaxOptions, thrownError){
            errorText = handleConstructErrorMessage(xhr.responseText);
            handleModal('Альбом не создан', errorText, 'f00', 10000);
          }        
        })
      }        
    }   

    // destroy album ajax handler
    function handlerDestroyAlbum(e){
      e.preventDefault();

      var link = $(this),
          article = link.closest('article'),
          currentUserNameId = article.attr('data-current-user'),
          albumId = article.attr('data-album-id');

      $.ajax({
        url: '/users/' + currentUserNameId + '/albums/' + albumId,
        type: 'POST',
        data: { _method: 'DELETE' },
        success: function(result){
          article.fadeOut(300);
          handleModal('Удаление альбома прошло успешно', '', '00ff2a', 2000);
        },
        error: function(xhr, ajaxOptions, thrownError){
          handleModal('Удаление альбома завершилось с ошибкой', 'У вас не хватает прав. ' + xhr.status + ' error', 'f00', 2000);
        }        
      })
    }

    // create album ajax
    $('#new_album').on('submit', function(e){
      e.preventDefault();

      var currentUserId = $(this).attr('data-current-user'),
          albumTitle = $('input#album_title'),
          albumDescription = $('textarea#album_description');

      $.ajax({
        url: '/users/' + currentUserId + '/albums',
        type: 'POST',
        dataType: "JSON", 
        data: $('#new_album').serialize(),
        success: function(album){
          handleModal('Альбом создан', '', '00ff2a', 2000);
          albumTitle.val('');
          albumDescription.val('');
          $('#albumsList').prepend(handleConstructAlbumTeaser(currentUserId, album));
        },
        error: function(xhr, ajaxOptions, thrownError){
          errorText = handleConstructErrorMessage(xhr.responseText);
          handleModal('Альбом не создан', errorText, 'f00', 10000);
        }        
      })
    });  

    // handle construct album teaser to html-format
    function handleConstructAlbumTeaser(currentUserId, album){
      var albumTeaser;

      albumTeaser = '<article class="col-xs-12 col-sm-6 col-md-4" data-current-user="' + currentUserId + '" data-album-id="' + album.id + '"> \
            <h3 class="title">' + album.title + '</h3> \
            <p class="body">' + album.description + '</p> \
            <p class="details"> \
              <a class="btn btn-default" href="/users/' + currentUserId + '/albums/' + album.id + '">Подробнее...</a> \
              <span class="glyphicon glyphicon-remove pull-right destroy_album"></span> \
              <span class="glyphicon glyphicon-edit pull-right edit_album"></span> \
            </p> \
          </article>';

      return albumTeaser;
    }

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


