$( document ).ready(function() {
  // album ajax events
  $(document).on('click', '.destroy_poll', handlerDestroyPoll);
  //$(document).on('click', '.edit_poll', handlerEditPollFormOutput);



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


