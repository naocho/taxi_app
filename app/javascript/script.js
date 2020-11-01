// app/javascript/script.js

$(function() {
  //$(function() {});この記述がページ全体を読み込む記述
  $(".testcolor").css("color","green");
})

$(function() {
  // 「#language-wrapper」にhoverしたときのhoverイベントを作成してください
  $("#language-wrapper").hover(
    function(){
      $(".testcolor").fadeIn();
    },
    function(){
      $(".testcolor").fadeOut();
    }
    );
  
});

// $(function(){
//   $('#srid-item').slideUp(1500)
// });