$( document ).ready(function() {
  // album ajax events
  $(document).on('click', '.destroy_poll', handlerDestroyPoll);
  $(document).on('click', '.edit_poll', handlerEditPollFormOutput);

  // editpoll form output through ajax
  function handlerEditPollFormOutput(){
    var link = $(this),
        article = link.closest('article'),
        currentUserNameId = article.attr('data-current-user'),
        pollId = article.attr('data-poll-id');

    $.ajax({
      url: '/users/' + currentUserNameId + '/get_poll_data/' + pollId,
      type: 'GET',
      data: $('form').serialize(),
      success: function(poll){
        $('#poll_title_update').val(poll.title);
        $('#poll_description_updte').val(poll.description);
        $('#modalUpdatePoll').modal();
      },
      error: function(xhr, ajaxOptions, thrownError){
        handleModal('Невозможно редактировать голосование', 'Ошибка на сервере. Повторите попытку через некоторое время. ', 'f00', 2000);
      }        
    })

    $(document).on('click', '#updatePollSubmit', handlerEditPollUpdate);

    // editalbum form send data to update-action 
    function handlerEditPollUpdate(e){
      e.preventDefault();

      $.ajax({
        url: '/users/' + currentUserNameId + '/polls/' + pollId,
        type: 'PATCH',
        data: $('form').serialize(),
        success: function(poll){
          article.find('.title').html(poll.title);
          article.find('.body').html(poll.description);
          $('#modalUpdatePoll').modal('hide');
        },
        error: function(xhr, ajaxOptions, thrownError){
          errorText = handleConstructErrorMessage(xhr.responseText);
          handleModal('Голосование не создано', errorText, 'f00', 10000);
        }        
      })
    }        
  }   

  // destroy poll ajax handler
  function handlerDestroyPoll(e){
    e.preventDefault();

    var link = $(this),
        article = link.closest('article'),
        currentUserNameId = article.attr('data-current-user'),
        albumId = article.attr('data-poll-id');

    $.ajax({
      url: '/users/' + currentUserNameId + '/polls/' + albumId,
      type: 'POST',
      data: { _method: 'DELETE' },
      success: function(result){
        article.fadeOut(300);
        handleModal('Удаление голосования прошло успешно', '', '00ff2a', 2000);
      },
      error: function(xhr, ajaxOptions, thrownError){
        handleModal('Удаление голосования завершилось с ошибкой', 'У вас не хватает прав. ' + xhr.status + ' error', 'f00', 2000);
      }        
    })
  }  
});

