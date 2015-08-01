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
});


