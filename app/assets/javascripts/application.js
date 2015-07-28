// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .

$( document ).ready(function() {
    $('#about').on('click', function(e){
      e.preventDefault();
      $('#modalAbout').modal();
    });

    $('#rules').on('click', function(e){
      e.preventDefault();
      $('#modalRules').modal();
    });   

    // modals ajax
    // destroy album ajax
    $(document).on('click', '.destroy_album', handlerDestroy);

    function handlerDestroy(e){
      var link = $(this),
          td = link.closest('td'),
          tr = td.closest('tr'),
          currentUserNameId = link.closest('tbody').attr('data-current-user'),
          albumId = link.attr('data-album-id');

      $.ajax({
        url: '/users/' + currentUserNameId + '/albums/' + albumId,
        type: 'POST',
        data: { _method: 'DELETE' },
        success: function(result){
          tr.fadeOut(300);
          handleModal('album delete', 'is successfull', '00ff2a', 2000);
        },
        error: function(xhr, ajaxOptions, thrownError){
          handleModal('album delete', 'is failed. ' + xhr.status + ' error.', 'f00', 2000);
        }        
      })
    }

    // create album ajax
    $('#new_album').on('submit', function(e){
      e.preventDefault();

      var currentUserId = $(this).attr('data-current-user'),
          albumTitle = $('input#album_title').val();

      $.ajax({
        url: '/users/' + currentUserId + '/albums',
        type: 'POST',
        dataType: "JSON", 
        data: $('#new_album').serialize(),
        success: function(result){
          console.log(result);
          handleModal('album create', 'is successfull', '00ff2a', 2000);
          $('input#album_title').val('');
          $('#albumsList tbody').append('<tr> \
            <td>' + albumTitle + '</td> \
            <td></td> \
            <td></td> \
            <td><span class="destroy_album" data-album-id="' + result + '">destroy</span></td> \
          </tr>');
        },
        error: function(xhr, ajaxOptions, thrownError){
          handleModal('album create', 'is failed. ' + xhr.status + ' error.', 'f00', 2000);
        }        
      })
    });  

    // handle modal window
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


