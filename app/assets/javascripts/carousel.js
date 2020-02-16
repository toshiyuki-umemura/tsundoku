// タグのスライダー
$(document).ready(function(){
  
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

  $(document).on('mousedown','.bx-viewport a',function(){
    window.location.href = $(this).attr('href');
  });
});


// トップページに戻る「積読スッキリ!!」をクリックした際に、sliderが崩れるため、リロードさせてそれを回避
$(function(){
  $(".top__header__menu--figure1").click(function(){
    location.href= "/";
    location.reload();
  }); 
});

// スライダーが表示されるまでの間、一瞬css表示だけの状態になるのを回避(cssとセット)
$(window).load(function() {
  $('.bx-viewport').fadeIn(0); 
  });