//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require jquery-fileupload/basic
//= require cloudinary/jquery.cloudinary
//= require attachinary
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

// $(function(){
//   $('.btn-reveal').on('click', function(ev) {
//     $('.secret').addClass('hidden');
//     $('.reveal').removeClass('hidden');
//     $('.btn-reveal').addClass('hidden');
//   });
// });

// on page load...
// moveProgressBar();
// // on browser resize...
// $(window).resize(function() {
//   moveProgressBar();
// });

// // SIGNATURE PROGRESS
// function moveProgressBar() {
//   console.log("moveProgressBar");
//     var getPercent = ($('.progress-wrap').data('progress-percent') / 100);
//     var getProgressWrapWidth = $('.progress-wrap').width();
//     var progressTotal = getPercent * getProgressWrapWidth;
//     var animationLength = 900;

//         // on page load, animate percentage bar to data percentage length
//         // .stop() used to prevent animation queueing
//     $('.progress-bar').stop().animate({
//       left: progressTotal
//       }, animationLength);
//     }




