$(function(){
  $("#input-text").on("keyup", function() {
    let countNum = String($(this).val().length);
    $("#counter").text("現在の入力文字数：" + countNum + "文字");
  });
 });