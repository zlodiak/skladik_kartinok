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

$(document).ready(function() {
    // main menu some punkts handlers
    $('#about').on('click', function(e){
      e.preventDefault();
      $('#modalAbout').modal();
    });

    $('#rules').on('click', function(e){
      e.preventDefault();
      $('#modalRules').modal();
    });   

    // top border offset
    checkOffsetTop();

    $(window).on('resize', checkOffsetTop);

    function checkOffsetTop(){
      var navbarHeight = $('.navbar').outerHeight(),
          offset = 0;

      if(navbarHeight > 51){
        offset = navbarHeight - 51;
      }
      else{
        offset = 0;
      }
      
      $('.content_container').css({'padding-top': offset + 'px'});
    }

    // slide add image form on show album page
    $('#addImageToggler').click(function(){
      $('#addImageForm').slideToggle();
    });


});

// helpers for ajax-requests

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