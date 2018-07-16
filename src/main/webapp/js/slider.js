var slider_count=3;
$(".slider-p-div").hide();
$("#slider-p0").show();
$(".hi-btn").hide();
$("#hi-btn0").show();
$(".active").animate({bottom:'0px'});
var slider_i=1;
var m_over=true;

function zx_slider(){
	if(m_over){
		if(slider_i<0){
			slider_i=slider_count;
		}
		//p
		$(".slider-p-div").hide();
		$("#slider-p"+slider_i).show();
		//p end
		//hi_btn
		$(".hi-btn").hide();
		$("#hi-btn"+slider_i).show();
		//hi_btn end
		//btn
		$(".liuc-line li").stop(true,true);
		$(".liuc-line li").removeClass("active");
		$(".liuc-line li").animate({bottom:'0px'},200);
		$("#btn-img"+slider_i).addClass("active");
		$("#btn-img"+slider_i).animate({bottom:'0px'},200);
		//btn end
		$(".imgbox").stop();
		$(".imgbox").animate({left:'-230'*slider_i+'px'});
		if(slider_i<slider_count){
			slider_i++;	
		}else{
			slider_i=0;
		}
	}
}

$(".prev").click(function(){
	m_over=true;
	if(slider_i==0){
		slider_i=slider_count-1
	}else{
		slider_i=slider_i-2;
	}
	zx_slider();
	m_over=false;
});

$(".next").click(function(){
	m_over=true;
	zx_slider();
	m_over=false;
});
zx_timer=setInterval("zx_slider();",5000); 