$(function(){

  $(".tab-settings").on("click", function(e){
    e.preventDefault();
    // Change active tab
    // $(this).toggleClass('active');
    $(".tab-settings").removeClass('active');
    $(this).addClass('active');
    // Hide all tab-content (use class="hidden")
    $('.tab-content-settings').addClass('hidden');
    // Show target tab-content (use class="hidden")
    var tar = $('.active').data("target");
    $(tar).removeClass('hidden');
  });
});
