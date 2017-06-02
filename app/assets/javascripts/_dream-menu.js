$(function(){

  $(".tab").on("click", function(e){
    // Change active tab
    // $(this).toggleClass('active');
    $(".tab").removeClass('active');
    $(this).addClass('active');
    // Hide all tab-content (use class="hidden")
    $('.tab-content').addClass('hidden');
    // Show target tab-content (use class="hidden")
    var tar = $('.active').data("target");
    $(tar).removeClass('hidden');
  });
});