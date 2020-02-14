// トップ画面に初回のみポップを表示させる

$(function(){
        $(".containers").show();
        $.cookie('btnFlg') == 'on'?$(".containers").hide():$(".containers").show();
        $(".containers__neumo__card--button").click(function(){
            $(".containers").fadeOut();
            $.cookie('btnFlg', 'on', { expires: 1, path: '/' });
        });
    });