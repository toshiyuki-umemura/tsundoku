// タグのスライダー
$(document).ready(function(){
  
  if ($(window).width() > 900) {
    $('.slider').bxSlider({
      auto: true,
      pause:	5000,
      speed: 1000,
      slideWidth: 300,
      minSlides: 3,
      maxSlides: 2,
      moveSlides: 1,
      slideMargin: 20
    });
} else {
    $('.slider').bxSlider({
      auto: true,
      pause:	5000,
      speed: 1000,
      slideWidth: 300,
      minSlides: 1,
      maxSlides: 1,
      moveSlides: 1,
      slideMargin: 20
    });
}  

  $(document).on('mousedown','.bx-viewport a',function(){
    window.location.href = $(this).attr('href');
  });
});

// スライダーが表示されるまでの間、一瞬css表示だけの状態になるのを回避(cssとセット)
$(window).ready(function() {
  $('.bx-viewport').hide().fadeIn(0);
  });