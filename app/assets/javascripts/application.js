//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require jquery-fileupload/basic
//= require cloudinary/jquery.cloudinary
//= require attachinary
//= require sweetalert2
//= require sweet-alert2-rails
//= require_tree .

$(function() {
  $('input[type=file]').on('change', function() {
    $("#filename").text($(this).val());
  });

  $('input[type=file]').on('dragenter', function() {
    $('.super-text-attach').addClass('dragover');
  });

  $('input[type=file]').on('dragleave', function() {
    $('.super-text-attach').removeClass('dragover');
  });
});





