$(function() {
  $('body:not(.search)').on('click', function(ev) {
    // ev.stopPropagation();
    // if ($('#search-input').hasClass('visible')) {
    //   console.log('remove class');
    //   $('#search-input').removeClass('visible');
    // }
  });

  $('.search').on('click', function(e) {
    e.stopPropagation();
    $('#search-input').addClass('visible').focus();
  });

  $(document).on('click', function(e) {
    $('#search-input').removeClass('visible').val();
  });
})
