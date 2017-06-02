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

$(function(){
  $(".btn").on("click", function(e){
    $(".btn").removeClass('active');
    $(this).addClass('active');
    $('.dream-card').addClass('hidden');
    var cat = $('.active.btn').text();
    $("." + cat).removeClass('hidden');
  });
});

$(function(){
  $(".tab.all").on("click", function(e){
    $('.dream-card').removeClass('hidden');
  });
});
