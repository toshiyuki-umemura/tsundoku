// chips（タグをボタン化する）

document.addEventListener('DOMContentLoaded', function() {
  var elems = document.querySelectorAll('.chips');
  var options = {};
  var instances = M.Chips.init(elems, options);
});

$('.chips').chips();

var chip = {
  tag: 'chip content',
  image: '',
};