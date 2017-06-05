$(function(){

  $(".tab").on("click", function(e){
    e.preventDefault();
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

  $(".btn").on("click", function(e){
    e.preventDefault();
    $(".btn").removeClass('active');
    $(this).addClass('active');
    $('.dream-card').parent().addClass('hidden');
    var cat = $('.active.btn').text();
    $("." + cat).parent().removeClass('hidden');
  });

  $(".tab").on("click", function(e){
    e.preventDefault();
    $('.dream-card').parent().removeClass('hidden');
  });
});
