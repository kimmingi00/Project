var startHeightMin=788; //트리거 시작 스크롤 위치
var itemHeight=100; // 아이템별 높이
var itemMax=0; //현재 표시 아이템수
var itemLimit=0; // 모든 아이템 수
jQuery(window).scroll(function() {
itemLimit=jQuery('.btm2_item').length; // 모든 아이템수 btm2_item css class 가 표시될 객채 li
if(itemMax > itemLimit){ //표시 아이템 수가 모든 아이템수보다 높으면 작동 하지 말아야..
    return;
}
cehcksc();
});

function cehcksc(){
//#startdiv 는 해당 객채를 지나가면 작동을 한다 알맞게 변경 (트리거)
    if (jQuery(window).scrollTop() >= ((jQuery(document).height() - jQuery(window).height()) - jQuery('#startdiv').innerHeight())-100) {
          //console.log(jQuery(window).scrollTop()); // startHeightMin 찾기
        var docHeight=jQuery(window).scrollTop() - startHeightMin;
        var itemLength=Math.floor(docHeight/itemHeight); // 스크롤 위치에서 시작 스크롤 위치를 -,출력할 아이템수를 설정
        if(itemMax<itemLength){ // 수가 낮아 졌을때는 표시 안함
            itemMax=itemLength; // itemMax 갱신
            jQuery('.btm2_item').each(function(index,item){ //btm2_item
                if((itemMax-1) >= index){
                    if(jQuery(this).css("display") == "none"){
                        jQuery(this).fadeIn(2000);
                    }
                }
            });
        }

      }
}
