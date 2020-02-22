// トップページのBookをめくる際の動作制御（一部）

var windowWidth = $(window).width();
var windowMaxNextSize = 1000;
var windowMaxSmallSize = 700;
if (windowWidth >= windowMaxNextSize) {
  $(function(){
    $("#flipbook").turn({
      width: 700,
      height: 455,
      elevation: 50,
      gradients: true,
      autoCenter: true,
    });
  })
} else if (windowWidth >= windowMaxSmallSize) {
  $(function(){
    $("#flipbook").turn({
      width: 500,
      height: 325,
      elevation: 50,
      gradients: true,
      autoCenter: true,
    });
  })
} else {
  $(function(){
    $("#flipbook").turn({
      width: 300,
      height: 200,
      elevation: 50,
      gradients: true,
      autoCenter: true,
    });
  })
}

// リサイズ時にリロード
$(function(){
  var timer = false;
  var prewidth = $(window).width()
  $(window).resize(function() {
      if (timer !== false) {
          clearTimeout(timer);
      };
      timer = setTimeout(function() {
          var nowWidth = $(window).width()
          if(prewidth !== nowWidth){
              location.reload();
          };
          prewidth = nowWidth;
      }, 200);
  });
});