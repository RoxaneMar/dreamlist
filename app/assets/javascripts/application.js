//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require jquery-fileupload/basic
//= require cloudinary/jquery.cloudinary
//= require attachinary
//= require_tree .

$('input[type=file]').on('change', function() {
  $("#filename").text($(this).val());
});

$('input[type=file]').on('dragenter', function() {
  $('.super-text-attach').addClass('dragover');
});

$('input[type=file]').on('dragleave', function() {
  $('.super-text-attach').removeClass('dragover');
});

$(function(){
  $('.btn-reveal').on('click', function(ev) {
    $('.participation-bar').addClass('hidden');
    $('.participation-bar-revealed').removeClass('hidden');
    $('.secret').addClass('hidden');
    $('.reveal').removeClass('hidden');
  });
});
