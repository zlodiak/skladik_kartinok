$( document ).ready(function() {
    // album ajax events
    $(document).on('click', '.destroy_album', handlerDestroyAlbum);
    $(document).on('click', '.edit_album', handlerEditAlbumFormOutput);

    // function(){ $('#modalEditAlbum').modal(); }

    // edit album form output ajax
    function handlerEditAlbumFormOutput(e){
      e.preventDefault();

      var link = $(this),
          article = link.closest('article'),
          currentUserNameId = article.attr('data-current-user'),
          albumId = article.attr('data-album-id');

      $.ajax({
        url: '/users/' + currentUserNameId + '/get_album_data/' + albumId,
        type: 'GET',
        data: $('form').serialize(),
        success: function(album){
          $('body').append(constructUpdateForm(album));
          $('#modalUpdateAlbum').modal();
          // fill form inputs
        },
        error: function(xhr, ajaxOptions, thrownError){
          handleModal('Невозможно редактировать альбом', 'Ошибка на сервере. Повторите попытку через некоторое время. ', 'f00', 2000);
        }        
      })
    }    

    function constructUpdateForm(album){
      var form ='';

      form = '<div class="modal fade" id="modalUpdateAlbum" tabindex="-1" role="dialog" aria-labelledby="modalAboutLabel"> \
                <div class="modal-dialog" role="document"> \
                  <div class="modal-content"> \
                    <div class="modal-header"> \
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button> \
                      <h4 class="modal-title" id="modalAboutLabel">Редактирование альбома</h4> \
                    </div> \
                    <form> \
                      <input name="_method" type="hidden" value="patch" /> \
                      <input name="utf8" type="hidden" value="&#x2713;" /> \
                      <input name="authenticity_token" type="hidden" value="??????????" /> \
                      <div class="modal-body row"> \
                        <div class="form-group col-xs-12"> \
                          <label for="album_title_update">Название</label> \
                          <input class="form-control title" type="text" name="album[title]" id="album_title_update" value="' + album.title + '" /> \
                        </div> \
                        <div class="form-group col-xs-12"> \
                          <label for="album_description_updte">Описание</label> \
                          <textarea rows="4" class="form-control" name="album[description]" id="album_description_updte">' + album.description + '</textarea> \
                        </div> \
                      </div> \
                      <div class="modal-footer"> \
                        <button type="button" class="btn btn-default" data-dismiss="modal">Закрыть</button> \
                        <button type="submit" class="btn btn-primary">Обновить</button> \
                      </div> \
                    </form> \
                  </div> \
                </div> \
              </div>';

      return form;
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
          var errorText = '';

          $.each(JSON.parse(xhr.responseText), function(key, val){
            errorText += (key+1) + '.' + val + '<br /><br />'
          })
          handleModal('Альбом не создан', errorText, 'f00', 10000);
        }        
      })
    });  

    // handle construct album teaser
    function handleConstructAlbumTeaser(currentUserId, album){
      var albumTeaser;

      albumTeaser = '<article class="col-xs-12 col-sm-6 col-md-4" data-current-user="' + currentUserId + '" data-album-id="' + album.id + '"> \
            <h3 class="title">' + album.title + '</h3> \
            <p class="body">' + album.description + '</p> \
            <p class="details"> \
              <a class="btn btn-default" href="/users/' + currentUserId + '/albums/' + album.id + '">Подробнее...</a> \
              <span class="glyphicon glyphicon-remove pull-right destroy_album"></span> \
            </p> \
          </article>';

      return albumTeaser;
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


