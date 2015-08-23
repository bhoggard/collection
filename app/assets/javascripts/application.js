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
//= require turbolinks
//= require bootstrap-sprockets

// for copyright notice
$(function() {
  $("a#why-small").click(function() {
    if($(this).data('dont')==1) return;
    $(this).after(' Thumbnails are shown because we do not have permission to publish larger images. ' + 
    'If you own the publication rights to this work, please <a href="/page/contact">contact us</a>.');
    $(this).data('dont',1);
    return false;
  });
});

$(document).keydown(function(e){
  if(e.which == 37 || e.which == 39) {
    e.preventDefault();
    if (e.which == 37) // left
      link = $('#prev');
    else
      link = $('#next');
    if (link.length == 1) {
      window.location = link.attr('href');
    }
  }
});